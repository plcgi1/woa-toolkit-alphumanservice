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
    initialize: function(){
      this.map_options = {
        zoom: 4,
        center: new google.maps.LatLng(55.167596, 28.248897),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      map = new google.maps.Map(this.el, this.map_options);
      var self = this;
      google.maps.event.addListener(map, 'click', function(evt){
        self.place_marker(evt);
      });
      //_.bindAll(this,['place_marker','add_marker','clear_markers']);
    },
    place_marker: function(event){
      var my_lat_lng = event.latLng;
      var lat = my_lat_lng.lat();
      var lng = my_lat_lng.lng();
      // удалить все маркеры
      this.clear_markers();
      // добавить установить новый
      this.add_marker(my_lat_lng);
      // сохранить в модель
      //console.log(this);
      this.collection.create({lattitude:lat,longtitude:lng});
    },
    add_marker : function(location) {
      var clickedLocation = new google.maps.LatLng(location);
      var marker = new google.maps.Marker({
          position: location, 
          map: map
      });
      map.setCenter(location);
      this.markers = [marker];
    },
    clear_markers: function(){
      for(var i=0;i<this.markers.length;i++){
        this.markers[i].setMap(null);
      }
    }
  });
  window.ahs.GmapView.initialize = function(model) {
    new View({ collection : window.ahs.collections.Place.initialize() });
  }
})();

$(document).ready(function() {
  
});