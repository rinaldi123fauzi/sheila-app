class DeleteReferencesInHistoryTimesheets < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :history_timesheets, :approve_statuses
    remove_column :history_timesheets, :approve_status_id, :integer
  end
end
