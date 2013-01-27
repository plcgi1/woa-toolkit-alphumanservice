;
(function(Main) {
  'use strict';
  window.ahs.pages.goals = {};
  window.ahs.pages.goals.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:goals,url:'/ahs/goals'});
  var model_for_all = window.ahs.collections.Common.initialize({data:goals,url:'/ahs/registration/confirm'});
  
  var ListView = Backbone.List.View.extend({
    template : $('#listTpl').html(),
    dialog: $('#formDlg'),
    el:$('#list'),
    initialize:function(opts){
      ListView.__super__.initialize.apply(this,[opts]);
      var self = this;
      $('.confirm').on('click',function(el){
        self.confirm(el);
      })
    },
    confirm:function(el) {
      alert('confirm');
      model_for_all.create();
    }
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog : 1
  });
  list_view.render();
  
})();

$(document).ready(function() {

});