import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.createRecord('accomodation');
  },
  afterModel: function(model, transition){
    Ember.RSVP.hash({
      accomodationTypes: Ember.$.getJSON('/customers/accomodations/get_accomodation_types.json')
    }).then( function( hash ) {
      model.store.pushPayload(hash.accomodationTypes);
      model.set('accomodation_type', model.store.peekAll('accomodation-type').get('firstObject'));
    });
  },
  setupController: function(controller, model){
    controller.set('model', model);
    controller.set('accomodationTypes', this.store.peekAll('accomodation-type'));
  },
  actions:{
    save: function(){
      var model = this.currentModel;
      var route = this;
      this.currentModel.save().then(function(data){
        route.transitionTo('customers.accomodations');
      },function(error){
        model.get("errors").clear();
      });
    },
    cancel: function(){
      this.currentModel.rollbackAttributes();
      this.transitionTo('customers.accomodations');
    }
}
});
