class UberWorker < SimpleWorker::Base

  def run
    log "hello!"
  end

end