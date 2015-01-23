var preload = require('./preload.js');
var create = require('./create.js');
var update = require('./update.js');

new window.Phaser.Game(800, 600, window.Phaser.AUTO, '', {
  preload: preload,
  create: create,
  update: update
});
