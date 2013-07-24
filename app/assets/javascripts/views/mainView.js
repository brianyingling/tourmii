
var MainView = Backbone.View.extend({
  className: 'main-view',
  template: _.template( $('#main-template').html() ),
  events: {},

  initialize: function() {
    console.log('mainView initialize...');
  },
  render: function() {
    console.log('mainView render...');
    var tourMenuView;

    this.$el.html( this.template);

    tourMenuView = new TourMenuView();
    tourMenuView.render().$el;

    // establish views once user logs in:
    // 1. TourView
    // 2. TourView establishes StepViews
    // 3. TourView also establishes MapView
    return this;
  }
});