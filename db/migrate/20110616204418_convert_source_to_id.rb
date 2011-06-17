class ConvertSourceToId < ActiveRecord::Migration
  def self.up
    @feeds = Feed.all
    @favorites = Favorite.all
    @favorites.each do |favorite|
      @feeds.each do |feed|
        @favorite = Favorite.find(favorite.id)
        if favorite.source_url == feed.url
          @favorite.update_attributes(:feed_id => feed.id)
        end
      end
    end
  end

  def self.down
  end
end
