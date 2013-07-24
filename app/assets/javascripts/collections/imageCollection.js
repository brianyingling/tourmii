var ImageCollection;

ImageCollection = Backbone.Collection.extend({
  model: Image,
  url: function() {
    return '/images';
  }
});
