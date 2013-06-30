App.StepsRoute = Ember.Route.extend({
  model: function() {
    return App.Step.find();
  }
});