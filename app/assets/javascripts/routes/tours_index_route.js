App.ToursIndexRoute = Ember.Route.extend({
model: function() {
    return App.Tour.find();
  }
});