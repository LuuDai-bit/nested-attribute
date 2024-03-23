class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.boolean :require_flg, null: false
      t.integer :question_type, null: false, default: 0

      t.timestamps
    end
  end
end
