# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require task_updater
root = exports ? this
jQuery ->
if $('#task_list_table').size() > 0
  window.setInterval(updateJobStatuses, 10000)

