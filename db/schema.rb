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

ActiveRecord::Schema.define(version: 2019_05_31_205508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["owner_id"], name: "index_companies_on_owner_id"
    t.index ["tag_id"], name: "index_companies_on_tag_id"
  end

  create_table "company_contacts", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_owner_id"
    t.index ["company_id"], name: "index_company_contacts_on_company_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "invited_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_invitations_on_company_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_tags_on_company_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "user_contacts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_user_contacts_on_company_id"
    t.index ["email"], name: "index_user_contacts_on_email", unique: true
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "workers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_workers_on_company_id"
    t.index ["user_id"], name: "index_workers_on_user_id"
  end

  add_foreign_key "invitations", "companies"
  add_foreign_key "user_contacts", "users"
end
