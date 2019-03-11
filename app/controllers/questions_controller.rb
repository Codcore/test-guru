class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create index new]
  before_action :find_question, only: %i[show destroy edit update]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def edit; end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question_path(question)
    else
      response.status = 400
      render plain: 'Bad Request'
    end
  end

  def update
    if @question.update(question_params)
      puts 'here'
      redirect_to @question
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    response.status = 404
    render plain: 'Question not found'
  end
end
