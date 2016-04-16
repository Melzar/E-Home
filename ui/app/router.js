import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('users', function() {
    this.route('dashboard');
    this.route('living', function() {
      this.route('add_living');
    });

    this.route('livings', function() {
      this.route('add-living');
      this.route('edit-living');
      //this.route('index');
    });
  });
  this.route('reset-password');
  this.route('sign-up');
  this.route('404', { path: '/*path' });
});

export default Router;
