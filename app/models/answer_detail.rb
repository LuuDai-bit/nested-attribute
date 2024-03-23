class AnswerDetail < ApplicationRecord
  CREATE_ATTRIBUTES = %i[id detail _destroy]

  belongs_to :answer
end
