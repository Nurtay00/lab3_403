
"use strict";

let tactile = require('./tactile.js');
let state = require('./state.js');
let rigid = require('./rigid.js');
let newtactile = require('./newtactile.js');
let fsrInput = require('./fsrInput.js');
let coord = require('./coord.js');
let contact = require('./contact.js');
let accelerometr = require('./accelerometr.js');

module.exports = {
  tactile: tactile,
  state: state,
  rigid: rigid,
  newtactile: newtactile,
  fsrInput: fsrInput,
  coord: coord,
  contact: contact,
  accelerometr: accelerometr,
};
