/*

	var model = window.ahs.collections.Upload.initialize({data:[],url:'/ahs/settings/media'});
  
	var View = Backbone.Uploader.View.extend({
	  fieldName: 'media',
	  progressBar: 'progressBar',
	  percentage: 'percentage',
	  collection: model,
	  el: $('#file-container'),
	  template: $('#listTpl2').html(),
	  onError: function(args){
		window.ErrorVis.show_errors(args);
	  }
	});
	var uploadeView = new View();
  
	uploadeView.render();
  
*/

;(function() {
	function get_file_name(file) {
		return file.name || file.fileName;
	}
	function get_file_size(file) {
		return file.size || file.fileSize;
	}
    Backbone.Uploader = {};
	Backbone.Uploader.Collection = Backbone.Collection.extend({
		maxFileSize: 0,
		acceptFileTypes: [],
		headers: {
			"Cache-Control":"no-cache",
			"X-Requested-With":"XMLHttpRequest",
			"X-File-Name": function(file){return get_file_name(file)},
			"X-File-Size": function(file){return get_file_size(file)},
			"X-CSRF-Token": $('meta[name="csrf-token"]').attr("content"),
			"Content-Type": function(file){
				return 'multipart/form-data';
			}
		},
		validate: function( view,options ){
			var config = view.mediaConfig;
			
			
		},
		initialize: function(opts) {
			Backbone.Uploader.Collection.__super__.initialize.apply(this,[opts]);
		
            $.extend(this,opts);
        },
		create: function(evt,view){
			var self = this;
			var fd = new FormData();
			var file = view.file;
			
			if( file.type != 'image/jpeg' ) {
				
			}
			$.ajaxTransport("+*", function(s, origOptions, xhr){
				return {
					send: function(headers, complete){
						var xhr = new XMLHttpRequest();
						
						upload = xhr.upload;
						fd.append("media", file);
						
						upload.addEventListener("progress", view.onProgress, false);
						
						upload.addEventListener("load", view.onStart, false);
						upload.addEventListener("error", view.onError, false);
        										
						xhr.open('POST', self.url);
						xhr.send(fd);
						xhr.addEventListener("readystatechange", view.onFinish, false);
					},
			
					abort: function(){
						if (xhr) xhr.abort();
					}
				};
			});
			$.ajax({
				type: 'POST',
				url: self.url,
				dataType: 'json'
			});
		}
	});
    Backbone.Uploader.View = Backbone.View.extend({
		pubsub  : null,
		status : 'started',
		fieldName: '',
		progressBar: '',
		progressText: '',
		mediaConfig: [],
		form: '',
		pBar: '',
		pText: '',
		file: null,
        /*default events for form*/
        events: {
            'click .remove' : 'remove',
            'click .upload' : 'upload'
        },
        initialize: function(opts) {
            //console.log(this.events);
			Backbone.Uploader.View.__super__.initialize.apply(this,[opts]);
            _.bindAll(this, 'remove','upload','onProgress','onFinish','onError');
			var self = this;

			this.pubsub = new Backbone.Model();
			
            $.extend(this,opts);
        },
		upload: function( evt ){
			this.file = $(this.el).find('input:file').get(0).files[0];
			this.status = 'started';
            this.collection.create(evt,this);
        },
        remove: function(el){
			alert('remove');
        },
		onStart: function(event, total) {
			this.status === 'started';
			$(this.pBar).attr("width","0%");
			$(this.pText).text('');
			return true;
		},
		onProgress: function(ev) {
			//console.log(this.pBar);
			if (ev.lengthComputable) {
				var pct = Math.round((ev.loaded / ev.total) * 100);
				this.pBar.css({"width":pct + "%"});
				this.pText.text(pct);
			}
		},
		onFinish: function(event, total) {
			if(event.currentTarget.status != 200 ) {
				if( this.status === 'started' && event.currentTarget.responseText.length > 0) {
					this.onError(event.currentTarget.responseText);
					this.status = 'error';
					$(this.el).find('input:file').val('');
					this.pBar.css({"width":"0%"});
					this.pText.text(0);
				}
			}
			else {
				if( this.status === 'started' ) {
					this.status = 'uploaded';
					var reader = new FileReader();
					var preview = $(this.el).find('#fileListWrap');
					var image = $('img', preview);
					var reader = new FileReader();
					image.width = 100;
					image.height = 100;
					reader.onload = function(e){
						// e.target.result holds the DataURL which
						// can be used as a source of the image:
						image.attr('src',e.target.result);
					};
					// Reading the file as a DataURL. When finished,
					// this will trigger the onload function above:
					reader.readAsDataURL(this.file);
					//message.hide();
					//preview.appendTo(dropbox);
					// Associating a preview container
					// with the file, using jQuery's $.data():
					$.data(this.file,preview);
	
				}
			}
		},
		onError: function(event) {
			alert('error from upload');
			//console.log(event);
		},
		onBrowserIncompatible: function() {
			alert("Sorry, but your browser is incompatible with uploading files using HTML5 (at least, with current preferences.\n Please install the latest version of Firefox, Safari or Chrome");
		},
        render: function(){
			var self = this;
            var list = this.collection.toJSON();
            var markup = Mustache.render(this.template, { fieldName: this.fieldName,list : list });
            $(this.el).empty().slideDown(1600).html(markup);

			this.form = $(this.el).find('form');
						
			this.form.live('change',function(){
				self.file = $(self.el).find('input:file').get(0).files[0];
				var config = self.mediaConfig[0].user_image;
				var errors = 0;
				//console.log(config);
				// check size
				if( config.maxsize < self.file.size ) {
					self.onError({media:{error:"Недопустимый размер файла"}});
					errors++;
				}
				// check accept type
				var accept = 0;
				for(var i=0;i< config.accept.length;i++ ) {
					if( config.accept[i] === self.file.type ) {
						accept = 1;
					}
				}
				if ( accept === 0 ) {
					self.onError({media:{error:"Неправильный формат файла"}});
					errors++;
				}
				if(errors > 0 ) {
					$(self.el).find('input:file').val('');
				}
			})
			this.pBar = $(this.el).find("#"+this.progressBar);
			this.pText = $(this.el).find("#"+this.percentage);			
        }
    });
	
}).call(this);
