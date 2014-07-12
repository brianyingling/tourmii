describe('TourMenuItemView', function() {
  var tour, tourMenuItemView;

  beforeEach(function() {
    tour = new Tour({id:1,name:'Tour1'});
    tourMenuItemView = new TourMenuItemView({model:tour});
    this.server = sinon.fakeServer.create();
  });
  afterEach(function() {
    this.server.restore();
  });
  describe('#initialize', function() {
    it('instantiates the view of an item on the tour menu', function() {
      expect(tourMenuItemView).toBeDefined();
    });
    it('should be null when not defined', function() {
      var tourMenuItemView;
      expect(tourMenuItemView).toBeUndefined();
    });
    it('should have a tour object', function() {
      expect(tourMenuItemView.options.model).toBeDefined();
    });
  });
  describe('events', function() {
    it('should fire a change event when clicked', function() {
      var spy = sinon.spy();
      tourMenuItemView.bind('click', spy);
      tourMenuItemView.trigger('click');
      expect(spy).toHaveBeenCalled();
    });
  });
});