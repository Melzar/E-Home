import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('customers', function() {
    this.route('dashboard');
    this.route('accomodations', function() {
      this.route('show', { path: '/:id'});
      this.route('edit', { path: '/:id/edit'});
      this.route('new');
    });
    this.route('spaces', function() {
      this.route('show', { path: '/:id'});
      this.route('edit', { path: '/:id/edit'});
      this.route('new');
    });
    this.route('controls', function() {
      this.route('show', { path: '/:id'});
      this.route('edit', { path: '/:id/edit'});
      this.route('new');
    });
  });
  this.route('reset-password');
  this.route('sign-up');
  this.route('404', { path: '/*path' });
  this.route('401');
});

export default Router;
