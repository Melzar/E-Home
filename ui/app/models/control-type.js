import DS from 'ember-data';

export default DS.Model.extend({
    name: DS.attr(),
    controls: DS.hasMany('control', { async: false })
});
