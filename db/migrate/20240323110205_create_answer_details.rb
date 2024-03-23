class CreateAnswerDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_details do |t|
      t.string :detail, null: false
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
