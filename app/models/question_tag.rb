class QuestionTag < ApplicationRecord
  CREATE_ATTRIBUTES = %i[id tag_name _destroy].freeze

  belongs_to :question
end
