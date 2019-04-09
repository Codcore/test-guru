class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    # badge_params[:type] = 'Badges::' + badge_params[:type].to_s
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    # badge_params[:type] = 'Badges::' + badge_params[:type].to_s
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :file_name, :type)
  end
end
