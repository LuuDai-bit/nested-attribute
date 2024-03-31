class QuestionTag < ApplicationRecord
  CREATE_ATTRIBUTES = %i[id tag_name _destroy].freeze

  has_many :question_question_tags
end
