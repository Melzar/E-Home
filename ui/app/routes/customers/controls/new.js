import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function(){
    return this.store.createRecord('control');
  },
  setupController(controller, model){
    controller.set('model', model);
  },
  actions: {
    cancel: function(){
      this.currentModel.rollbackAttributes();
      this.transitionTo('customers.controls');
    }
  }
});
