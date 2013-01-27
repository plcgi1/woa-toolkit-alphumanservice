;
(function(Part) {
  var map;
  
  window.ahs.views.Part = window.ahs.views.Part || {};
  
  var View = Backbone.View.extend({
    el : $('#privateData'),
    form: null,
    events: {
      'click .save': 'save'
    },
    initialize: function(opts){
        var self = this;
        _.bindAll(this);
        this.collection = opts.collection;
        this.form = $(this.el).formParser();
    },
    values_to_form:function(model){
      this.form.valuesToForm(model.toJSON());
    },
    save: function(event){
      // сохранить в модель
      var data = this.form.fieldsToHash();
      //console.log(data);
      this.collection.create(data);
    }
  });
  window.ahs.views.Part.initialize = function(param) {
    return new View(param);
  }
})();

$(document).ready(function() {
  
});