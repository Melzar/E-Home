import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  routing: Ember.inject.service('-routing'),
  model: null,
  spaceTypes: null,
  accomodation: null,
  init: function(){
    this._super(...arguments);
    var store = this.get('store');
    var model = this.get('model');
    var _this = this;
    Ember.RSVP.hash({
      spaceTypes: Ember.$.getJSON('/customers/spaces/get_space_types.json')
    }).then(function( hash ){
        store.pushPayload(hash.spaceTypes);
        var spaceTypes = store.peekAll('space-type');
        _this.set('spaceTypes', spaceTypes);
        if(!model.get('space_type')){
          model.set('space_type', spaceTypes.get('firstObject'));
        }
    });
  },
  actions: {
    applySpaceType: function(spaceType){
      this.get('model').set('space_type', spaceType);
    },
    save: function(){
      var model = this.get('model');
      var routing = this.get('routing');
      var accomodation = this.get('accomodation');
      model.save().then(function(){
        routing.transitionTo('customers.accomodations.show', [accomodation]);
      }, function(error){
        model.get('errors').clear();
      });
    },
    cancel: function(){
      this.get('model').rollbackAttributes();
      var accomodation = this.get('accomodation');
      this.get('routing').transitionTo('customers.accomodations.show' , [accomodation]);
    }
  }
});
