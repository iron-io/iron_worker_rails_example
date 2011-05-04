class MailWorker < SimpleWorker::Base

  attr_accessor :post_id

  def run

    @post = Post.find(post_id)

    Mailer.send_post()

  end

end