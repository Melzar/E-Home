/**
 * Created by matuszewski on 03/05/16.
 */

import Ember from 'ember';
import ESASession from "ember-simple-auth/services/session";

export default ESASession.extend({

  store: Ember.inject.service(),

  checkIfAuthenticatedInBackend: function() {
    var token = this.get('data.authenticated.token');
    var email = this.get('data.authenticated.email');
    return Ember.$.ajax({
        url: '/users/sign_in',
        method: 'POST',
        headers: {
          'Authorization': 'Token token="'+token+'", email="'+email+'"'
        }
    });
  }

});
