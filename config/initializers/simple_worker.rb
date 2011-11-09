SimpleWorker.configure do |config|
  config.token = Rails.application.config.private_config['sw']['token']
  config.project_id = Rails.application.config.private_config['sw']['project_id']
  config.auto_merge = true
  config.database = Rails.configuration.database_configuration[Rails.env]
  config.unmerge_gem('client_side_validations')
  config.unmerge_gem('delayed_job')
  config.unmerge_gem('devise')
end
