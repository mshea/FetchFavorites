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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110616204418) do

  create_table "favorites", :force => true do |t|
    t.string   "source_url"
    t.string   "id_str"
    t.integer  "in_reply_to_status_id"
    t.string   "user_id_str"
    t.string   "verified"
    t.integer  "friends_count"
    t.string   "is_translator"
    t.string   "statuses_count"
    t.string   "name"
    t.string   "favourites_count"
    t.string   "profile_image_url"
    t.integer  "utc_offset"
    t.string   "location"
    t.string   "description"
    t.string   "screen_name"
    t.string   "lang"
    t.string   "homepage_url"
    t.integer  "listed_count"
    t.string   "time_zone"
    t.datetime "twitter_created_at"
    t.integer  "followers_count"
    t.integer  "user_id"
    t.string   "geo_enabled"
    t.string   "following"
    t.string   "text"
    t.integer  "in_reply_to_user_id"
    t.integer  "retweet_count"
    t.string   "place"
    t.string   "favorited"
    t.string   "in_reply_to_status_id_str"
    t.datetime "user_created_at"
    t.string   "in_reply_to_screen_name"
    t.string   "source"
    t.string   "in_reply_to_user_id_str"
    t.string   "coordinates"
    t.string   "geo"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "country"
    t.string   "country_code"
    t.string   "place_full_name"
    t.string   "retweeted"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_id"
  end

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
