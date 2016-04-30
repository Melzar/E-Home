import DS from 'ember-data';

export default DS.Model.extend({
    name: DS.attr(),
    status: DS.attr(),
    uuid: DS.attr(),
    control_type: DS.belongsTo('control-type', { async: false }),
    control_logs: DS.hasMany('control-log', { async: false })
});
