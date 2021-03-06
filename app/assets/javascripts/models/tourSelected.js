var TourSelected = Backbone.Model.extend({
  defaults: {
    tour: Object
  },
  initialize: function(options) {
    this.tour = options.tour;
  },
  url: function() {
    return this.tour.url();
  }
});