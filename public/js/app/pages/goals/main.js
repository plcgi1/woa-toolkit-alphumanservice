;
(function(Main) {
  'use strict';
  window.ahs.pages.goals = {};
  window.ahs.pages.goals.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:goals,url:'/ahs/goals'});
  var model_for_all = window.ahs.collections.Common.initialize({data:goals,url:'/ahs/part-form/confirm'});
  var pubsub = _.extend({}, Backbone.Events);
  
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
      
      this.pubsub.bind('list:saved',function(){
        self.toggle_confirm(arguments);
      });
    },
    toggle_confirm: function(){
      var pd = (project_data.length > 0);
      var gd = (geodata.length > 0 );
      var ud = (usersdata.length > 0);
      var gd1 = (this.collection.toJSON().length > 0);
      if(  pd && gd && ud && gd1 ){
        $('.confirm').show();
      }
      else {
        $('.confirm').hide();
      }
    },
    confirm:function(el) {
      model_for_all.create();
    }
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog : 1
  });
  list_view.render();
  list_view.toggle_confirm();
})();

$(document).ready(function() {

});