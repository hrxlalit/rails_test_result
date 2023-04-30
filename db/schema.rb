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

ActiveRecord::Schema[7.0].define(version: 2023_04_26_215332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_result_stats", force: :cascade do |t|
    t.string "subject", null: false
    t.date "date", null: false
    t.decimal "daily_low", precision: 15, scale: 2, default: "0.0"
    t.decimal "daily_high", precision: 15, scale: 2, default: "0.0"
    t.integer "result_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monthly_averages", force: :cascade do |t|
    t.string "subject", null: false
    t.date "date", null: false
    t.decimal "monthly_avg_low", precision: 15, scale: 2, default: "0.0"
    t.decimal "monthly_avg_high", precision: 15, scale: 2, default: "0.0"
    t.integer "monthly_result_count_used", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results_data", force: :cascade do |t|
    t.string "subject", null: false
    t.datetime "timestamp", null: false
    t.decimal "marks", precision: 15, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
