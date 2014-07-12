describe('Tour', function() {
  var tour;

  beforeEach(function() {
    tour = new Tour();
  });

  it("should be defined", function() {
    expect(tour).toBeDefined();
  })

  it("should instantiate a Tour object", function() {
    expect(tour).toBeDefined;
  });

  it("should have a name", function(){
    expect(tour.get('name')).toBeDefined;
    expect(typeof tour.get('name')).toEqual('function');
  });

  it("should have a user", function() {
    expect(tour.get('user')).toBeDefined;
  });
  it("should have steps", function() {
    expect(tour.get('steps')).toBeDefined;
  });
  it('should have images', function() {
    expect(tour.get('images')).toBeDefined;
  });

  describe('#save', function() {
    beforeEach(function() {
      this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      this.server.restore();
    });
    it('sends valid data to the server', function() {
      tour.save({name:'Sample Jasmine Tour'});
      var request = this.server.requests[0];
      var params = JSON.parse(request.requestBody);
      expect(params.name).toBeDefined();
    });
  });

  describe('Persistence', function() {
    beforeEach(function() {
      this.server = sinon.fakeServer.create();
      this.save_stub = sinon.stub(tour, 'save');
    });
    afterEach(function() {
      this.save_stub.restore();
      this.server.restore();
    });
    it('updates the server when the name changes', function() {
      tour.set('name', 'Sample Tour Number Two');
      tour.save();
      expect(this.save_stub.called).toBeTruthy();
    });
    it('updates the server when the user changes', function() {
      tour.set('user', new User() );
      tour.save();
      expect(this.save_stub.called).toBeTruthy();
    });
    it('updates the server when the steps change', function() {
      var s1 = new Step();
      var s2 = new Step();
      var steps = new StepCollection({models: Step});
      steps.add(s1);
      steps.add(s2);
      tour.set('steps', steps );
      tour.save();
      expect(this.save_stub.called).toBeTruthy();
    });
    it('updates the server when the images change', function() {
      tour.set('images', new ImageCollection() );
      tour.save();
      expect(this.save_stub.called).toBeTruthy();
    });

  });




});