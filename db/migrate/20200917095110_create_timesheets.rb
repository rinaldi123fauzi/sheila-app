class CreateTimesheets < ActiveRecord::Migration[5.2]
  def change
    create_table :timesheets do |t|
      t.string :parent_id
      t.references :user, foreign_key: true, on_delete: :cascade
      t.date :tanggal
      t.references :activity_title, foreign_key: true, on_delete: :cascade
      t.string :isi_aktivitas
      t.time :jam_mulai
      t.time :jam_selesai
      t.string :lokasi_kerja
      t.references :activity_output, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
