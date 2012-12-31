;
(function(Goals) {
  var map;
  
  window.ahs.views.Goals = window.ahs.views.Goals || {};
  
  var View = Backbone.View.extend({
    el : $('#goalDlg'),
    events: {
        'click .save': 'save'
    },
    initialize: function(opts){
        var self = this;
        _.bindAll(this,'save');
        //this.collection = opts.collection;
        //this.form = $(this.el).formParser();
    },
    save: function(event){
      //$(this.el).modal('show');
      // сохранить в модель
      //console.log(this);
      //var data = this.form.fieldsToHash();
      //console.log(data);
      this.collection.create({ goal: $('#goalFld').val()});
    }
  });
  window.ahs.views.Goals.initialize = function(param) {
    new View(param);
  }
})();

$(document).ready(function() {
  
});