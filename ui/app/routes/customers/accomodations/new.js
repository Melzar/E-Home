import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.createRecord('accomodation');
  },

  actions:{
    save: function(){
      var model = this.currentModel;
      var route = this;
      model.get("errors").clear();
      model.save().then(function(data){
        route.transitionTo('customers.accomodations');
      },function(error){
      });
    },
    cancel: function(){
      this.currentModel.rollbackAttributes();
      this.transitionTo('customers.accomodations');
    }
  }
});
