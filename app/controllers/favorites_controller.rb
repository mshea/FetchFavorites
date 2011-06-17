class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  def index
    @favorites = Favorite.all
    @feeds = Feed.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  def fetch
    @feeds = Feed.all
    @feeds.each do |feed|
      jsondata = open(feed.url, :proxy => "http://gatekeeper-w.mitre.org:80").read
      data = ActiveSupport::JSON.decode(jsondata)
      csv = []
      CSV.open("./public/#{feed.id}.csv", "w") do |csv|
      csv << ["feed.url", "id_str", "in_reply_to_status_id", "user_id_str", "verified", "friends_count", "is_translator", "statuses_count", "name", "favourites_count", "profile_image_url", "utc_offset", "location", "description", "screen_name", "lang", "homepage_url", "listed_count", "time_zone", "created_at", "user_created_at", "followers_count", "user_id", "geo_enabled", "following", "text", "in_reply_to_user_id", "retweet_count", "place", "favorited", "in_reply_to_status_id_str", "in_reply_to_screen_name", "source", "in_reply_to_user_id_str", "retweeted", "coordinates", "geo", "latitude", "longitude", "country", "country_code", "place_full_name"]
      data.each do |item|
        if item["place"].nil?
          country = country_code = place_full_name = ""
        else
          country = item["place"]["country"]
          country_code = item["place"]["country_code"]
          place_full_name = item["place"]["full_name"]         
        end
        if item["geo"].nil?
          latitude = longitude = place_full_name = ""
        else
          latitude = item["geo"]["coordinates"][0]
          longitude = item["geo"]["coordinates"][1]  
        end
        
        @favorite = Favorite.new(:feed_id => feed.id, :source_url => feed.url, :id_str => item["id_str"], :in_reply_to_status_id => item["in_reply_to_status_id"], :user_id_str => item["user"]["id_str"], :verified => item["user"]["verified"], :friends_count => item["user"]["friends_count"], :is_translator => item["user"]["is_translator"], :statuses_count => item["user"]["statuses_count"], :name => item["user"]["name"], :favourites_count => item["user"]["favourites_count"], :profile_image_url => item["user"]["profile_image_url"], :utc_offset => item["user"]["utc_offset"], :location => item["user"]["location"], :description => item["user"]["description"], :screen_name => item["user"]["screen_name"], :lang => item["user"]["lang"], :homepage_url => item["user"]["url"], :listed_count => item["user"]["listed_count"], :time_zone => item["user"]["time_zone"], :twitter_created_at => item["created_at"], :user_created_at => item["user"]["created_at"],:followers_count => item["user"]["followers_count"], :user_id => item["user"]["id"], :geo_enabled => item["user"]["geo_enabled"], :following => item["user"]["following"], :text => item["text"], :in_reply_to_user_id => item["in_reply_to_user_id"], :retweet_count => item["retweet_count"], :place => item["place"], :favorited => item["favorited"], :in_reply_to_status_id_str => item["in_reply_to_status_id_str"], :in_reply_to_screen_name => item["in_reply_to_screen_name"], :source => item["source"], :in_reply_to_user_id_str => item["in_reply_to_user_id_str"], :coordinates => item["coordinates"], :geo => item["geo"],  :retweeted => item["retweeted"], :latitude => latitude, :longitude => longitude, :country => country, :country_code => country_code, :place_full_name => place_full_name)
        csv << [feed.url, item["id_str"], item["in_reply_to_status_id"], item["user"]["id_str"], item["user"]["verified"], item["user"]["friends_count"], item["user"]["is_translator"], item["user"]["statuses_count"], item["user"]["name"], item["user"]["favourites_count"], item["user"]["profile_image_url"], item["user"]["utc_offset"], item["user"]["location"], item["user"]["description"], item["user"]["screen_name"], item["user"]["lang"], item["user"]["url"], item["user"]["listed_count"], item["user"]["time_zone"], item["created_at"], item["user"]["created_at"] ,item["user"]["followers_count"], item["user"]["id"], item["user"]["geo_enabled"], item["user"]["following"], item["text"], item["in_reply_to_user_id"], item["retweet_count"], item["place"], item["favorited"], item["in_reply_to_status_id_str"], item["in_reply_to_screen_name"], item["source"], item["in_reply_to_user_id_str"], item["retweeted"], item["coordinates"], item["geo"], latitude, longitude, country,  country_code, place_full_name]
        @favorite.save
      end
    end
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /favorites/1
  # GET /favorites/1.xml
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorite }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # PUT /favorites/1
  # PUT /favorites/1.xml
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to(@favorite, :notice => 'Favorite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.xml
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to(favorites_url) }
      format.xml  { head :ok }
    end
  end
end
