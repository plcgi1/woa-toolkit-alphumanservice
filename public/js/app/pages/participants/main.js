;
(function(Main) {
  'use strict';
  
  var model = window.ahs.collections.Common.initialize({data:users,url:'/ahs/participants'});
  var projectsModel = window.ahs.collections.Common.initialize({data:[],url:'/ahs'});
  var prjView = window.ahs.views.Projects.initialize({
    collection: projectsModel
  });
  
  var ListView = Backbone.List.View.extend({
    template : $('#listTpl').html(),
    dialog: $('#formDlg'),
    el:$('#list'),
    events: {
      'click .user-info' : 'user_info'
    },
    render_me: function(){
      this.render(arguments);
      $('.user-info').popover();
    },
    user_info: function(el) {
      var id = $(el.target).attr('data-user_id');
      var target = $(el.target).attr('data-target');
      
      var url = prjView.collection.url + '/'+target+'?user_id=' + id;

      $('.user-info').popover('hide');
      $(el.target).popover('toggle');

      var loaded = $(el.target).attr('data-loaded');
      if( loaded != 1 ){
        prjView.collection.fetch({
          url: url,
          //noGrowl: 1,
          success: function(data){
            var markup = prjView.render();
            $('#projectsContent'+id).html();
            $(el.target).attr('data-loaded',1);
          }
        });
      }
    },
    contacts: function(el) {
      //$(this.dialog).modal('show');
    }
  });
  
  var list_view = new ListView({
    collection: model,
    showdialog: true
  });
  list_view.render_me();
  //$('.thumbnails').masonry({
  //  // options
  //  itemSelector : '.item',
  //  columnWidth : 280
  //});
})();

$(document).ready(function() {

});