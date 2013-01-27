;
(function(Main) {
  'use strict';
  window.ahs.pages.part = {};
  window.ahs.pages.part.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:usersdata,url:'/ahs/usersdata'});
  
  var ListView = Backbone.List.View.extend({
    template : $('#listTpl').html(),
    dialog: $('#formDlg'),
    el:$('#list')
    
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog: false
  });
  list_view.render();
  
})();

$(document).ready(function() {

});