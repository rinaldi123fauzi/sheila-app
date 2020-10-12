class AddColumnNamaTugasToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :nama_tugas, :string
  end
end
