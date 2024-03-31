class CreateQuestionQuestionTag < ActiveRecord::Migration[7.0]
  def change
    create_table :question_question_tags do |t|
      t.references :question, null: false, foreign_key: true
      t.references :question_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
