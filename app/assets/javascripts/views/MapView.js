var MapView = Backbone.View.extend({
  markers: [],
  id: 'map',
  className: 'map',
  currentPosition: [],

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, 'change', this.render);
    steps = this.model.get('steps');
    self = this;
    _.each(steps, function(step) {
      self.markers.push(step);
    });
  },

  // retrieves the user's current location using html5
  getCurrentLocation: function(callback) {
    console.log('getCurrentLocation() function...');
    var self = this;

    navigator.geolocation.getCurrentPosition(function(data) {
      var lat, lng, latlng;
      lat = data['coords']['latitude'];
      lng = data['coords']['longitude'];

      self.currentPosition.push(lat);
      self.currentPosition.push(lng);
    });
    callback();
  },

  render: function() {
    console.log('mapView.render()...');
    var tour, steps;

    tour = this.model.get('tour');
    steps = tour.get('steps');

    this.getCurrentLocation(this.buildMap);
    return this;
  },

  // adds the markers to the map
  addMarkers: function() {

  },

  // draws the map
  buildMap: function() {
    console.log('buildMap() function...');
    var lat, lng,
    self = this;

    navigator.geolocation.getCurrentPosition(function(data) {
      var lat, lng, latlng;
      lat = data['coords']['latitude'];
      lng = data['coords']['longitude'];

      map = new L.mapbox.map('map', 'bmy78.map-z27ovm6p')
                  .setView(new L.LatLng(lat, lng), 15);

      console.log('lat', lat);
      console.log('lng', lng);

      // use mapbox
      mapboxUrl = "http://a.tiles.mapbox.com/v3/bmy78.map-z27ovm6p.jsonp";
      wax.tilejson(mapboxUrl, function(tilejson) {
        connector = new wax.leaf.connector(tilejson);
        map.addLayer(connector);
      });
    });
  }
  });