class AddColumnInHistoryTimesheets < ActiveRecord::Migration[5.2]
  def change
    add_column :history_timesheets, :status, :string
    add_column :history_timesheets, :by, :string
    add_column :history_timesheets, :info, :string
    add_column :history_timesheets, :alasan, :string
    add_column :history_timesheets, :deskripsi, :string

    remove_column :history_timesheets, :approve_by, :string
    remove_column :history_timesheets, :reject_by, :string
  end
end
