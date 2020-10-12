class AddColumnPerjalananDinasToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :perjalanan_dinas, :string
  end
end
