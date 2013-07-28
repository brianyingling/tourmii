
var MainView = Backbone.View.extend({
  className: 'main-view',
  template: _.template( $('#main-template').html() ),
  events: {},

  initialize: function() {
    console.log('mainView initialize...');
    // set the first tour in the collection as the one selected
    // on initial load
    var firstTour = user.get('tours').models[0];
    tourSelected = new TourSelected({tour:firstTour});
  },
  render: function() {
    console.log('mainView render...');
    var html, tourMenuView, tour;

    // build the tour menu
    tourMenuView = new TourMenuView({tours:user.get('tours')} );
    tourMenuHtml = tourMenuView.render().$el;

    // build the map
    tour = user.get('tours').models[0];
    mapView = new MapView({model: window.tourSelected});
    mapViewHtml = mapView.render().el;

    this.$el.html( tourMenuHtml );
    this.$el.append( mapViewHtml );
    return this;
  }
});