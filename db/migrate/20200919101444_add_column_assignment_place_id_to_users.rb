class AddColumnAssignmentPlaceIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :assignment_place, foreign_key: true
  end
end
