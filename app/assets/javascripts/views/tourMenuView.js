var TourMenuView = Backbone.View.extend({
  className: 'tour-menu',
  initialize: function() {
    console.log('tourMenuView rendered...');
    this.tours = this.options.tours;

  },
  render: function() {
    _.each(tours.models, function(tour) {
      tourMenuItemView = new TourMenuItemView({model: tour});
      this.$el.append( tourMenuItemView.render().el );
    });

    return this;
  }
});