;
(function(Main) {
  'use strict';
  window.ahs.pages.media = {};
  window.ahs.pages.media.Main = {};
  
  var model = window.ahs.collections.Upload.initialize({data:[],url:'/ahs/settings/media'});
  
  var View = Backbone.Uploader.View.extend({
    fieldName: 'media',
    progressBar: 'progressBar',
    percentage: 'percentage',
    collection: model,
    mediaConfig: media_config,
    el: $('#file-container'),
    template: $('#listTpl2').html(),
    validate: media_config,
    onError: function(args){
      window.ErrorVis.show_errors(args);
    }
  });
  var uploadeView = new View();

  uploadeView.render();
})();

$(document).ready(function() {

});