var StepCollection;

StepCollection = Backbone.Collection.extend({
    model: Step
  , url: function() {
      return '/steps/';
  }
});