json.set! :data do
  json.array! @history_timesheets do |history_timesheet|
    json.partial! 'history_timesheets/history_timesheet', history_timesheet: history_timesheet
    json.url  "
              #{link_to 'Show', history_timesheet }
              #{link_to 'Edit', edit_history_timesheet_path(history_timesheet)}
              #{link_to 'Destroy', history_timesheet, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end