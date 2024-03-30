class CreateQuestionTags < ActiveRecord::Migration[7.0]
  def change
    create_table :question_tags do |t|
      t.string :tag_name, null: false

      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
