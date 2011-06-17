class AddFeedIdToFavorite < ActiveRecord::Migration
  def self.up
    add_column :favorites, :feed_id, :integer
  end

  def self.down
    remove_column :favorites, :feed_id
  end
end
