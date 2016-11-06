class AddUserNameToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :user_name, :string
  end
end
