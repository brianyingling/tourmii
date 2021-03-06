describe('TourMenuView', function() {
  var tourMenuView, user, tours;

  beforeEach(function() {
    this.server = sinon.fakeServer.create();
    this.tours = new TourCollection();
    t1 = new Tour({name:'tour1'});
    t2 = new Tour({name:'tour2'});
    this.tours.add(t1);
    this.tours.add(t2);

    user = new User(
      {id:1},
      {first_name:'Tom'},
      {last_name:'Jones'},
      {tours:this.tours}
    );
    user.save();
    tours = user.get('tours');
    tourMenuView = new TourMenuView({tours:tours});
  });
  afterEach(function() {
    this.server.restore();
  });
  describe('#initialize', function() {
    it('instantiates a tour menu view obj', function() {
      expect(tourMenuView).toBeDefined();
    });
  });
  describe('#render', function() {
    it('instantiates the tour menu element', function() {
      menu = tourMenuView.render().el;
      expect( $(menu) ).toBeDefined();
    });
  });
  describe('when clicked', function() {
    it('should display the tour\'s basic info', function() {

    });
    it('should display the tour\'s map', function() {
    });
  });
});