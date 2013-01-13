;
(function(GmapView) {
  var map;
  
  window.ahs.GmapView = window.ahs.GmapView || {};
  
  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Ошибка: сервис геолокации недоступен.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(60, 105),
      content: content
    };

  }

  var View = Backbone.View.extend({
    el : document.getElementById('geo'),
    markers: [],
    map_options: {},
    geoform: null,
    initialize: function(opts){
      this.geoform = opts.geoform;

      var position = new google.maps.LatLng(55.167596, 28.248897);
      if( window.geodata ){
        position = new google.maps.LatLng(window.geodata.lattitude,window.geodata.longtitude);
      }
      //console.log(coords);
      this.map_options = {
        zoom: 4,
        center: position,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      map = new google.maps.Map(this.el, this.map_options);
      var self = this;
      if( window.geodata ){
        this.place_marker({latLng:position},map);
        this.geoform.set_data(window.geodata);
      }
      google.maps.event.addListener(map, 'click', function(evt){
        self.place_marker(evt,map);
      });

      //_.bindAll(this,['place_marker','add_marker','clear_markers']);
    },
    place_marker: function(event,map){
      //console.log(event);
      var my_lat_lng = event.latLng;
      var lat = my_lat_lng.lat();
      var lng = my_lat_lng.lng();
      // удалить все маркеры
      this.clear_markers();
      // добавить установить новый
      var marker = this.add_marker(my_lat_lng);

      // создать инфоокно с возможностью ввода названия
      this.geoform.open(map,marker,lng,lat);
    },
    add_marker : function(location) {
      var clickedLocation = new google.maps.LatLng(location);
      var marker = new google.maps.Marker({
          position: location, 
          map: map
      });
      map.setCenter(location);
      this.markers = [marker];
      return marker;
    },
    clear_markers: function(){
      for(var i=0;i<this.markers.length;i++){
        this.markers[i].setMap(null);
      }
    }
  });
  window.ahs.GmapView.initialize = function(model) {
    new View({ 
      collection : window.ahs.collections.Place.initialize() ,
      geoform: window.ahs.GeoForm.view()
    });
    //console.log(window.ahs.GeoForm.view().events);
  }
})();

$(document).ready(function() {
  
});