import Ember from 'ember';
import moment from 'npm:moment';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin,{
  model: function(params){
    return this.store.findRecord('control', params.id, {reload: true});
  },
  setupController: function(controller, model){
    controller.set('model', model);
  }
});
