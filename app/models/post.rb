class Post < ApplicationRecord
  validates_presence_of :content
  validates_presence_of :question_id
  validates_presence_of :end_question
  validate :with_next_question, :end_of_question, :question_loop

  belongs_to :admin_user

  scope :recent_posts, -> { order(created_at: :desc).limit(5) }
  scope :archives, -> { 
    all.group_by{|t| t.created_at.beginning_of_month.strftime("%Y-%B")}
  }

  ransacker :user_name_eq,
            :formatter => ->(n) {
              AdminUser.where(user_name: name).id
            } do |parent|
              parent.table[:id]
            end

private
  def with_next_question 
    if !end_question && next_question_id
      errors.add(:next_question_id, "please specify next question") unless next_question_id
      errors.add(:value, "this answer do not need value") if value
    end
  end

  def end_of_question
    if end_question
      errors.add(:value, "please specify the result content") if value.nil?
      errors.add(:next_question_id, "this answer is the end result") if next_question_id
    end
  end

  def question_loop
    if next_question_id && next_question_id == question_id
      errors.add(:next_question_id, "please choose another question to avoid infinite loop")
    end 
  end
end
