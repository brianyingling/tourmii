App.ToursNewRoute = Ember.Route.extend({
  model: function() {
    return App.Tour.createRecord();
  }
});