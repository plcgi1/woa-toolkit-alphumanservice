;
(function(Main) {
  'use strict';
  window.ahs.pages.contacts = {};
  window.ahs.pages.contacts.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:contacts});
    
  var View = Backbone.AjaxForm.View.extend({
    el:$('#contacts')
  });
  var list_view = new View({
    collection: model
  });
})();

$(document).ready(function() {

});