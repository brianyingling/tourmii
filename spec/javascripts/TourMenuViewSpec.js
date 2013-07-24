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
      {tours:this.tours});
    user.fetch();
    tours = user.get('tours');
    tourMenuView = new TourMenuView({tours:this.tours});
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
    it('lists all of the user\'s tours', function() {
      expect(tours.length).toEqual( $('.tour-menu li').length );
    });
  });
});