class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :question, null: false
      t.boolean :is_solved, default : false
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
