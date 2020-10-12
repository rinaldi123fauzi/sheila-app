class AddColumnParentIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :parent_id, :string
  end
end
