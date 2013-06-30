var User;

User = Backbone.Model.extend({
    defaults: {
        first_name: String
      , last_name: String
      , email: String
      , address: String

  }
  , url: function() {
      return (this.get('id')) ? '/users/' + this.get('id') : '/users/';
  }
  , initialize: function() {
      console.log('user...');
  }

});