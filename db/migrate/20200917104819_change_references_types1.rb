class ChangeReferencesTypes1 < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :timesheets, :users
    remove_foreign_key :timesheets, :activity_titles
    remove_foreign_key :timesheets, :activity_outputs

    add_foreign_key :timesheets, :users, on_delete: :cascade
    add_foreign_key :timesheets, :activity_titles, on_delete: :cascade
    add_foreign_key :timesheets, :activity_outputs, on_delete: :cascade
  end
end
