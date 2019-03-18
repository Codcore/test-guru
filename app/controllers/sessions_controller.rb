class SessionsController < ApplicationController
  before_action :authenticate_user!, only: %i[destroy]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:redirect_path]
    else
      alert = 'Are you a Guru? Verify your email and password please'
      redirect_to login_path, alert: alert
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
