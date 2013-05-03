App.Tour = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  reference: DS.attr('string'),
  lat: DS.attr('number'),
  lng: DS.attr('number'),
  price: DS.attr('number'),
  tour_id: DS.attr('number')
  // steps: DS.hasMany('App.Step')
});