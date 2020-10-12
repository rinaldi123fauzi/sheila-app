class AddColumnAssignmentPlaceIdToTimesheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :timesheets, :assignment_place, foreign_key: true
  end
end
