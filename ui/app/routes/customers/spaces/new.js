import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function(){
    return this.store.createRecord('space');
  },
  setupController: function(controller, model){
    controller.set('model', model);
  }
});
