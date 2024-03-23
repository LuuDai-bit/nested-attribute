class Answer < ApplicationRecord
  CREATE_ATTRIBUTES = %i[answer]

  belongs_to :question
end
