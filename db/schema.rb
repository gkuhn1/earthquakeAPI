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

ActiveRecord::Schema.define(version: 20180207211536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "earthquakes", force: :cascade do |t|
    t.string "event_id", null: false
    t.datetime "time", null: false
    t.string "latitude", null: false
    t.string "longitude", null: false
    t.string "event_type", null: false
    t.decimal "distance_from_la", null: false
    t.decimal "mag", null: false
    t.string "place", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_earthquakes_on_event_id", unique: true
    t.index ["time", "mag", "distance_from_la"], name: "index_earthquakes_on_time_and_mag_and_distance_from_la"
  end

end
