import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Component.extend({
  session: service('session'),

  actions: {
    authenticate: function() {
      let { identification, password } = this.getProperties('identification', 'password');
      this.set('errorMessage', null);
      return this.get('session').authenticate('authenticator:devise', identification, password).then(function(){
      }).catch((reason) => {
        this.set('errorMessage', reason.error);
      });
    }
  }
});
