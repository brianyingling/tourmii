class HomeController < ApplicationController
  def index
    # authenticate foursquare user with oauth
    @api_key = ENV['FOURSQUARE_PUB']
    @api_sec = ENV['FOURSQUARE_SEC']
    @auth_url = 'https://foursquare.com'
    @api_url = 'https://api.foursquare.com'
  end

  def search
  end

  def welcome
    @user = User.new
    @response = query_flickr("landscapes")
    @photo = choose_photo(@response)
    @photo_url = build_flickr_photo_url(@photo)
    @image_title = @photo['title']
  end

  # Retrieves a json object of photos from Flickr
  def query_flickr(keyword)
    url = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
    url += "&text=#{keyword}"
    url += "&api_key=" + ENV['FLICKR_TOURMII_API_KEY']
    url += "&format=json&nojsoncallback=1"
    url += "&extras=url_b"
    HTTParty.get(url)
  end

  # receives a json object from flickr and returns a url to flickr to retrieve it.
  def build_flickr_photo_url(photo)
    # http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{o-secret}_o.(jpg|gif|png)
    farm_id = photo['farm']
    server_id = photo['server']
    id = photo['id']
    o_secret = photo['secret']
    "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{o_secret}_b.jpg"
  end

  # randomly chooses a photo from the photos json obj returned from Flickr
  def choose_photo(photos)
    num = 1 + rand(photos['photos']['photo'].size)
    photos['photos']['photo'][num]
  end
end