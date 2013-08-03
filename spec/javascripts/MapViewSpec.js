describe('MapView', function() {
  var mapView, spy, tours, user;

  beforeEach(function() {
    spy = sinon.spy();
    user = new User();
    tours = new TourCollection();
    tours.add( new Tour({name:'tour1'}));
    tours.add( new Tour({name:'tour2'}));
    user.set({tours:tours});
    mapView = new MapView({model: tours.models[0]});

  });
  describe('events', function() {
    it('should fire a callback when the tourSelected model changes', function() {
      window.tourSelected = new TourSelected({tour:tours.models[0]});
      window.tourSelected.bind('change', spy);
      window.tourSelected.trigger('change');
      expect(spy).toHaveBeenCalled();
    });
  });
  describe('#initialize', function() {
    it('should be instantiated', function() {
      expect(mapView).toBeDefined();
    });
    it('should have a tour model', function() {
      expect(mapView.model).toBeDefined();
    });

    it('should have one or more markers', function() {
      expect(mapView.markers.length).toBeGreaterThan(0);
    });
    it('should have an id of #map', function() {
      expect(mapView.el.id).toEqual('map');
    });
    it('should have a class of map', function() {
      expect(mapView.el.className).toEqual('map');
    });
  });
  describe('#buildMap', function() {
    it('should receive the user\'s coordinates on successful geolocation call', function() {
      var onSuccess = jasmine.createSpy();

      spyOn(navigator.geolocation, 'getCurrentPosition').andCallFake(function() {
        var position = {
          coords: {
            latitude: 32,
            longitude: -96
          }
        };
        arguments[0](position);
      });

      mapView.getCurrentLocation(onSuccess);

      runs(function() {
        expect(onSuccess).toHaveBeenCalled();
      });
    });
    it('should make a request for a map object', function() {
      var onSuccess;

      onSuccess = jasmine.createSpy();
      spyOn(L.mapbox, 'map').andCallFake(onSuccess);
      L.mapbox.map(onSuccess);

      runs(function() {
        expect(onSuccess).toHaveBeenCalled();
      });
    });
  });
  describe('#getCurrentLocation', function() {
    it('get the user\'s current location', function() {
      var onSuccess = jasmine.createSpy();

      spyOn(navigator.geolocation, 'getCurrentPosition').andCallFake(function() {
        var position = {
          coords: {
            latitude: 32,
            longitude: -96
          }
        };
        arguments[0](position);
      });


      mapView.getCurrentLocation(onSuccess);
      expect(onSuccess).toHaveBeenCalled();
    });
  });
});