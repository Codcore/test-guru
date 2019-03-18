class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show update edit destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def start
    @test = Test.find(params[:id])
    @current_user.tests.push(@test)
    redirect_to @current_user.test_passage(@test)
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
