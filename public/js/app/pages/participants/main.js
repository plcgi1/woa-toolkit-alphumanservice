;
(function(Main) {
  'use strict';
  
  var model = window.ahs.collections.Common.initialize({data:users,url:'/ahs/participants'});
    
  var ListView = Backbone.List.View.extend({
    template : $('#listTpl').html(),
    dialog: $('#formDlg'),
    el:$('#list')
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog: true
  });
  list_view.render();
})();

$(document).ready(function() {

});