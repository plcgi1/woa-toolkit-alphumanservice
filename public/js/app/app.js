var history_started = false;
var validator = {};

var ahs = {};
ahs.config = {
    history_started: false
};

/* namespaces for all */
ahs.helpers     = {};
ahs.collections = {};
ahs.views       = {};
ahs.pages       = {};

$(document).ready(function(){
    //setTimeout(function(){
        if( !ahs.config.history_started ){
            Backbone.history || (Backbone.history = new Backbone.History);
            Backbone.history.start();
            ahs.config.history_started = true;
        }
    //},1);

    $('.dropdown-toggle').dropdown();
	$('.dropdown input, .dropdown label, #loginFrm .btn').click(function(e) {
		e.stopPropagation();
	});
});