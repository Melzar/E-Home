import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function(params){
    return this.store.findRecord('space', params.id);
  },
  setupController: function(controller, model, transition){
    controller.set('model', model);
    controller.set(
      'accomodation',
      this.store.peekRecord('accomodation', transition.params['customers.accomodations.spaces'].accomodation_id));
  }
});
