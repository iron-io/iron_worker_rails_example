SimpleWorker.configure do |config|
  config.access_key = Rails.application.config.private_config['sw']['access_key']
  config.secret_key = Rails.application.config.private_config['sw']['secret_key']
  config.auto_merge = true
  config.database = Rails.configuration.database_configuration[Rails.env]
  config.unmerge_gem('client_side_validations')
  config.unmerge_gem('delayed_job')
  config.unmerge_gem('devise')
end
