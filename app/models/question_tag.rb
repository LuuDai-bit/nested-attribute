class QuestionTag < ApplicationRecord
  CREATE_ATTRIBUTES = %i[tag_name].freeze

  belongs_to :question
end
