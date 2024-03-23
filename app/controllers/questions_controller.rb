class QuestionsController < ApplicationController
  before_action :load_question, only: %i[edit update]

  def index
    @questions = Question.all
  end

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

  def edit
    @question.answers.build if @question.answers.blank?
  end

  def update
    @question.assign_attributes(question_params)

    if @question.save
      redirect_to questions_path
    else
      render :edit
    end
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(Question::CREATE_ATTRIBUTES)
  end
end
