;
(function(Part) {
  var map;
  
  window.ahs.views.Part = window.ahs.views.Part || {};
  
  var View = Backbone.View.extend({
    el : $('#privateData'),
    events: {
        'click .save': 'save'
    },
    initialize: function(opts){
        var self = this;
        _.bindAll(this,'save');
        this.collection = opts.collection;
        this.form = $(this.el).formParser();
    },
    save: function(event){
      // сохранить в модель
      console.log(this);
      var data = this.form.fieldsToHash();
      //console.log(data);
      this.collection.create(data);
    }
  });
  window.ahs.views.Part.initialize = function(param) {
    new View(param);
  }
})();

$(document).ready(function() {
  
});