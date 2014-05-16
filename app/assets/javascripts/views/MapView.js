var MapView = Backbone.View.extend({
  markers: [],
  id: 'map',
  className: 'map',
  currentPosition: [],
  map: 0,

  initialize: function(options) {
    console.log('mapView.initialize()...');
    var self = this;
    this.model = options.model;
    this.listenTo(this.model, 'change', this.render);
    steps = this.model.get('steps');

    if(steps) {
      steps.each(function(step) {
        console.log('step', step);
        self.markers.push(step);
      });
    }

    console.log('markers', self.markers);

    // set map


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
    var tour, steps,
        self = this;

    tour = this.model;
    tour.fetch({
      success: function() {
        console.log('success');
      },
      error: function(err) {
        console.error('error', err);
      }
    });
    console.log('steps', tour.get('steps') );
    console.log('markers', this.markers);

    this.getCurrentLocation(this.buildMap);
    this.addMarkers();
    return this;
  },


  addMarker: function(marker) {
    console.log('addMarker() called...');
    var icon, latlng, leafletIcon;

    // establish coords
    latlng = new L.LatLng(
      marker.get('lat'),
      marker.get('lng')
    );


    // build icon
    leafletIcon = L.Icon.extend({
      options: {
        iconUrl: 'https://foursquare.com/img/categories/food/icecream.png',
        shadowUrl: null,
        iconSize: new L.Point(32,32),
        iconAnchor: new L.Point(16,41),
        popupAnchor: new L.Point(0,-51)
      }
    });

    icon = new leafletIcon();
    marker = new L.Marker(latLng, {icon: icon});

    // add marker to map
    map.addLayer(marker);
    debugger;

  },

  // calls the addMarker function for each marker
  addMarkers: function() {
    console.log('addMarkers() called...');
    var self = this;
    _.each(this.markers, function(marker) {
      self.addMarker(marker);
    });
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

      this.map = new L.mapbox.map('map', 'bmy78.map-z27ovm6p')
                  .setView(new L.LatLng(lat, lng), 15);

      console.log('lat', lat);
      console.log('lng', lng);

      // use mapbox
      mapboxUrl = "http://a.tiles.mapbox.com/v3/bmy78.map-z27ovm6p.jsonp";
      wax.tilejson(mapboxUrl, function(tilejson) {
        connector = new wax.leaf.connector(tilejson);
        self.map.addLayer(connector);
      });
    });
  }
  });