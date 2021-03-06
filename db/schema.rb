# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 5) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.string "items"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.integer "user_id"
    t.integer "status", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.decimal "funds", precision: 8, scale: 2
  end

end
