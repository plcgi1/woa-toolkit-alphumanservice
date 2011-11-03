/*
* 
* @desc simple js loader for production and development env
*
* @name loader
*/

/*
* 
* @desc All minified js files - you can set in modules[prod] array. For development - full version with ?debug=1 - in modules[devel]
*
*/
var modules = {
    prod: ['/js/min/controller.js'],
    devel: [
        "/js/dev/Dumper.js",
        
        "/js/dev/jquery.dynatree.js",
        "/js/dev/jquery.flexbox.js",
        "/js/dev/jquery.tmpl.js",
        
        "/js/dev/class.js",
        "/js/dev/jqgrid/i18n/grid.locale-ru.js",
        "/js/dev/jqgrid/base.js",
        "/js/dev/jqgrid/wrapper.js",
        
        "/js/dev/knockout.js",
        "/js/dev/controller.js",
        "/js/dev/autocomplete.js"
    ]
};
/*
* 
* @desc Only add <script> into document
*
* @name require
*/
window.require = function(path){
    for( var i=0;i<path.length;i++ ) {
        $('head').append('<script src="'+path[i]+'"></script>');
    }
};
$(document).ready(function(){
    var arr = location.search.split('?');
    
    if ( typeof arr[1] != 'undefined' ) {
        var kv = arr[1].split('&');
        var hash = {};
        for(var i=0;i<kv.length;i++ ){
            var arr = kv[i].split('=');
            hash[arr[0]] = unescape(arr[1]);
        }

        if ( hash['debug'] == 1 ){
            //alert('debug mode');
            console.log('Debug mode');
            // load js from dev
            require(modules.devel);
        }
        
    }
    else {
        // load js from min
        require(modules.prod);
    }
});