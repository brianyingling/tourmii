var TourmiiRouter = Backbone.Router.extend({
  routes: {
    'tours':'toursIndex',
    'tours/:id':'showTour',
    '/':'defaultRoute'
  },
  home: function() {
    console.log('home...');
  },
  toursIndex: function() {
    console.log('getToursIndex...');
  },
  showTour: function(id) {
    console.log('showTour...');
    console.log(id);
  },
  defaultRoute: function() {
    console.log('default route...');
    main = new MainView();
    main.render().$el;
  }
});
