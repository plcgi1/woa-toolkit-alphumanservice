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
window.modules = {
    prod: ['/js/min/place.js'],
    devel: [
        "/js/lib/jquery.jgrowl.js",
        "/js/lib/mustache.js",
        "/js/lib/jquery.formParser.js",
        "/js/lib/jquery.masonry.js",
        "/js/lib/bootstrap/bootstrap-dropdown.js",
        "/js/lib/bootstrap/bootstrap-button.js",
        "/js/lib/underscore.js",
        "/js/lib/backbone.js",
        
        "/js/app/app.js" ,
        
        "/js/lib/errorvis.js",
        "/js/lib/bootstrap/bootstrap-modal.js",
        "/js/lib/backbone/sync.js",
        "/js/lib/backbone/list.js",
        
        "/js/app/config.js",
        "/js/app/auth.js",
        "/js/app/collections/common.js",
        "/js/app/helpers/marker.js",      
        "/js/app/pages/participants/main.js"        
    ]   
};

/*
* 
* @desc Only add <script> into document
*
* @name require
*/

/*
include(tpl_name,target,vars)
*/
