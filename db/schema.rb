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

ActiveRecord::Schema.define(version: 2019_05_12_134045) do

  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.string "display_name"
    t.string "icon"
    t.string "password_digest"
    t.integer "delete_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "households", force: :cascade do |t|
    t.string "item_name"
    t.datetime "event_date"
    t.integer "amount"
    t.integer "account_id"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payoff_flg"
    t.index ["account_id"], name: "index_households_on_account_id"
  end

  create_table "masters", force: :cascade do |t|
    t.integer "chart_max_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
