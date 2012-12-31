;(function(Goals){
    'use strict';
	window.ahs.collections.Goals = window.ahs.collections.Goals || {};
	var Model = Backbone.Model.extend({});
    var Collection = Backbone.Collection.extend({
        model : Model,
        url : '/ahs/goals'
    });
	
	window.ahs.collections.Goals.initialize = function(){
		var c = new Collection();
		return c;
	};
})();

$(document).ready(function(){

});