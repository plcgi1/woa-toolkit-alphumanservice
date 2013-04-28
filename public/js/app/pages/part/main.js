;
(function(Main) {
    'use strict';
    window.ahs.pages.part = {};
    window.ahs.pages.part.Main = {};
    
    for ( var i=0;i<users.length;i++ ) {
        if ( saved_users[users[i].id] === 1 ) {
            users[i].selected = 'selected';
        }
    }
    var model = window.ahs.collections.Common.initialize({
        data: users,
        url: '/ahs/usersdata'
    });
    
    var ListView = Backbone.List.View.extend({
        template: $('#listTpl').html(),
        dialog: $('#formDlg'),
        el: $('#list'),
        events: {
            'click .thumbnail': 'select'
        },
        _get_target_element: function(el) {
            var el1;
            if (el.target.tagName === 'DIV') {
                el1 = $(el.target)
            } else {
                el1 = $(el.target).parent()
            }
            return el1;
        },
        select: function(el) {
            var el1         = this._get_target_element(el);
            var id          = el1.attr('data-user_id');
            var self        = this;
            var selected    = self.collection.get( id );
            
            if ( selected.attributes.selected === 'selected' ) {
                $.ajax({
                    url: this.collection.url + '?id='+id,
                    type: 'DELETE',
                    success: function(collection, data) {
                        delete selected.attributes.selected;
                        el1.removeClass('selected');
                        var model = self.collection.search('id',id);
                    }
                });
            } else {
                el1.addClass('selected');
                // save to model
                $.ajax({
                    url: this.collection.url,
                    data: { id: id },
                    type: 'POST',
                    success: function(collection, data) {
                        el1.addClass('selected');
                        selected.attributes.selected = 'selected';
                    }
                });
            }
        }
    });

    var list_view = new ListView({
        collection: model,
        showdialog: false
    });
    list_view.render();

})();

$(document).ready(function() {

});