class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index, show]
  before_action :find_question, only: %i[show]

  def index
    render inline: '<h1><%= @test.title %></h1><ul><% @test.questions.each do |q| %><li><%= q.body %><% end %>'
  end

  def show
    render plain: @question.body
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.all[params[:id].to_i - 1]
  end
end
