import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  address_1: DS.attr(),
  address_2: DS.attr(),
  city: DS.attr(),
  zip: DS.attr(),
  latitude: DS.attr(),
  longitude: DS.attr(),
  accomodation_type: DS.belongsTo('accomodation-type'),
  customers: DS.hasMany('customer', {})
});