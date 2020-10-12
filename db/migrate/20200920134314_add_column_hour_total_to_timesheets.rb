class AddColumnHourTotalToTimesheets < ActiveRecord::Migration[5.2]
  def change
    add_column :timesheets, :hour_total, :integer
  end
end
