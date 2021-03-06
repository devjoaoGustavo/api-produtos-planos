# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160219170458) do

  create_table "periodicities", force: :cascade do |t|
    t.string   "name"
    t.integer  "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "details"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
  end

  add_index "plans", ["product_id"], name: "index_plans_on_product_id"

  create_table "prices", force: :cascade do |t|
    t.integer "periodicity_id"
    t.integer "plan_id"
    t.decimal "value"
  end

  add_index "prices", ["periodicity_id"], name: "index_prices_on_periodicity_id"
  add_index "prices", ["plan_id"], name: "index_prices_on_plan_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
