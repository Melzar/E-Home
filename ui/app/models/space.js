import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  accomodation: DS.belongsTo('accomodation', {async: false}),
  space_type: DS.belongsTo('space-type', {async: false}),
  controls: DS.hasMany('controls', {async: false}),
  meta: DS.attr()
});
