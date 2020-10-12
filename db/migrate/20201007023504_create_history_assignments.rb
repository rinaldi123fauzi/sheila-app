class CreateHistoryAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :history_assignments do |t|
      t.string :parent_assignment_id
      t.string :status
      t.string :by
      t.string :alasan
      t.string :deskripsi
      t.string :info
      t.string :status_info
      t.string :tertuju_info

      t.timestamps
    end
  end
end
