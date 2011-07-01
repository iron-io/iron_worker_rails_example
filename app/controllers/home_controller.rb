class HomeController < ApplicationController
  def index
    worker = UberWorker.new
    worker.db_config = Rails.configuration.database_configuration[Rails.env]
    p worker
    worker.queue(:priority=>1)
  end


end
