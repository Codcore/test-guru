class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_badges = current_user.badges.all
    @badges = Badge.all
  end

  def show; end
end
