import DS from 'ember-data';

export default DS.Model.extend({
    value: DS.attr(),
    created_at: DS.attr(),
    control: DS.belongsTo('control', { async: false })
});
