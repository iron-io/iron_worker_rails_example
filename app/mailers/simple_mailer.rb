class SimpleMailer < ActionMailer::Base
  default from: "support@iron.io"
  def welcome_email(email,message)
    @message = message
    mail(:to => email, :subject => "IronWorker SimpleMailer")
  end
end
