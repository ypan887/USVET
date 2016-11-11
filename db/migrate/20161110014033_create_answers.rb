class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :end_question
      t.text :value
      t.integer :next_question_id, index: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
