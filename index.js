'use strict';
/**
 * Usage
 *   cat style.css|node index.js|jq '.stylesheet.rules[] | select(.type == "rule") | {"selector": .selectors[], "property": .declarations[].property, "value": .declarations[].value} | select(.selector | test("\\.some-selector"))'
 */
var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var css = require('css');
var ast = css.parse(input);
console.log(JSON.stringify(ast));
