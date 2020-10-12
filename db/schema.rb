# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_07_051738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_outputs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_titles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "approve_statuses", force: :cascade do |t|
    t.string "parent_timesheet_id"
    t.string "approve_by"
    t.string "status1"
    t.string "status2"
    t.string "status3"
    t.string "status4"
    t.string "statuspm"
    t.string "info1"
    t.string "info2"
    t.string "info3"
    t.string "info4"
    t.string "string"
    t.string "infopm"
    t.string "alasan"
    t.string "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reject_by"
    t.string "parent_assignment_id"
    t.bigint "timesheet_id"
    t.index ["timesheet_id"], name: "index_approve_statuses_on_timesheet_id"
  end

  create_table "assignment_places", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.string "nama"
    t.bigint "position_id"
    t.string "satuan_kerja"
    t.bigint "service_type_id"
    t.string "spesifik_output"
    t.string "pihak_ketiga"
    t.string "lama_penugasan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nama_tugas"
    t.string "parent_id"
    t.bigint "assignment_place_id"
    t.string "perjalanan_dinas"
    t.integer "user_mengajukan"
    t.index ["assignment_place_id"], name: "index_assignments_on_assignment_place_id"
    t.index ["position_id"], name: "index_assignments_on_position_id"
    t.index ["service_type_id"], name: "index_assignments_on_service_type_id"
  end

  create_table "history_assignments", force: :cascade do |t|
    t.string "parent_assignment_id"
    t.string "status"
    t.string "by"
    t.string "alasan"
    t.string "deskripsi"
    t.string "info"
    t.string "status_info"
    t.string "tertuju_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_assignment"
  end

  create_table "history_timesheets", force: :cascade do |t|
    t.string "parent_timesheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "by"
    t.string "info"
    t.string "alasan"
    t.string "deskripsi"
    t.string "status_info"
    t.string "tertuju_info"
  end

  create_table "info_approves", force: :cascade do |t|
    t.string "parent_timesheet_id"
    t.string "approve_by"
    t.string "status1"
    t.string "status2"
    t.string "status3"
    t.string "status4"
    t.string "statuspm"
    t.string "info1"
    t.string "info2"
    t.string "info3"
    t.string "info4"
    t.string "string"
    t.string "infopm"
    t.string "alasan"
    t.string "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personil_details", force: :cascade do |t|
    t.string "nama_lengkap"
    t.string "nama_panggilan"
    t.bigint "user_id"
    t.string "tim"
    t.bigint "assignment_place_id"
    t.bigint "position_id"
    t.string "nomor_ponsel"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_place_id"], name: "index_personil_details_on_assignment_place_id"
    t.index ["position_id"], name: "index_personil_details_on_position_id"
    t.index ["user_id"], name: "index_personil_details_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timesheets", force: :cascade do |t|
    t.string "parent_id"
    t.bigint "user_id"
    t.date "tanggal"
    t.bigint "activity_title_id"
    t.string "isi_aktivitas"
    t.time "jam_mulai"
    t.time "jam_selesai"
    t.string "lokasi_kerja"
    t.bigint "activity_output_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "assignment_place_id"
    t.integer "minute_total"
    t.index ["activity_output_id"], name: "index_timesheets_on_activity_output_id"
    t.index ["activity_title_id"], name: "index_timesheets_on_activity_title_id"
    t.index ["assignment_place_id"], name: "index_timesheets_on_assignment_place_id"
    t.index ["user_id"], name: "index_timesheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "name"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.bigint "assignment_place_id"
    t.index ["assignment_place_id"], name: "index_users_on_assignment_place_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approve_statuses", "timesheets"
  add_foreign_key "assignments", "assignment_places"
  add_foreign_key "assignments", "positions"
  add_foreign_key "assignments", "service_types"
  add_foreign_key "personil_details", "assignment_places", on_delete: :cascade
  add_foreign_key "personil_details", "positions", on_delete: :cascade
  add_foreign_key "personil_details", "users", on_delete: :cascade
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "timesheets", "activity_outputs", on_delete: :cascade
  add_foreign_key "timesheets", "activity_titles", on_delete: :cascade
  add_foreign_key "timesheets", "assignment_places"
  add_foreign_key "timesheets", "users", on_delete: :cascade
  add_foreign_key "users", "assignment_places"
end
