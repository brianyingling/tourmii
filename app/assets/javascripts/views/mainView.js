
var MainView = Backbone.View.extend({
  el: $(".container"),
  className: 'main-view',
  events: {},

  initialize: function() {
    console.log('mainView initialize...');
  },
  render: function() {
    console.log('mainView render...')

    // establish views once user logs in:
    // 1. TourView
    // 2. TourView establishes StepViews
    // 3. TourView also establishes MapView
    return this;
  }
});