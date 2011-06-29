# bump........
class UberWorker < SimpleWorker::Base

  def run
    log "hello!"
#    log "Rails is " + Rails.inspect
#    Rails.env
    log 3.seconds.ago
    log 'mini_fb? ' + MiniFB.scopes.inspect

    # This tests different require statement in Gemfile
    log 'rest-client? ' + RestClient.get("http://www.github.com").inspect
  end

end
