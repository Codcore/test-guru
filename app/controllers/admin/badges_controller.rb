class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new; end
  def create; end
  def edit; end
  def update; end
  def destroy; end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :file_name)
  end
end
