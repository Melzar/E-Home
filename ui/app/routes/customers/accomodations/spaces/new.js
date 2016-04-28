import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function(params, transition){
    return this.store.createRecord('space');
  },
  setupController: function(controller, model, transition){
    controller.set('model', model);
    controller.set(
      'accomodation',
      this.store.peekRecord('accomodation', transition.params['customers.accomodations.spaces'].accomodation_id));
  }
});
