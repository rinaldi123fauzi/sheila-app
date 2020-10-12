class RenameColumnInTimesheets < ActiveRecord::Migration[5.2]
  def change
    rename_column :timesheets, :hour_total, :minute_total
  end
end
