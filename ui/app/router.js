import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('users', function() {
    this.route('dashboard');
  });
  this.route('reset-password');
  this.route('sign-up');
});

export default Router;
