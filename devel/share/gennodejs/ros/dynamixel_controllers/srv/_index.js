
"use strict";

let TorqueEnable = require('./TorqueEnable.js')
let StopController = require('./StopController.js')
let StartController = require('./StartController.js')
let SetTorqueLimit = require('./SetTorqueLimit.js')
let SetSpeed = require('./SetSpeed.js')
let SetComplianceSlope = require('./SetComplianceSlope.js')
let SetCompliancePunch = require('./SetCompliancePunch.js')
let SetComplianceMargin = require('./SetComplianceMargin.js')
let RestartController = require('./RestartController.js')

module.exports = {
  TorqueEnable: TorqueEnable,
  StopController: StopController,
  StartController: StartController,
  SetTorqueLimit: SetTorqueLimit,
  SetSpeed: SetSpeed,
  SetComplianceSlope: SetComplianceSlope,
  SetCompliancePunch: SetCompliancePunch,
  SetComplianceMargin: SetComplianceMargin,
  RestartController: RestartController,
};
