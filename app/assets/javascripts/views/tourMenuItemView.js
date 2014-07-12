  var TourMenuItemView = Backbone.View.extend({
    tagName: 'li',
    className: 'tour-menu-item',
    template: $('#tour-menu-item-template'),
    events: {
      'click':'select'
    },

    initialize: function() {
      console.log('tour-menu-item-view initialized...');
      this.model = this.options.model;
      this.$el.data('id', this.model.get('id') );
    },

    // selects a tour from one of the tours in the menu.
    select: function(e) {
      console.log('tourMenuItemView.select()...');
      e.preventDefault();
      id = $(e.target).parent().data();
      id = id.id;
      tour = new Tour({id:id});
      tour.fetch({
        success: function() {
          window.tourSelected.set({tour:tour});
        }
      });
    },

    render: function() {
      this.$el.attr('data-id', this.model.get('id'));
      html = _.template( this.template.html(), this.model.toJSON() );
      this.$el.html( html );
      return this;
    }

});