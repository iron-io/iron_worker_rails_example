class User < ActiveRecord::Base
  def self.get_default_message
    'Message from model'
  end
end