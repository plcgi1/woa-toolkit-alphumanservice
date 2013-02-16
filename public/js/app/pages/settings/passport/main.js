;
(function(Main) {
  'use strict';
  window.ahs.pages.projects = {};
  window.ahs.pages.projects.Main = {};
  
  var model = window.ahs.collections.Common.initialize({data:project_data,url:'/ahs/project '});
    
  var ListView = Backbone. View.extend({
    el:$('#formDlg'),
    
    events : {
      'click .save' : 'save'
    },
    initialize: function(){
      this.bind('model:change',this.render);
      $(this.el).find('.date').datepicker();
      _.bindAll(this);
    },
    render: function() {
      var data = this.model.toJSON();
      if( data && data.length > 0 )
        $(this.el).find('#name').val(data[0].name);
    },
    save :function(){
      var self = this;
      var data = $(this.el).find('#name').val();
      data = { name : data };
      this.model.create(data,{
        type:'POST',
        success:function(collection,data){
          self.model.reset(data);
          self.render();
        }
      });
    }
  });
  
  var list_view = new ListView({
    model: model
  });
  list_view.render();
  
})();

$(document).ready(function() {

});