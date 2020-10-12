json.set! :data do
  json.array! @timesheets do |timesheet|
    json.partial! 'timesheets/timesheet', timesheet: timesheet
    json.url  "
              #{link_to 'Show', timesheet }
              #{link_to 'Edit', edit_timesheet_path(timesheet)}
              #{link_to 'Destroy', timesheet, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end