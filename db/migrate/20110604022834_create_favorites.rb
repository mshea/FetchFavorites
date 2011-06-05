class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.string :source_url
      t.string :id_str
      t.integer :in_reply_to_status_id
      t.string :user_id_str
      t.string :verified
      t.integer :friends_count
      t.string :is_translator
      t.string :statuses_count
      t.string :name
      t.string :favourites_count
      t.string :profile_image_url
      t.integer :utc_offset
      t.string :location
      t.string :description
      t.string :screen_name
      t.string :lang
      t.string :homepage_url
      t.integer :listed_count
      t.string :time_zone
      t.datetime :twitter_created_at
      t.integer :followers_count
      t.integer :user_id
      t.string :geo_enabled
      t.string :following
      t.string :text
      t.integer :in_reply_to_user_id
      t.integer :retweet_count
      t.string :place
      t.string :favorited
      t.string :in_reply_to_status_id_str
      t.integer :id
      t.datetime :user_created_at
      t.string :in_reply_to_screen_name
      t.string :source
      t.string :in_reply_to_user_id_str
      t.string :coordinates
      t.string :geo
      t.string :latitude
      t.string :longitude
      t.string :country
      t.string :country_code
      t.string :place_full_name
      t.string :retweeted
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
