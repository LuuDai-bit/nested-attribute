class Question < ApplicationRecord
  CREATE_ATTRIBUTES = [:id, :question, :require_flg, :question_type,
                       { answers_attributes: Answer::CREATE_ATTRIBUTES },
                       { question_tags_attributes: QuestionTag::CREATE_ATTRIBUTES }].freeze

  has_many :answers
  has_many :question_question_tags
  has_many :question_tags, through: :question_question_tags

  accepts_nested_attributes_for :answers, allow_destroy: true
  accepts_nested_attributes_for :question_tags, allow_destroy: true

  def question_tags_attributes=(attributes)
    self.question_tags = BuildQuestionTagsAttributesService.run(attributes)
  end
end
