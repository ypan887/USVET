class AddAdminUserToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :admin_user, foreign_key: true
  end
end
