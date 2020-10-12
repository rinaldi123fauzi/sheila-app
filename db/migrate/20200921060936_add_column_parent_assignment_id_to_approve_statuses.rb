class AddColumnParentAssignmentIdToApproveStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :approve_statuses, :parent_assignment_id, :string
  end
end
