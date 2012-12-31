window.namespace = function(namespaceString) {
    var parts = namespaceString.split('.'),
        parent = window,
        currentPart = '';    

    for(var i = 0, length = parts.length; i < length; i++) {
        currentPart = parts[i];
        parent[currentPart] = parent[currentPart] || {};
        parent = parent[currentPart];
    }

    return parent;
}

window.require = function(path){
    for( var i=0;i<path.length;i++ ) {
        //var scr = document.createElement('script');
        //scr.type = 'text/javascript';
        //scr.src = path[i];
        $('head').append('<script src="'+path[i]+'"></script>');
    }
};

window.include = function(tpl_name,target,vars){
	$.get(tpl_name,function(data){
		target.hide();
		$.tmpl(data,vars).appendTo(target);
		//var out = _.template(data,vars);
		//target.html(out);
		target.fadeIn(1000);
	});	
};

$(document).ready(function(){
    var arr = location.href.split('?');

    if ( typeof arr[1] != 'undefined' || config.debug === 1 ) {
		var hash = {};
		if ( typeof arr[1] != 'undefined' ) {
			var kv = arr[1].split('&');
			
			for(var i=0;i<kv.length;i++ ){
				var arr = kv[i].split('=');
				hash[arr[0]] = unescape(arr[1]);
			}
		}
        if ( (hash['debug'] == 1 || typeof hash['debug'] != 'undefined') || config.debug === 1 ){
            require(modules.devel);
            window.onerror = function(msg, url, lno){
                if ( url ) {
                    $('#notifications').html('<p class="notification">line: ' + lno + ' url:' + url + '' + "<br/>" + msg + "</p>");
                }
            }
        }
        else {
            require(modules.prod);
        }
    }
    else {
        // load js from min
        require(modules.prod);
    }
    return;
});
