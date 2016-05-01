import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service(),
  didInsertElement: function() {
    initialize();
  },
});
