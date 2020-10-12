class CreateHistoryTimesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :history_timesheets do |t|
      t.string :parent_timesheet_id
      t.references :approve_status, foreign_key: true
      t.string :approve_by
      t.string :reject_by

      t.timestamps
    end
  end
end
