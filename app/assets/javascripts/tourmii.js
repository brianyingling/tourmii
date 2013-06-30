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
    this.route('show', {path: ':tour_id'});
  });
});

App.Store = DS.Store.extend({
  revision: 12
});