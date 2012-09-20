require 'json'
require 'iron_cache'
require 'models/complex_model'
puts "Got params:#{params.inspect}"
puts "Deserializing"
complex_model = JSON.load params["complex_model"]
puts "Performing calculations"
complex_model.calculate
puts "pushing model to iron_cache"
puts complex_model.to_json
iron_config = JSON.parse(params['iron_config'])
puts "Initializing cache :#{iron_config.inspect}"
client = IronCache::Client.new(iron_config)
cache = client.cache("IronWorker101Example")
puts "Putting model to cache"
cache.put(@iron_task_id, complex_model.to_json)