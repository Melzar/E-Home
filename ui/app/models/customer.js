import DS from 'ember-data';

export default DS.Model.extend({
  first_name: DS.attr(),
  last_name: DS.attr(),
  phone_number: DS.attr(),
  address_1: DS.attr(),
  address_2: DS.attr(),
  city: DS.attr(),
  accomodations: DS.hasMany('accomodation')
});
