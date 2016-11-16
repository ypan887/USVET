class RemoveEndPageAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :end_question
  end
end
