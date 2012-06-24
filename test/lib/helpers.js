var helpers;

module('helpers');

helpers = myproject.helpers;

test('add', function() {
  equal(helpers.add(2, 4), 6, 'Simple addition');
  return equal(helpers.add(-2, -4), -6, 'Negative numbers');
});

test('multiply', function() {
  equal(helpers.multiply(2, 4), 8, 'Multiplication');
  return equal(helpers.multiply(2, 0), 2, 'Multiply by zero');
});

test('square', function() {
  equal(helpers.square(3), 9, 'Squaring');
  return equal(helpers.square(-3), 9, 'Negative number');
});
