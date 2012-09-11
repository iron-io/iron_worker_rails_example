class CustomExamplesController < ApplicationController
  def index
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
end
