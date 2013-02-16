/*

	var model = new BackboneCollectionExtendedClass();
  
	var FormView = Backbone.AjaxForm.View.extend({
		
	});
	
	var form_view = new FormView({
	  collection: model,
	  el: $('#blabla')
	});
	
*/
;(function() {
    Backbone.AjaxForm = {};
    Backbone.AjaxForm.View = Backbone.View.extend({
        events: {
            'click .save' : 'save'
        },
        initialize: function(opts) {
            //console.log(this.events);
			Backbone.AjaxForm.View.__super__.initialize.apply(this,[opts]);
            _.bindAll(this, 'save','cancel');
			var self = this;
//			$(this.el).find('.save').on('click',function(){
//                self.save(this);
//            });
//            $(this.el).find('a[data-role="cancel"]').on('click',function(){
//                self.cancel(this);
//            });
            
        },
        save: function(el){
            var data = $(this.el).formParser().fieldsToHash();
			var url = $(this.el).attr('action');
			var self = this;
            this.collection.url = url;
            this.collection.create(data,{
                url:url,
                type:'POST',
                success:function(collection,data){
                    self.collection.reset(data);
                }
            });
        },
        cancel: function(){
            $(this.el).reset();
        }
    });
}).call(this);
