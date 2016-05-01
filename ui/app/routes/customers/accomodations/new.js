import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
import Parent from 'ember-cli-history-mixin/mixins/route-history';
export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function () {
    return this.store.createRecord('accomodation');
  },
  setupController: function (controller, model) {
    controller.set('model', model);
  },
  actions: {
    cancel: function () {
      this.currentModel.rollbackAttributes();
      this.transitionTo('customers.accomodations');
    }
  }
});
