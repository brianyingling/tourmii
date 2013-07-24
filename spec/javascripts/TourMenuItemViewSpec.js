describe('TourMenuItemView', function() {
  var tour, tourMenuItemView;

  beforeEach(function() {
    tour = new Tour({id:1,name:'Tour1'});
    tourMenuItemView = new TourMenuItemView({tour:tour});
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
      expect(tourMenuItemView.options.tour).toBeDefined();
    });
    it('should not have a tour object on default', function() {
      var sampleTourMenuItem = new TourMenuItemView();
      expect(sampleTourMenuItem.tour).toBeUndefined();
    });
  });
  describe('#render', function() {
    it('displays the tour\'s name', function() {
      var $el = tourMenuItemView.render().$el;
      expect($el.text() ).toEqual('Tour1');
    });
  });
});