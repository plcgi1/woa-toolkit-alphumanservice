;(function(Place){
    'use strict';
	window.ahs.collections.Place = window.ahs.collections.Place || {};
	var Model = Backbone.Model.extend({});
    var Collection = Backbone.Collection.extend({
        model : Model,
        url : '/ahs/geodata'
    });
	
	window.ahs.collections.Place.initialize = function(){
		var c = new Collection();
		return c;
	};
})();

$(document).ready(function(){

});