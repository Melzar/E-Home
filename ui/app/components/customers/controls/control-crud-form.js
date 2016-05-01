import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  routing: Ember.inject.service('-routing'),
  model: null,
  controlTypes: null,
  spaces: null,
  init: function(){
    this._super(...arguments);
    var store = this.get('store');
    var model = this.get('model');
    var _this = this;
    Ember.RSVP.hash({
      controlTypes: Ember.$.getJSON('/customers/get_controls_types'),
      spaces: store.findAll('space')
    }).then(function(hash){
      store.pushPayload(hash.controlTypes);
      var control_types = store.peekAll('control-type');
      var spaces = hash.spaces;
      _this.set('spaces', spaces);
      _this.set('controlTypes', control_types);
      if(!model.get('control_type')){
        model.set('control_type', control_types.get('firstObject'));
      }
      if(!model.get('space')){
        model.set('space', spaces.get('firstObject'));
      }
    });
  },
  actions: {
    applyControlType: function(controlType){
      this.get('model').set('control-type',controlType);
    },
    applySpace: function(space){
      this.get('model').set('space', space);
    },
    save: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      var store = this.get('store');
      model.get('errors').clear();
      model.save().then(function(){
        store.unloadRecord(model);
        routing.transitionTo('customers.controls');
      }, function(){

      })
    },
    delete: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      model.deleteRecord();
      model.save().then(function(){
        routing.transitionTo('customers.controls');
      }, function(){

      });
    },
    cancel: function(){
      this.get('model').rollbackAttributes();
      window.history.back(-1);
    }
  }
});
