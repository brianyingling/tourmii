var TourMenuItemView = Backbone.View.extend({
  tagName: 'li',
  className: 'tour-menu-item',

  initialize: function() {
    console.log('tour-menu-item-view initialized...');

  },
  render: function() {
    this.$el.append( this.options.tour.get('name') );
    return this;
  }

});