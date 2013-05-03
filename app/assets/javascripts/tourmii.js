window.App = Ember.Application.create({
  LOG_TRANSITIONS: true
});

App.Router.map(function() {
  this.route('home'),
  this.resource('searches', function() {
    this.route('new');
  }),
  this.resource('tours', function() {
    this.route('new');
    this.route('index');
  });
});

App.Store = DS.Store.extend({
  revision: 12
});