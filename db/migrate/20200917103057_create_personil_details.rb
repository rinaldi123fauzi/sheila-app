class CreatePersonilDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :personil_details do |t|
      t.string :nama_lengkap
      t.string :nama_panggilan
      t.references :user, foreign_key: true, on_delete: :cascade
      t.string :tim
      t.references :assignment_place, foreign_key: true, on_delete: :cascade
      t.references :position, foreign_key: true, on_delete: :cascade
      t.string :nomor_ponsel
      t.string :email

      t.timestamps
    end
  end
end
