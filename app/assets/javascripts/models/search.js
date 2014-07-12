var Search = Backbone.Model.extend({
    defaults: {
      lat: 0
    , lng: 0
    , key: 'AIzaSyCvzuNHRQq5SRJZnyqPJ6c5nMzyeDm2kU0'
    , keyword: ''
  }
  , initialize: function() {
      console.log('initializing search...');
      var keyword = this.get('keyword');
      url = this.queryString(keyword);


  }
  , queryString: function(keyword) {
      var url;
      url = "https://maps.googleapis.com/maps/api/place/textsearch";
      url += "/json";
      url += "?location=";
      url += this.get('lat');
      url += ",";
      url += this.get('lng');
      url += "&radius=5000";
      url += "&query=";
      url += this.get('keyword');
      url += "&sensor=true";
      url += "&key=";
      url += this.get('key');
      return url;
  }

});