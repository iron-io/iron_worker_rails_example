class Mailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_post(post, to)
    @post = post
    mail(:to=>to,
    :subject=>"Post: #{@post.title}")

  end

end
