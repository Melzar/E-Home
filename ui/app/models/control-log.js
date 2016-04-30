import DS from 'ember-data';

export default DS.Model.extend({
    lux: DS.attr(),
    humidity: DS.attr(),
    temperature: DS.attr(),
    db: DS.attr(),
    voltage: DS.attr(),
    network: DS.attr(),
    no_2: DS.attr(),
    co_2: DS.attr(),
    control: DS.belongsTo('control', { async: false })
});
