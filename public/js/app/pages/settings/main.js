;
(function(Main) {
  'use strict';
  window.ahs.pages.settings = {};
  window.ahs.pages.settings.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:[]});
    
  var View = Backbone.AjaxForm.View.extend({
    el:$('#form')
  });
  var list_view = new View({
    collection: model
  });
  $('.date').datepicker();
})();

$(document).ready(function() {

});