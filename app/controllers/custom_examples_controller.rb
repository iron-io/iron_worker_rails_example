class CustomExamplesController < ApplicationController
  def index
  end

  def send_email
    client.tasks.create('SimpleMailerWorker', {:email => params[:email],
                                               :mailer => ActionMailer::Base.smtp_settings,
                                               :message => params[:message],
                                               :database=> ActiveRecord::Base.connection.instance_variable_get(:@config)})
    redirect_to tasks_path
  end
end
