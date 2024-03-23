class Answer < ApplicationRecord
  CREATE_ATTRIBUTES = [:id, :answer, :_destroy,
                       answer_details_attributes: AnswerDetail::CREATE_ATTRIBUTES]

  has_many :answer_details
  belongs_to :question

  accepts_nested_attributes_for :answer_details, allow_destroy: true
end
