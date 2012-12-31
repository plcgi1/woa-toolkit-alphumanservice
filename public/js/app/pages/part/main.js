;
(function(Main) {
  'use strict';
  window.ahs.pages.part = {};
  window.ahs.pages.part.Main = {};

  var model = window.ahs.collections.PrivateData.initialize();

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
  window.ahs.views.Part.initialize({
    collection:model
  });
})();

$(document).ready(function() {

});