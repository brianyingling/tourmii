var TourCollection = Backbone.Collection.extend({
  model: Tour,
  url: function() {
    return "/tours";
  },
  initialize: function(user) {
    // Pass in a User object
  }
});