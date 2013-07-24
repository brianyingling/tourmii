describe('User', function() {
  var user;

  beforeEach(function() {
    this.user = new User();
    this.server = sinon.fakeServer.create();
  });

  afterEach(function() {
    this.server.restore();
  });

  describe('#initialize', function() {
    it('instantiates a new User object', function() {
      expect(this.user).toBeDefined();
    });

  });

  describe('#save', function() {
    it('sends valid data to the server', function() {
      this.user.save({first_name:'Melissa',last_name:'Yingling'});
      var request = this.server.requests[0];
      var params = JSON.parse(request.requestBody);

      expect(params.user).toBeDefined();
      expect(params.user.first_name).toEqual('Melissa');
      expect(params.user.last_name).toEqual('Yingling');
    });
  });

  describe('#fetch', function() {
    it('retrieves valid data from the server', function() {
      this.ajax_stub = sinon.stub($, "ajax").yieldsTo("success",
        {id:1, email:'brian_yingling@yahoo.com'}
      );

      this.user.fetch();
      expect(this.user.get('email')).toEqual('brian_yingling@yahoo.com');

      this.ajax_stub.restore();
    });

  });

  describe('Persistence', function() {
    beforeEach(function() {
      this.save_stub = sinon.stub(this.user, 'save');
      this.save_spy = sinon.spy();
    });
    afterEach(function() {
      this.save_stub.restore();
    });

    it('updates the server when first name is changed', function() {
      this.user.set('first_name', 'Joe');
      expect(this.save_stub.called).toBeTruthy();
    });
    it('updates the server when the last name is changed', function() {
      this.user.set('last_name', "Smith");
      expect(this.save_stub.called).toBeTruthy();
    });
    it('updates the server when the email is changed', function() {
      this.user.set('email', 'byingling@gmail.com');
    });

  });


});