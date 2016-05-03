import Ember from 'ember';

import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin,{
  session: Ember.inject.service(),
  beforeModel: function(){
    var session = this.get('session');
    var _this = this;
    this.get('session').checkIfAuthenticatedInBackend().then(function(){},function(error){
      if(error.status === 401){
        session.invalidate();
        _this.transitionTo('401');
      }
    });
    return true; // Bubble the didTransition event
  }
});
