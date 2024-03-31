class BuildQuestionTagsAttributesService < BaseService
  def initialize(attributes)
    @attributes = attributes
  end

  def run
    return [] if attributes.blank?

    tag_names = attributes.map do |_, attribute|
      attribute[:tag_name]
    end

    question_tags = get_question_tags(tag_names)

    question_tag_attributes = []
    attributes.each do |_, attribute|
      next if attribute[:_destroy] == 'true' || attribute[:_destroy] == '1'

      question_tag = question_tags.find do |qt|
        qt.tag_name == attribute[:tag_name]
      end

      question_tag = QuestionTag.new(attribute.except(:_destroy)) if question_tag.blank?
      question_tag_attributes << question_tag
    end

    question_tag_attributes
  end

  private

  attr_reader :attributes

  def get_question_tags(tag_names)
    QuestionTag.where(tag_name: tag_names)
  end
end
