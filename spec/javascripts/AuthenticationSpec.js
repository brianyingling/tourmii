describe('Authentication', function() {
  beforeEach(function() {
    authentication = new Authentication();
  });
  describe('initialize', function() {
    it('instantiates a new Authentication object', function() {
      expect(authentication).toBeDefined();
    });
  });
  // describe('#requestAccess', function() {
  //   it('authenticates a request for access to an API', function() {
  //     haveAccess = authentication.requestAccess();
  //     expect(haveAccess).toBeTruthy();
  //   });
  // });
});