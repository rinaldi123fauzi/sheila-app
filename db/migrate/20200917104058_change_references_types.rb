class ChangeReferencesTypes < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :personil_details, :assignment_places
    remove_foreign_key :personil_details, :users
    remove_foreign_key :personil_details, :positions

    add_foreign_key :personil_details, :assignment_places, on_delete: :cascade
    add_foreign_key :personil_details, :users, on_delete: :cascade
    add_foreign_key :personil_details, :positions, on_delete: :cascade
  end
end
