/*

	var model = new BackboneCollectionExtendedClass();
  
	var ListView = Backbone.List.View.extend({
		template : $('#selector-for-template').html(),
		dialog: $('#form-selector'),
		el:$('#selector')
	});
	
	var list_view = new ListView({
	  collection: model,
	  showdialog: false
	});
	list_view.render();
  
*/
;(function() {
    Backbone.List = {};
    Backbone.List.View = Backbone.View.extend({
        form: null,
        dialog: null,
		showdialog: null,
		pubsub: null,
		saved : 0,
        /*default events for form*/
        events: {
            'click a.remove' : 'remove',
            'click a.add' : 'add',
            'click a.edit' : 'edit'
        },
        initialize: function(opts) {
            //console.log(this.events);
			Backbone.List.View.__super__.initialize.apply(this,[opts]);
            _.bindAll(this, 'save','remove','add','edit');
			var self = this;
			this.form = this.dialog.formParser();
			this.showdialog = 1;
            this.dialog.find('.save').on('click',function(el){
                self.save(el);
            });
			
			$(this.dialog).on('hide',function(){
				self.form.clear();
			});
			this.pubsub = new Backbone.Model();

            $.extend(this,opts);
			this.showdialog = opts.showdialog;
        },
        _get_string_after_hash: function(el){
            var id = $(el.target).attr('href').split('#')[1];
            return id;
        },
        remove: function( el ){
			var id = this._get_string_after_hash(el);
            
			var m = this.collection.get(id);
			
            var url = this.collection.url + '?id=' + id;
			var self = this;
            m.destroy({
				url: url,
				success:function(data){
					self.collection.remove(data);
					self.render();
				}
			});
        },
        add: function( el ){
            
        },
        edit: function( el ){
            var id = this._get_string_after_hash(el);
            var m = this.collection.get(id);
			var data = m.toJSON();
			data[id] = id;
            this.form.valuesToForm(data);
			//console.log(this.showdialog);
			if( this.showdialog == 1 ){
				this.dialog.modal('show');
			}
			this.saved = 0;
        },
        save: function(el){
            var data = this.form.fieldsToHash();
			var url = this.collection.url;
			var self = this;
			if(this.saved != 1 ) {
				this.collection.create(data,{
					url:url,
					type:'POST',
					success:function(collection,data){
						self.collection.reset(data);
						self.render();
						self.saved = 1;
						
						if( self.showdialog == 1 ){
							self.dialog.modal('toggle');
							self.saved = 0;
						}
						self.form.clear();
						self.pubsub.trigger('list:saved','OK');
					}
				});
			}
			
        },
        render: function(){
            var list = this.collection.toJSON();
            var markup = Mustache.render(this.template, { list : list });
            $(this.el).empty().slideDown(1600).html(markup);
        }
    });
}).call(this);
