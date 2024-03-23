class Question < ApplicationRecord
  CREATE_ATTRIBUTES = [:id, :question, :require_flg, :question_type,
                       answers_attributes: Answer::CREATE_ATTRIBUTES]

  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
