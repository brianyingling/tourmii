var Stop;

Stop = Backbone.Model.extend({
    defaults: {
        name: String
      , lat: Number
      , lng: Number
      , streetAddress: String
      , city: String
      , state: String
      , images: Array
      , recording: Object
      , tour: Object
    }
  , initialize: function() {
      console.log("Stop initialized");
  }
});