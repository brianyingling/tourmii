var Image;

Image = Backbone.Model.extend({
    defaults: {
      filename: String
    }
  , initialize: function() {
      console.log('Image initialized');
  }
});