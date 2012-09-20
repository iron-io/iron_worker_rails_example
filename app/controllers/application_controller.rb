class ApplicationController < ActionController::Base
  protect_from_forgery

  def client
    Rails.application.config.iw_client
  end
end
