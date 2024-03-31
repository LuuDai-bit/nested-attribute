class AddUniqueQuestionTagTagName < ActiveRecord::Migration[7.0]
  def change
    add_index :question_tags, :tag_name, unique: true
  end
end
