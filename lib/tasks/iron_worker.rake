namespace :iron_worker do
  desc "Upload all workers"
  task :upload => :environment do
    Dir.glob('workers/*.worker').each do |file|
      code_from_workerfile = IronWorkerNG::Code::Base.new(:workerfile => file)
      Rails.application.config.iw_client.codes.create(code_from_workerfile)
    end
  end
end