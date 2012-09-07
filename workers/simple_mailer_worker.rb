require "action_mailer"
require 'simple_mailer.rb'

#configuring up mailer
def init_mailer
  #Need to convert to proper hashes
  mailer_config = params['mailer'].inject({}) { |memo, (k, v)| memo[k.to_sym] = v; memo }
  ActionMailer::Base.prepend_view_path('.')
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.smtp_settings = mailer_config
  ActionMailer::Base.delivery_method = :smtp
end

#-------------------Main worker code---------------------------
init_mailer
puts "I got '#{params.inspect}' parameters"
#send email!
SimpleMailer.welcome_email(params['email'], params['message']).deliver!

