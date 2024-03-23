class Answer < ApplicationRecord
  CREATE_ATTRIBUTES = %i[id answer _destroy]

  belongs_to :question
end
