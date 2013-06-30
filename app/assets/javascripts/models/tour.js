var Tour;

Tour = Backbone.Model.extend({
    defaults: {
        name: String
      , creator: String
      , stops: Array
      , images: Array
    }
  , initialize: function() {
      console.log('new tour...');
  }
});

