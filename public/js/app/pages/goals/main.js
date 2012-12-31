;
(function(Main) {
  'use strict';
  window.ahs.pages.goals = {};
  window.ahs.pages.goals.Main = {};

  var model = window.ahs.collections.Goals.initialize();

  //var Controller = Backbone.Router.extend({
  //  routes: {
  //    'privatedata/:userid': 'userdata'
  //  },
  //  initialize: function(opts) {
  //    var self = this;
  //    _.bindAll(this);
  //    this.view = opts.view;
  //  },
  //  userdata: function(userid) {
  //    alert('userdata');
  //  }
  //});
  //var r = new Controller();
  window.ahs.views.Goals.initialize({
    collection:model
  });
})();

$(document).ready(function() {

});