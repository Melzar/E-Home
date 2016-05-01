import DS from 'ember-data';

export default DS.Model.extend({
    name: DS.attr(),
    state: DS.attr(),
    status: DS.attr(),
    uuid: DS.attr(),
    space: DS.belongsTo('space', { async: false }),
    control_type: DS.belongsTo('control-type', { async: false }),
    control_logs: DS.hasMany('control-log', { async: false }),
    meta: DS.attr()
});
