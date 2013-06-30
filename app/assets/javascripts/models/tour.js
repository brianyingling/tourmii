var Tour;

Tour = Backbone.Model.extend({
    defaults: {
        name: String
      , user: Object
      , stops: Array
      , images: Array
    }
  , url: function() {
      var id = this.get('id');
      return (id) ? '/tours/' + id : '/tours/';
  }

  , initialize: function() {
      console.log('new tour...');
  }
});

