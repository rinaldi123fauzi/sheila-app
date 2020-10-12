class AddColumnIdAssignmentToHistoryAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :history_assignments, :id_assignment, :integer
  end
end
