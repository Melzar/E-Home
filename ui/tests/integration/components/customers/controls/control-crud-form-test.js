import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('customers/controls/control-crud-form', 'Integration | Component | customers/controls/control crud form', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{customers/controls/control-crud-form}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#customers/controls/control-crud-form}}
      template block text
    {{/customers/controls/control-crud-form}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
