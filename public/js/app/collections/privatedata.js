;(function(PrivateData){
    'use strict';
	window.ahs.collections.PrivateData = window.ahs.collections.PrivateData || {};
	var Model = Backbone.Model.extend({});
    var Collection = Backbone.Collection.extend({
        model : Model,
        url : '/ahs/privatedata'
    });
	
	window.ahs.collections.PrivateData.initialize = function(){
		var c = new Collection();
		return c;
	};
})();

$(document).ready(function(){

});