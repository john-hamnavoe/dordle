# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_09_140859) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.boolean "sortable"
    t.boolean "default_on"
    t.integer "default_position"
    t.string "field"
    t.string "object_1"
    t.string "object_2"
    t.bigint "grid_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grid_id"], name: "index_columns_on_grid_id"
  end

  create_table "dashboard_metric_snapshots", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.bigint "dashboard_metric_id", null: false
    t.date "date"
    t.integer "value"
    t.integer "last_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_metric_id"], name: "index_dashboard_metric_snapshots_on_dashboard_metric_id"
    t.index ["organisation_id"], name: "index_dashboard_metric_snapshots_on_organisation_id"
  end

  create_table "dashboard_metrics", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "icon"
    t.string "color"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "word_id", null: false
    t.bigint "user_id", null: false
    t.string "guess", default: [], array: true
    t.string "invalid_letters", default: ""
    t.integer "winning_guess"
    t.integer "last_guess", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
    t.index ["word_id"], name: "index_games_on_word_id"
  end

  create_table "grid_view_columns", force: :cascade do |t|
    t.bigint "grid_view_id", null: false
    t.bigint "column_id", null: false
    t.string "label"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["column_id"], name: "index_grid_view_columns_on_column_id"
    t.index ["grid_view_id"], name: "index_grid_view_columns_on_grid_view_id"
  end

  create_table "grid_views", force: :cascade do |t|
    t.string "name"
    t.bigint "grid_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grid_id"], name: "index_grid_views_on_grid_id"
    t.index ["user_id"], name: "index_grid_views_on_user_id"
  end

  create_table "grids", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "organisation_memberships", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.bigint "user_id", null: false
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organisation_id"], name: "index_organisation_memberships_on_organisation_id"
    t.index ["user_id"], name: "index_organisation_memberships_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.bigint "owner_id", null: false
    t.string "domain"
    t.boolean "restrict_to_domain", default: true
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_organisations_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.bigint "current_organisation_id"
    t.index ["current_organisation_id"], name: "index_users_on_current_organisation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "columns", "grids"
  add_foreign_key "dashboard_metric_snapshots", "dashboard_metrics"
  add_foreign_key "dashboard_metric_snapshots", "organisations"
  add_foreign_key "games", "users"
  add_foreign_key "games", "words"
  add_foreign_key "grid_view_columns", "columns"
  add_foreign_key "grid_view_columns", "grid_views"
  add_foreign_key "grid_views", "grids"
  add_foreign_key "grid_views", "users"
  add_foreign_key "organisation_memberships", "organisations"
  add_foreign_key "organisation_memberships", "users"
  add_foreign_key "organisations", "users", column: "owner_id"
  add_foreign_key "users", "organisations", column: "current_organisation_id"
end
