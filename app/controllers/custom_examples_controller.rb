class CustomExamplesController < ApplicationController
  def index
    @deserialize_tasks = client.tasks.list.select { |t| t.code_name == 'DeserializeWorker' }
  end

  def send_email
    client.tasks.create('SimpleMailerWorker', {:email => params[:email],
                                               :mailer => ActionMailer::Base.smtp_settings,
                                               :message => params[:message],
                                               :database => ActiveRecord::Base.connection.instance_variable_get(:@config)})
    redirect_to tasks_path
  end

  def attribute_worker
    worker_attributes = {}
    worker_attributes[:fixnum_arg] = params[:fixnum_arg]
    worker_attributes[:floatnum_arg] = params[:floatnum_arg]
    worker_attributes[:string_arg] = params[:string_arg]
    worker_attributes[:hash_arg] = params[:hash_arg] # we're passing hash as jsoned hash so yo'll need to .to_json before
    worker_attributes[:time_arg] = params[:time_arg]
    worker_attributes[:array_arg] = params[:array_arg].split(',').to_json

    client.tasks.create('AttributeWorker', worker_attributes)
    redirect_to tasks_path
  end

  def deserialize_worker
    m = ComplexModel.new
    m.a = params['a'].split(',').map(&:to_i) rescue 1
    m.b = params['b'].split(',').map(&:to_i) rescue [1, 2, 3]
    client.tasks.create('DeserializeWorker', :complex_model => m.to_json, :iron_config => Rails.application.config.iron_config.to_json)
    redirect_to(custom_examples_path + "#deserialize_worker")
  end

  def deserialize_worker_results
    client = IronCache::Client.new(Rails.application.config.iron_config)
    cache = client.cache("IronWorker101Example")
    item = cache.get(params['id'])
    @complex_model = JSON.load item.value
  end
end
