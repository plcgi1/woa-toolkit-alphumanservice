;
(function(Auth) {
    
    var url = '/ahs/auth';
    var token = '123';
    window.ahs.Auth = window.ahs.Auth || {};
    
    $('.login').one('click',function(){
        var data = $('#loginFrm').formParser().fieldsToHash();
        data.token = token;
        $.ajax({
            url : url,
            data: data,
            dataType : 'json',
            type : 'POST',
            success:function(response){
                location.reload();
            },
            error: function(response){
                alert('error');
                console.log(response);
            }
        });
    });
    $('.logout').one('click',function(){
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