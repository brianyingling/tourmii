
var User = Backbone.Model.extend({
    defaults: {
        first_name: String
      , last_name: String
      , email: String
      , address: String
      , tours: Array
  }

  , url: function() {
      return (this.get('id')) ? '/users/' + this.get('id') : '/users/';
  }
  , initialize: function() {
      // this.on('change', this.update);

  }
  , parse: function(response) {
      console.log('User() parse...');
      this.set({first_name:response.first_name});
      this.set({last_name:response.last_name});
      this.set({email:response.email});
      this.set({address:response.address});
      this.set({tours: new TourCollection( response.tours )});
  }
  , getFirstName: function() {
      return this.get('first_name');
  }
  , toJSON: function() {
      return { user: this.attributes };
  }
  , update: function() {
      this.save();
  }


});