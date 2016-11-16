class Post < ApplicationRecord
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
end
