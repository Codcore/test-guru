class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :start

  def index
    return redirect_to admin_tests_path if current_user.admin?
    if current_user && !session[:welcome]
      flash.now[:notice] = "Welcome, #{current_user.first_name} #{current_user.last_name} !"
      session[:welcome] = true
    end
    puts current_user.first_name
    puts current_user.last_name
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
