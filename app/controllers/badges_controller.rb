class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = current_user.badges.all
  end

  def show; end
end
