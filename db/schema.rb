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

ActiveRecord::Schema.define(version: 20131027232259) do

  create_table "charges", force: true do |t|
    t.integer  "payer_id"
    t.integer  "amount"
    t.integer  "owee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items", force: true do |t|
    t.string   "name"
    t.integer  "cost"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items_participants", id: false, force: true do |t|
    t.integer "food_item_id",   null: false
    t.integer "participant_id", null: false
  end

  create_table "meals", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "payer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tip_percent",   default: 15
  end

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "payer"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processed",  default: false
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
