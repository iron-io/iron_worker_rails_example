class HomeController < ApplicationController
  def index
    worker = UberWorker.new
    p worker
    worker.queue
  end


end
