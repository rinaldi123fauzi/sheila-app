class CreateApproveStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :approve_statuses do |t|
      t.string :parent_timesheet_id
      t.string :approve_by
      t.string :status1
      t.string :status2
      t.string :status3
      t.string :status4
      t.string :statuspm
      t.string :info1
      t.string :info2
      t.string :info3
      t.string :info4
      t.string :string
      t.string :infopm
      t.string :alasan
      t.string :deskripsi

      t.timestamps
    end
  end
end
