json.extract! timesheet, :id, :parent_id, :user_id, :tanggal, :activity_title_id, :isi_aktivitas, :jam_mulai, :jam_selesai, :lokasi_kerja, :activity_output_id, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
