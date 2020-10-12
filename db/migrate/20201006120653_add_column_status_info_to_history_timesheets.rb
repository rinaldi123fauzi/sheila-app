class AddColumnStatusInfoToHistoryTimesheets < ActiveRecord::Migration[5.2]
  def change
    add_column :history_timesheets, :status_info, :string
  end
end
