# bump.......
class MailWorker < SimpleWorker::Base

  attr_accessor :post_id, :to

  def run
    log 'running...'
    @post = Post.find(post_id)
    log Mailer.send_post(@post, "to@example.com").deliver!
  end

end
