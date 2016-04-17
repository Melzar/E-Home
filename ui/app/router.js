import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('users', function() {
    this.route('dashboard');
    this.route('accomodation', function() {
      this.route('add_accomodation');
    });

    this.route('accomodations', function() {
      this.route('add-accomodation');
      this.route('edit-accomodation');
      //this.route('index');
    });
  });
  this.route('reset-password');
  this.route('sign-up');
  this.route('404', { path: '/*path' });
});

export default Router;
