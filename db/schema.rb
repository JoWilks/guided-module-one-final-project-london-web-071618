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

ActiveRecord::Schema.define(version: 8) do

  create_table "compatibility_charts", force: :cascade do |t|
    t.string "main_type"
    t.string "very_compatible"
    t.string "potentially_compatible"
    t.string "least_compatible"
  end

  create_table "four_letters", force: :cascade do |t|
    t.string "myers_briggs_type"
    t.string "subtitle"
    t.string "description"
    t.string "dominant_function"
    t.string "auxiliary_function"
    t.string "tertiary_function"
    t.string "inferior_function"
  end

  create_table "function_analyses", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.string "desc"
  end

  create_table "function_attitudes", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
  end

  create_table "function_pairs", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
  end

  create_table "letters", force: :cascade do |t|
    t.string "letter"
    t.string "description"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "four_letter"
  end

  create_table "person_letters", force: :cascade do |t|
    t.integer "person_id"
    t.integer "mind_id"
    t.integer "energy_id"
    t.integer "nature_id"
    t.integer "tactics_id"
    t.integer "four_letter_id"
  end

end
