class SchedulesController < ApplicationController
  def index
    @schedules = client.schedules.list
  end

  def cancel
    client.schedules.cancel(params[:id])
    redirect_to schedules_path
  end

  def create
    schedule_params = params['schedule_params'] ? JSON.parse(params['schedule_params']) : {}
    additional_params = {}
    additional_params[:start_at] = Time.now + params[:run_after].to_i
    additional_params[:end_at] = Time.now + params[:end_at].to_i
    additional_params[:run_every] = params[:run_every].to_i
    additional_params[:run_times] = params[:run_times].to_i
    additional_params[:priority] = params[:priority].to_i
    res = client.schedules.create(params['worker_name'], schedule_params, additional_params)
    puts "Result:#{res.inspect}"
    redirect_to schedules_path
  end
end
