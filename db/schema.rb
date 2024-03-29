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

ActiveRecord::Schema.define(version: 2021_08_08_001804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.boolean "read_access", default: true, null: false
    t.boolean "write_access", default: true, null: false
    t.boolean "delete_access", default: true, null: false
    t.index ["list_id"], name: "index_permissions_on_list_id"
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.text "description"
    t.boolean "completed", default: false, null: false
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_todos_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
