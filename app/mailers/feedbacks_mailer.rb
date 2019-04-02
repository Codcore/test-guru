class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @title = feedback.title
    @email = feedback.email
    @text  = feedback.text

    mail to: feedback.admin_email, subject: "New feedback: #{@title}"
  end
end
