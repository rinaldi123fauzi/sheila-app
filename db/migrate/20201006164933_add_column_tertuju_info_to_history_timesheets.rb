class AddColumnTertujuInfoToHistoryTimesheets < ActiveRecord::Migration[5.2]
  def change
    add_column :history_timesheets, :tertuju_info, :string
  end
end
