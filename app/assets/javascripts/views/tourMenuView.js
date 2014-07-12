var TourMenuView = Backbone.View.extend({
  tagName: 'ul',
  className: 'tour-menu-container',
  events: {},

  initialize: function() {
    console.log('tourMenuView rendered...');
    this.tours = this.options.tours;
  },

  render: function() {
    var tours = this.tours.models;
    var tourMenuItems = [];

    _.each(tours, function(tour) {
      tourMenuItemView = new TourMenuItemView({model: tour});
      tourMenuItems.push( tourMenuItemView.render().el );
    });
    this.$el.html( tourMenuItems );
    return this;
  }

});