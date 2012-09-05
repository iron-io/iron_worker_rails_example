class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
    @client||= IronWorkerNG::Client.new
  end
end
