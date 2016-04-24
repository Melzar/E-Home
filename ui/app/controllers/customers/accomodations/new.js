import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    applyAccomodationType: function(accomodationType){
      this.get('model').set('accomodation_type', accomodationType);
    }
  }
});
