class Post < ApplicationRecord
  belongs_to :admin_user

  scope :recent_posts, -> { order(created_at: :desc).limit(5) }
  ransacker :user_name_eq,
            :formatter => ->(n) {
              AdminUser.where(user_name: name).id
            } do |parent|
              parent.table[:id]
            end
end