class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: "Question"

  def self.to_tree
    answers = all.includes(:question, :next_question)
    tree = answers.inject({}) do |result, a|
      result["answers_#{a.id}"] = a.answer_node
      result["questions_#{a.question_id}"] = a.question_node unless result.has_key?("questions_#{a.question_id}")      
      if a.next_question_id
        next_question = result["questions_#{a.next_question_id}"]
        next_question["parent"] = "answers_#{a.id}" if next_question
        result["questions_#{a.next_question_id}"] ||= a.next_question_node
      end
      result
    end
    tree.values
  end

  def answer_node
    { "name" => "answers_#{id}", "parent"=>"questions_#{question_id}", "text"=> content }
  end

  def question_node
    { "name" => "questions_#{question_id}", "text"=> question.content }
  end

  def next_question_node
    { "name" => "questions_#{next_question_id}", "parent"=>"answers_#{id}", "text"=> next_question.content }
  end
end