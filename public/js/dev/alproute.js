var alprouteConfig = {
    gmapKey : 'ABQIAAAA0N8bZlbHdFSqx52tdkdfxRRu73JzjqOKVPR9mDkGgtmlsIlnwhSmd_FNMm1iSHwwXOGCxRUFb9h6Zg'    
};

var gmapInit = function() {
    var latlng = new google.maps.LatLng(43.12650001,42.66060001);
    var myOptions = {
        zoom: 12,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.SATELLITE
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
    var beachMarker = new google.maps.Marker({
        position: latlng,
        map: map,
        icon: ''
    });
}
  
var RouteInfo = function(param){
    if ( param ) {
        this.name = new ko.observable(param.name);
        this.id = new ko.observable(param.id);
        this.description = new ko.observable(param.description);
        this.region_map = new ko.observable(param.region_map);
        this.category = new ko.observable(param.category);
        this.type = new ko.observable(param.type);
        this.high = new ko.observable(param.high);
        this.images = new ko.observableArray(param.images);
    }
    return this;
};

var alprouteModel = {
    images: new ko.observableArray([]),
    names: new ko.observableArray([]),
    show: function(i){
        var current =  new RouteInfo(alprouteModel.names()[i]);
        alprouteModel.current = current;
        alprouteModel.images(current.images());
        $("a[rel^='prettyPhoto']").prettyPhoto();
        return false;
    },
    routes: new ko.observableArray([]),
    images: new ko.observableArray([]),
    current: new RouteInfo(null),
    lastSavedJson: new ko.observable("")
};

$(document).ready(function(){
    gmapInit();
    $.getJSON("/rest/alproute", function(data) { 
        alprouteModel.names(data); 
        ko.applyBindings(alprouteModel);
    });
});