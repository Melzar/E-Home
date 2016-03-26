import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Component.extend({
  session: service('session'),

  actions:{
    logout: function(){
      this.get('session').invalidate();
      /* Added transition to avoid timout with redirection after logout */
      this.transitionTo('index');
    }
  }
});
