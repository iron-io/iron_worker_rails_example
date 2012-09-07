class TasksController < ApplicationController
  def index
    @tasks = client.tasks.list
  end

  def create
    res = client.tasks.create(params['worker_name'], params['task_params'])
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
