var TourmiiRouter = Backbone.Router.extend({
  routes: {
    '/':'home',
    'tours':'toursIndex',
    'tours/:id':'showTour',
    '*default':'defaultRoute'
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
    this.navigate('/',{trigger:true});
  }
});

// instantiate Router
var tourmiiRouter = new TourmiiRouter();

// needed for urls
Backbone.history.start();