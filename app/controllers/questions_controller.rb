class QuestionsController < ApplicationController
  def index; end

  def new
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(Question::CREATE_ATTRIBUTES)
  end
end
