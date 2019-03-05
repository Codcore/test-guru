class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]

  def index
    questions = @test.questions.map(&:body).join("\n")
    render plain: questions
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
