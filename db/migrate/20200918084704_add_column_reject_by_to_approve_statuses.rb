class AddColumnRejectByToApproveStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :approve_statuses, :reject_by, :string
  end
end
