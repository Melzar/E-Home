import Ember from 'ember';

import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return this.store.createRecord('accomodation');
  },

  actions:{
    save: function(){
      this.currentModel.save().then(function(data){
        console.log('passed');
      },function(error){

      });
    }
  }
});
