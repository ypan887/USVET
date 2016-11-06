class Post < ApplicationRecord
  belongs_to :admin_user

  scope :user_name_eq, -> (id) { where("admin_user_id = ?", id) }
  ransacker :user_name_eq,
    formatter: proc { |id|
      Self.where("admin_user_id = ?", id)
    }
  
  
end