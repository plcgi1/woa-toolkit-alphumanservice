;(function(ErrorVis){
    window.ahs.ErrorVis = window.ahs.ErrorVis || {};
	window.ahs.ErrorVis.show_errors = function(error_fields,message){
		// clear all fields from error classes
		$('.input').removeClass('error');
		// fill errors for growl
		var err_arr = [];
		
		// set error classes for bad filled fields
		for( var key in error_fields ){
			err_arr.push('<p>'+error_fields[key].error+'</p>');
			$('.input').each(function(i){
				if ( $(this).attr('name') == key ) {
					$(this).addClass('error');
				}
			});
		}
		if ( message && typeof message != 'undefined' ) {
			err_arr.push(error_fields.Message);	
		}
		// show growl
		
		$.jGrowl(
			err_arr.join('<br/>'),{ theme : 'jGrowl-notification-error', life : 10000 }
		);
		$('.jGrowl-notification').addClass('jGrowl-notification-error');	};
	
})();    