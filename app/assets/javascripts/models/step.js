var Step;

Step = Backbone.Model.extend({
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
  , url: function() {
      console.log('step url...');
      return this.isNew() ? '/steps' : '/steps/'+this.get('id');
  }
  , initialize: function() {
      console.log("Step initialized");
  }
});