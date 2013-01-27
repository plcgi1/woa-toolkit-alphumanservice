;
(function(Main) {
  'use strict';
  window.ahs.pages.goals = {};
  window.ahs.pages.goals.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:goals,url:'/ahs/goals'});
  
  var ListView = Backbone.List.View.extend({
    template : $('#listTpl').html(),
    dialog: $('#formDlg'),
    el:$('#list')
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog : 1
  });
  list_view.render();
  
})();

$(document).ready(function() {

});