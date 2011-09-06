require File.expand_path('../boot', __FILE__)

require 'rails/all'
#%w(
#  action_controller
#  action_mailer
#  active_resource
#  rails/test_unit
#).each do |framework|
#  begin
#    require "#{framework}/railtie"
#  rescue LoadError
#  end
#end


# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module SimpleWorkerRailsExample
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #SimpleWorker.logger.level = Logger::DEBUG

    require 'open-uri'

    @private_config = YAML.load_file('config/private.yml')
    p @private_config
    if @private_config['yml_url']
      @private_config.merge!(YAML.load(open(@private_config['yml_url'])))
    end
    p @private_config
    config.private_config = @private_config

    unless @private_config['gmail']
      raise "You must have gmail configuration setup in private.yml, see README."
    end
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => "smtp.gmail.com",
        :port => 587,
        :domain => 'gmail.com',
        :user_name => @private_config['gmail']['username'],
        :password => @private_config['gmail']['password'],
        :authentication => 'plain',
        :enable_starttls_auto => true}


    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # JavaScript files you want as :defaults (application.js is always included).
    # config.action_view.javascript_expansions[:defaults] = %w(jquery rails)

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]
  end
end
