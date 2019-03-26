class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show update edit destroy start]

  def index
    flash.now[:notice] = "Hello, #{current_user.first_name} #{current_user.last_name} !"
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
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
