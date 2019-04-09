require_relative '../services/gist_question_service'
require_relative '../services/badge_service'

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]

  def show; end

  def result
    new_badges = BadgeService.new(@test_passage).call
    new_badges_msg = new_badges.map { |b| "Вы получили медаль '#{b.name}' " }.join("\n")
    flash.now[:notice] = new_badges_msg
  end

  def gist
    @result   = GistQuestionService.new(@test_passage.current_question).call
    @gist_url = @result[:html_url]
    if Octokit.last_response
      flash_options = { alert: t('.failure') }
    else
      current_user.gists.create(url: @result[:id], question: @test_passage.current_question)
      flash_options = { notice: t('.success_html', url: view_context.link_to(t('.gist_href'), @gist_url, class: "alert-link")) }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
