class RemoveReferencesQuestionQuestionTag < ActiveRecord::Migration[7.0]
  def change
    remove_reference :question_tags, :question, index: true, foreign_key: true
  end
end
