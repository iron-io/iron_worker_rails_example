class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
    IW_CLIENT
  end
end
