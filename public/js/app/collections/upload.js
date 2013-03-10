;(function(){
    'use strict';
	window.ahs.collections.Upload = window.ahs.collections.Upload || {};
	var Model = Backbone.Model.extend({});
    var Collection = Backbone.Uploader.Collection.extend({model:Model});
	
	window.ahs.collections.Upload.initialize = function(data){
		//console.log(data);
		var c = new Collection(data.data);
		//c.reset();
        c.url = data.url;
		return c;
	};
})();

$(document).ready(function(){

});