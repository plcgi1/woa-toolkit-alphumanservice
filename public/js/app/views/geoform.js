;(function(GeoForm) {
  var map;
  
  window.ahs.GeoForm = window.ahs.GeoForm || {};
  
  var View = Backbone.View.extend({
    el : $('#geoplaceDlg'),
    form: $('#geoplace').formParser(),
    content: null,
    infowindow: null,
    events : {
      'click .save' : 'save'
    },
    initialize: function(){
      //_.bind(this,'save_data');
      this.content = $('#geoplace').html();
      this.infowindow = new google.maps.InfoWindow({});
    },
    set_data:function(geodata){
      this.form.valuesToForm({
        lattitude : geodata[0].lattitude,
        longtitude : geodata[0].longtitude,
        name: geodata[0].name
      });
    },
    open: function(map,marker,lng,lat){
      var content = $('#geoplace').html();
      this.form.valuesToForm({lattitude : lat,longtitude : lng});
      this.infowindow.setContent(content);
      this.infowindow.open(map,marker);
      var self = this;
      
      $('.save').live('click',function(){
        self.save();
      });
    },
    save: function(event){
      var data = this.form.fieldsToHash();
      data.name = $('#name').val();
      console.log(data);
      this.collection.reset(data);
      // сохранить в модель
      this.collection.create(data);
    }
  });
  var view = new View({ collection : window.ahs.collections.Place.initialize() });

  window.ahs.GeoForm.view = function(model) {
    return view;
  }
})();

$(document).ready(function() {
  
});