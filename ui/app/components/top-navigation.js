import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Component.extend({
  session: service('session'),

  actions:{
    logout: function(){
      this.get('session').invalidate();
    }
  }
});
