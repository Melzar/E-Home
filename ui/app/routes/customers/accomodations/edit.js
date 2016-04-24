import Ember from 'ember';

export default Ember.Route.extend({
    model: function(params){
      return this.store.find('accomodation',params.id);
    },
    afterModel: function(model, transition){
      Ember.RSVP.hash({
        accomodationTypes: Ember.$.getJSON('/customers/accomodations/get_accomodation_types.json')
      }).then( function( hash ) {
        model.store.pushPayload(hash.accomodationTypes);
        model.set('accomodation_type', model.store.peekAll('accomodation-type').get('firstObject'));
      });
    },
    actions: {
      cancel: function(){
        this.currentModel.rollbackAttributes();
        this.transitionTo('customers.accomodations');
      }
    }
});
