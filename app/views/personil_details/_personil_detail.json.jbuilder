json.extract! personil_detail, :id, :nama_lengkap, :nama_panggilan, :user_id, :tim, :assignment_place_id, :position_id, :nomor_ponsel, :email, :created_at, :updated_at
json.url personil_detail_url(personil_detail, format: :json)
