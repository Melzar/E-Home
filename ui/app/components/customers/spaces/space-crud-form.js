import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  routing: Ember.inject.service('-routing'),
  model: null,
  spaceTypes: null,
  accomodations: null,
  init: function(){
    this._super(...arguments);
    var store = this.get('store');
    var model = this.get('model');
    var _this = this;
    Ember.RSVP.hash({
      spaceTypes: Ember.$.getJSON('/customers/spaces/get_space_types.json'),
      accomodations: store.findAll('accomodation')
    }).then(function( hash ){
      store.pushPayload(hash.spaceTypes);
      var accomodations = hash.accomodations;
      var spaceTypes = store.peekAll('space-type');
      _this.set('spaceTypes', spaceTypes);
      _this.set('accomodations', accomodations);
      if(!model.get('space_type')){
        model.set('space_type', spaceTypes.get('firstObject'));
      }
      if(!model.get('accomodation')){
        model.set('accomodation', accomodations.get('firstObject'));
      }
    });
  },
  actions: {
    applySpaceType: function(spaceType){
      this.get('model').set('space_type', spaceType);
    },
    applyAccomodation: function(accomodation){
      this.get('model').set('accomodation', accomodation);
    },
    save: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      var store = this.get('store');
      model.get('errors').clear();
      model.save().then(function(){
        store.unloadRecord(model);
        routing.transitionTo('customers.spaces');
      }, function(){

      });
    },
    delete: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      model.deleteRecord();
      model.save().then(function(){
        routing.transitionTo('customers.spaces');
      },function(){

      });
    },
    cancel: function(){
      this.get('model').rollbackAttributes();
      this.get('routing').transitionTo('customers.spaces');
    }
  }
});
