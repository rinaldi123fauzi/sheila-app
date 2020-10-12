json.extract! history_timesheet, :id, :parent_timesheet_id, :approve_status_id, :approve_by, :reject_by, :created_at, :updated_at
json.url history_timesheet_url(history_timesheet, format: :json)
