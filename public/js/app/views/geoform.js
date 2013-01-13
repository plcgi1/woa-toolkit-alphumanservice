;(function(GeoForm) {
  var map;
  
  window.ahs.GeoForm = window.ahs.GeoForm || {};
  
  var View = Backbone.View.extend({
    el : $('#geoplaceDlg'),
    form: $('#geoplace').formParser(),
    infowindow: null,
    initialize: function(){
      //_.bind(this,'save_data');
      
      this.infowindow = new google.maps.InfoWindow({
        content: $(this.el).html()
      });
    },
    set_data:function(geodata){
      this.form.valuesToForm({
        lattitude : geodata.lattitude,
        longtitude : geodata.longtitude,
        name: geodata.name
      });
    },
    open: function(map,marker,lng,lat){
      //if( lat.match() ){}
      this.form.valuesToForm({lattitude : lat,longtitude : lng});
      this.infowindow.open(map,marker);
      var self = this;
      $('.save').click(function(){
        self.save();
      });
    },
    save: function(event){
      var data = this.form.fieldsToHash();
      // сохранить в модель
      this.collection.create(data);
      //$('.edit').show();
      //$('.save').hide();
      //$('#name').attr({disabled:true});
    }
  });
  var view = new View({ collection : window.ahs.collections.Place.initialize() });

  window.ahs.GeoForm.view = function(model) {
    return view;
  }
})();

$(document).ready(function() {
  
});