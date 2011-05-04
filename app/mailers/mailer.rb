class Mailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_post(post)
    @post = post
    mail(:to=>ENV['GMAIL_USER']+ "@gmail.com",
    :subject=>"Post: #{@post.title}")

  end

end
