root = exports ? this
root.updateJobStatuses = ->
  task_ids = []
  $('#task_list_table').find('tbody tr[data-task-id]').each ->
    status = $(this).data('status')
    task_ids.push($(this).data('taskId')) if (status == 'running' || status == 'queued')
  return true if task_ids.length == 0
  for task_id in task_ids
    $.get '/tasks/' + task_id + '/status', (json) ->
      job_tr = $("tr[data-task-id=#{task_id}]")
      job_tr.data('status', json.status)
      job_tr.find('.status').html(json.status)
      job_tr.find('.duration').html(json.duration)
      if json.status != "running" && json.status != "queued"
        job_tr.find('.results_link').show()
        job_tr.find('.spinner').hide()
  null
