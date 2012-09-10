require "action_mailer"
require "active_record"
#require 'mysql2' # you need to require your database adapter
require 'simple_mailer.rb'
require 'models/user.rb' #require all needed models

def init_mailer
  #Need to convert to proper hashes
  mailer_config = params['mailer'].inject({}) { |memo, (k, v)| memo[k.to_sym] = v; memo }
  # set default views dir to current dir
  ActionMailer::Base.prepend_view_path('.')
  ActionMailer::Base.smtp_settings = mailer_config
  ActionMailer::Base.delivery_method = :smtp
end

def setup_database
  puts "Database connection details:#{params['database'].inspect}"
  return unless params['database']
  # estabilsh database connection
  #ActiveRecord::Base.establish_connection(params['database'])
end

#-------------------Main worker code---------------------------
init_mailer
setup_database
puts "I got '#{params.inspect}' parameters"
#send email!
# you could use here any active_record queries with models
SimpleMailer.welcome_email(params['email'], params['message'] + User.get_default_message).deliver!

