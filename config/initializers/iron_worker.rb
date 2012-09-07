puts "Initializing IronWorker"
IW_CLIENT = IronWorkerNG::Client.new
puts "Creating worker from worker file"
code_from_workerfile = IronWorkerNG::Code::Base.new(:workerfile => 'workers/simple_mailer_worker.worker')
puts "Uploading worker"
IW_CLIENT.codes.create(code_from_workerfile)
puts "Worker uploaded"
