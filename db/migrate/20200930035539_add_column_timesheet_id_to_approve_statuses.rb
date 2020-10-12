class AddColumnTimesheetIdToApproveStatuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :approve_statuses, :timesheet, foreign_key: true
  end
end
