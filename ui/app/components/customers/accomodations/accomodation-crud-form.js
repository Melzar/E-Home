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
      var accomodation_types = store.peekAll('accomodation-type');
      _this.set('accomodationTypes', accomodation_types);
      if(!model.get('accomodation_type')){
        model.set('accomodation_type', accomodation_types.get('firstObject'));
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
      model.save().then(function(data){
        route.transitionTo('customers.accomodations');
      },function(error){
        model.get("errors").clear();
      });
    },
    cancel: function(){
      this.get('model').rollbackAttributes();
      this.get('routing').transitionTo('customers.accomodations');
    }
  }
});
