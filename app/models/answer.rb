class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: "Question"
  validates_presence_of :content
  validates_presence_of :question_id
  validates_presence_of :value, unless: :next_question_id
  validate :question_loop


  def self.to_tree
    answers = all.includes(:question, :next_question)
    tree = answers.inject({}) do |result, a|
      result["questions_#{a.question_id}"] = a.question_node unless result.has_key?("questions_#{a.question_id}")      
      if a.next_question_id
        next_question = result["questions_#{a.next_question_id}"]
        next_question["parent"] = "questions_#{a.question_id}" if next_question
        result["questions_#{a.next_question_id}"] ||= a.next_question_node
      end
      result
    end
    tree.values
  end

  def question_node
    { "name" => "questions_#{question_id}", "text"=> question.content }
  end

  def next_question_node
    { "name" => "questions_#{next_question_id}", "parent" => "questions_#{question_id}", "text"=> next_question.content }
  end

private
  def question_loop
    if next_question_id && (next_question_id == question_id)
      errors.add(:next_question_id, "please choose another question to avoid infinite loop")
    end 
  end
end