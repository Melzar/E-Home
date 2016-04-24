import Ember from 'ember';

export default Ember.Route.extend({
  model: function(){
    var store = this.store;
    Ember.RSVP.hash({
      accomodationTypes: Ember.$.getJSON('/customers/accomodations/get_accomodation_types.json')
    }).then( function( hash ) {
      store.pushPayload(hash.accomodationTypes);
    });
    return this.store.findAll('accomodation');
  }
});
