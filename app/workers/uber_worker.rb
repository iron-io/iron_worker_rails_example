# bump....................
class UberWorker < SimpleWorker::Base

  attr_accessor :db_config

  def run
    log "hello!"
#    log "Rails is " + Rails.inspect
    log "env: #{Rails.env}"
    log "version: #{Rails.version}"
    log "database: #{db_config.inspect}"

    log 3.seconds.ago
    log 'mini_fb? ' + MiniFB.scopes.inspect

    # This tests different require statement in Gemfile
    log 'rest-client? ' + RestClient.get("http://www.github.com").inspect
  end

end
