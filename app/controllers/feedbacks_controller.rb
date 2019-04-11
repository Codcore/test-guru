class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbacksMailer.send_feedback(@feedback).deliver_now
      flash[:success] = 'Feedback успешно отправлен администратору.'
      redirect_to root_path
    else
      flash[:alert] = @feedback.errors.full_messages.first
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :email, :text)
  end
end
