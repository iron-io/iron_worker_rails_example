class TasksController < ApplicationController
  def index
    @tasks = client.tasks.list
  end

  def create
    additional_params = {}
    additional_params[:timeout] = params[:task_timeout].to_i if params[:task_timeout]
    additional_params[:delay] = params[:delay].to_i if params[:delay]
    res = client.tasks.create(params['worker_name'], params['task_params'], additional_params)
    puts "Result:#{res.inpect}"
    redirect_to tasks_path
  end

  def cancel
    res = client.tasks.cancel(params[:id])
    puts "Result:#{res.inpect}"
    redirect_to tasks_path
  end

  def cancel_all
    res = client.tasks.cancel_all(params[:id])
    puts "Result:#{res.inpect}"
    redirect_to tasks_path
  end

  def log
    @log = client.tasks.log(params[:id])
  end

  def retry_task
    res = client.tasks.retry(params[:id], :delay => 10)
    puts "Result:#{res.inpect}"
    redirect_to tasks_path
  end

end
