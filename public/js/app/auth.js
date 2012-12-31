;
(function(Auth) {
    
    var url = '/ahs/auth';
    var token = '123';
    window.ahs.Auth = window.ahs.Auth || {};
    //var View = Backbone.View.extend({
    //    el : $('#loginFrm'),
    //    events: {
    //        'click a.login': 'login',
    //        'click a.logout': 'logout'
    //    },
    //    initialize: function(opts) {
    //        var self = this;
    //        _.bindAll(this);
    //    },
    //    login: function(el) {
    //        alert('login');
    //    },
    //    logout: function(el) {
    //        alert('logout');
    //    }
    //});
    //window.ahs.Auth.view = new View();
    $('.login').click(function(){
        var data = $('#loginFrm').formParser().fieldsToHash();
        data.token = token;
        $.ajax({
            url : url,
            data: data,
            dataType : 'json',
            type : 'POST',
            success:function(response){
                location.reload();
                // перерисоавть меню
                //$('.dropdown').dropdown('toggle');
            },
            error: function(response){
                alert('error');
                console.log(response);
            }
        });
    });
    $('.logout').click(function(){
        $.ajax({
            url : url,
            dataType : 'json',
            type : 'DELETE',
            success:function(response){
                location.reload();
            },
            error: function(response){
                alert('error');
            }
        });
    });
})();

$(document).ready(function() {

});