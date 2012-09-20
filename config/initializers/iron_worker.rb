puts "Creating worker from worker file"
code_from_workerfile = IronWorkerNG::Code::Base.new(:workerfile => 'workers/simple_mailer_worker.worker')
puts "Uploading worker"
Rails.application.config.iw_client.codes.create(code_from_workerfile)
puts "Worker uploaded"
