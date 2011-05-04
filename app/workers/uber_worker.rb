class UberWorker < SimpleWorker::Base

  def run
    log "hello!"
#    log "Rails.env=#{Rails.env}"
  end

end