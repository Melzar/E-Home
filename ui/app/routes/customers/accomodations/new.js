import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.createRecord('accomodation');
  },
  setupController: function(controller, model){
    controller.set('model', model);
    controller.set('accomodationTypes', this.store.peekAll('accomodation-type'));
  },
  actions: {
    cancel: function(){
      this.currentModel.rollbackAttributes();
      this.transitionTo('customers.accomodations');
    }
  }
});
