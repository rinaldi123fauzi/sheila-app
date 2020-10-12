class AddColumnAssignmentPlaceIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_reference :assignments, :assignment_place, foreign_key: true
  end
end
