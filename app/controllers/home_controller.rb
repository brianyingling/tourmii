class HomeController < ApplicationController
  def index
    # url = "http://api.flickr.com/services/rest/?method=flickr.interestingness.getList"
    url = "http://api.flickr.com/services/rest/?method=flickr.photos.search"
    url += "&text=landscapes"
    url += "&api_key=" + ENV['FLICKR_TOURMII_API_KEY']
    url += "&format=json&nojsoncallback=1"
    url += "&extras=url_b"
    @response = HTTParty.get(url)
    num = 1 + rand(@response['photos']['photo'].size)
    # http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{o-secret}_o.(jpg|gif|png)
    farm_id = @response['photos']['photo'][num]['farm']
    server_id = @response['photos']['photo'][num]['server']
    id = @response['photos']['photo'][num]['id']
    o_secret = @response['photos']['photo'][num]['secret']
    @photo_url = "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{o_secret}_b.jpg"
    @image_title = @response['photos']['photo'][num]['title']

  end
  def search
  end
end