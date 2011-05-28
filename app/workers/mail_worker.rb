class MailWorker < SimpleWorker::Base

  attr_accessor :post_id

  def run

    log 'running...'

    @post = Post.find(post_id)

    log 'post=' + @post.inspect

    Mailer.send_post()

  end

end