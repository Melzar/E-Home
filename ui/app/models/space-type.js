import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  spaces: DS.hasMany('space', {async: false})
});
