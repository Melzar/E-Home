import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  accomodations: DS.hasMany('accomodation', {async: false})
});
