;(function(){
    'use strict';
	window.ahs.collections.Common = window.ahs.collections.Common || {};
	var Model = Backbone.Model.extend({});
    var Collection = Backbone.Collection.extend({
        model : Model
    });
	
	window.ahs.collections.Common.initialize = function(data){
		//console.log(data);
		var c = new Collection(data.data);
		//c.reset();
        c.url = data.url;
		return c;
	};
})();

$(document).ready(function(){

});