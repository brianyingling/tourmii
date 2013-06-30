App.Step = DS.Model.extend({
  name: DS.attr('string'),
  description: DS.attr('string'),
  address: DS.attr('string'),
  lat: DS.attr('number'),
  lng: DS.attr('number'),
  reference: DS.attr('string'),
  audiofile: DS.attr('string'),
  position: DS.attr('string'),
  tour_id: DS.attr('number'),
  tour: DS.belongsTo('App.Tour'),
});