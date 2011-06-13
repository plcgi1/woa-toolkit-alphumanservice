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
    $.getJSON("/rest/alproute", function(data) { 
        alprouteModel.names(data); 
        ko.applyBindings(alprouteModel);
    });
    
});