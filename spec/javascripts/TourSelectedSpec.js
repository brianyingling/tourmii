describe('TourSelected', function() {
  var tourSelected, user, tours;

  beforeEach(function() {
    user = new User();
    tours = new TourCollection();
    tours.add(new Tour({name:'tour1'}));
    tours.add(new Tour({name:'tour2'}));
    user.set({tours:tours});
    tourSelected = new TourSelected({tour:tours.models[0]});
  });
  describe('#initialize', function() {
    it('instantiates a new tourSelected object', function() {
      expect(tourSelected).toBeDefined();
    });
    it('should select the first tour in the user\'s collection on initial load', function() {
      tour = tourSelected.get('tour');
      expect(tour).toEqual(tours.models[0]);
    });
  });
  describe('#url', function() {
    it('should have the same url as its model url', function() {
      expect(tourSelected.url() ).toEqual(tourSelected.get('tour').url() );
    });
  });
});