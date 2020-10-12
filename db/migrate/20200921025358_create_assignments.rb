class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :nama
      t.references :position, foreign_key: true
      t.string :satuan_kerja
      t.references :service_type, foreign_key: true
      t.string :spesifik_output
      t.string :lokasi_kerja
      t.string :pihak_ketiga
      t.string :lama_penugasan

      t.timestamps
    end
  end
end
