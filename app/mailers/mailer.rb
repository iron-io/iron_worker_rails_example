class Mailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_post(post, to)
    @post = post
    mail(:to=>to,
    :subject=>"Post: #{@post.title}",:body=>"Hey i'm from mailer'")
  end

end
