class HomeController < ApplicationController
  def index
    worker = UberWorker.new
    p worker
    worker.queue(:priority=>1)
  end


end
