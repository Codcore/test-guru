class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show
    render plain: @question.body
  end

  def destroy
    @test.questions.destroy(@question)
    redirect_to test_questions_path(@test)
  end

  def new; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_question_path(@test, question)
    else
      response.status = 400
      render plain: 'Bad Request'
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    response.status = 404
    render plain: 'Question not found'
  end
end
