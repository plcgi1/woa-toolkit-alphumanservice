Backbone.sync = function(method, model, options) {
    var methodMap = {
        'create': 'POST',
        'update': 'PUT',
        'delete': 'DELETE',
        'read'  : 'GET'
    };
    var type = methodMap[method];
    
    // Default JSON-request options.
    var params = {type : type, dataType : 'json'};
    
    var getUrl = function(object) {
        if (!(object && object.url)) return null;
        return _.isFunction(object.url) ? object.url() : object.url;
    };

    // Ensure that we have a URL.
    if (!params.url) params.url = getUrl(model);
    
    if(options.data){
        params.data = options.data;
        if( method === 'delete' ){
            var a = [];
            for(var key in params.data ){
                a.push(key+'='+params.data[key]);
            }
            
            params.url = params.url + '?' + a.join('&');
            //alert(params.url);
        }
    }
    
    // Ensure that we have the appropriate request data.
    if (!options.data && model && (method == 'create' || method == 'update')) {
        params.contentType = 'application/json';
        params.data = JSON.stringify(model.toJSON());
    }

    // For older servers, emulate JSON by encoding the request into an HTML-form.
    if (Backbone.emulateJSON) {
        params.contentType = 'application/x-www-form-urlencoded';
        params.data = params.data ? {
            model: params.data
        } : {};
    }

    // For older servers, emulate HTTP by mimicking the HTTP method with `_method`
    // And an `X-HTTP-Method-Override` header.
    if (Backbone.emulateHTTP) {
        if (type === 'PUT' || type === 'DELETE') {
            if (Backbone.emulateJSON) {
                params.data._method = type;
                params.type = 'POST';
                params.beforeSend = function(xhr) {
                    xhr.setRequestHeader('X-HTTP-Method-Override', type);
                }
            };
        }
    }

    // Don't process data on a non-GET request.
    if (params.type !== 'GET' && !Backbone.emulateJSON) {
        params.processData = false;
    }
    
    // make error handling for all
    options.error = function(res,err){
        try {
            var data = $.parseJSON(res.responseText);
            window.ahs.ErrorVis.show_errors(data.Fields,data.Message);
        }
        catch(e){
            alert(e);
        };
    };
    var opts = options;
    var success = opts.success;

    opts.success = function(collection,data){
        location.hash = '';
        
        if(success){
            //console.log(collection);
            //console.log(data);
            if ( collection === 'success' ) {
                collection = data;
            }
            success(collection,data);
            //console.log('sync.after success');
        }
        $.jGrowl('Данные сохранены');
        $('.input').removeClass('error');
    };
    // Make the request, allowing the user to override any Ajax options.
    return $.ajax(_.extend(params, opts));
};