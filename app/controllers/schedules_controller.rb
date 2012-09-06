class SchedulesController < ApplicationController
  def index
    @schedules = client.schedules.list
  end

  def cancel_schedule
    client.schedules.cancel(params[:id])
    redirect_to schedules_path
  end

  def schedule_task
    res = client.schedules.create(params[:worker_name], JSON.parse(params[:schedule_params]), {:start_at => Time.now + params[:seconds].to_i  })
    puts "Result:#{res.inspect}"
    redirect_to schedules_path
  end
end
