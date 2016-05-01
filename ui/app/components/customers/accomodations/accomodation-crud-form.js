import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  routing: Ember.inject.service('-routing'),
  model: null,
  accomodationTypes: null,
  init: function(){
    this._super(...arguments);
    var store = this.get('store');
    var model = this.get('model');
    var _this = this;
    Ember.RSVP.hash({
      accomodationTypes: Ember.$.getJSON('/customers/accomodations/get_accomodation_types.json')
    }).then( function( hash ) {
      store.pushPayload(hash.accomodationTypes);
      var accomodationTypes = store.peekAll('accomodation-type');
      _this.set('accomodationTypes', accomodationTypes);
      if(!model.get('accomodation_type')){
        model.set('accomodation_type', accomodationTypes.get('firstObject'));
      }
    });
  },
  actions: {
    applyAccomodationType: function(accomodationType){
      this.get('model').set('accomodation_type', accomodationType);
    },
    save: function(){
      var model = this.get('model');
      var route = this.get('routing');
      var store = this.get('store');
      model.get("errors").clear();
      model.save().then(function(){
        store.unloadRecord(model);
        route.transitionTo('customers.accomodations');
      },function(){

      });
    },
    delete: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      model.deleteRecord();
      model.save().then(function(){
        routing.transitionTo('customers.accomodations');
      },function(){

      });
    },
    cancel: function(){
      this.get('model').rollbackAttributes();
      this.get('routing').transitionTo('customers.accomodations');
    }
  }
});
