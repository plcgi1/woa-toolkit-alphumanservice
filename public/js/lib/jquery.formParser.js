/**
 * jQuery lightweight form parser plugin
 * @requires jQuery v1.3.1
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 * Revision: 
 * Version:
 *
 * @type jQuery
 * @cat Plugins/Form
 * 
 */

/************** short form  **************
/**
* 
* @example var formHash = fieldsToHash('#selector')
* @desc Serialize input,select,textarea,radio fields data to hash
*
* @name fieldsToHash
*/
var fieldsToHash = function(selectorId){
    fields = $('#'+selectorId).formParser().fieldsToHash();
    return fields;
};
/**
* 
* @example cloneForm('#selectorForSource','#selectorForDestination')
* @desc Clone form values from #selectorForSource to #selectorForDestination containers
*
* @name cloneForm
*/
var cloneForm = function(srcId,destId,excIdArr){
    var fields = $('#'+srcId).formParser().fieldsToHash();
    $('#'+destId).formParser().valuesToForm(fields,excIdArr);
};
/**
* 
* @example var queryString = toQs('#selector')
* @desc Serialize form values to query string
*
* @name toQs
*/
var toQs = function(selectorId){
    var qs = $('#'+selectorId).formParser().valuesToQs();
    return qs;
};
/**
* 
* @example var queryString = valuesToQs({name:value,blabla})
* @desc Serialize hash data values to query string
*
* @name toQs
*/
var valuesToQs = function(data){
    var qs = $().formParser().valuesToQs(data);
    return qs;
};

;(function($){
    $.fn.formParser = function(opts){
        $.fn.formParser.defaults = {};
        var allOpts = $.extend({}, $.fn.formParser.defaults, opts);
        var me = this;
        var myId = $(me).attr('id');
        var form = $('#'+myId);
        
        var prsChkGrp = function(name,val,id){
            var arr = [];
            $('#'+id+' input[name='+name+']').each(function(){
                if ( $(this).attr('checked') ){
                    var v = $(this).val();
                    arr.push(v);
                }
            });
            return arr;
        };
        var prsMultuSelect = function(name,val,id){
            var arr = [];
            $('#'+id+' option').each(function(){
                if ( $(this).attr('selected') ){
                    var v = $(this).val();
                    arr.push(v);
                }
            });
            return arr;
        };
        var inExclude = function(arr,name){
            var inEx = false;
            if ( arr && typeof arr != 'undefined' ) {
                
                for(var i=0; i<arr.length; i++ ){
                    if ( arr[i] == name ){
                        inEx = true;
                        break;
                    }
                }
            }
            return inEx;
        };
        var toHash = function(){
            var hash = {};
            $('#'+myId+' input, #'+ myId+ ' select, #'+myId+' textarea').each(function(ind){
                var n = $(this).attr('name'),
                    t = $(this).attr('type'),
                    fldId = $(this).attr('id'),
                    fldVal = $(this).val(),
                    tag = this.tagName.toLowerCase();
                if ( $(this).attr('checked') ) {
                    hash[n] = prsChkGrp(n,fldVal,myId);
                    return;
                }
                else if( fldVal && typeof(fldVal) != 'undefined' && tag === 'textarea' ){
                    //hash[n] = $(this).html();
                    hash[n] = $(this).val();
                    //console.log($(this).html());     
                }
                else if ( fldVal && typeof(fldVal) != 'undefined' && tag == 'select' ) {
                    if ( $(this).attr('multiple') ) {
                        hash[n] = prsMultuSelect(n,fldVal,myId);
                    }
                    else {
                        hash[n] = $(this).find(':selected').val();
                    }
                }
                else if ( fldVal && typeof(fldVal) != 'undefined' && t !='checkbox' && t != 'radio' ) {
                    hash[n] = fldVal;
                }
            });
            return hash;
        };
        /*
        * 
        * @example var formHash = $('#selector').formParser().fieldsToHash()
        * @desc Serialize input,select,textarea,radio fields data to hash for ajax call
        *
        * @name fieldsToHash
        */
        $.fn.fieldsToHash = function () {
            var hash = toHash();
            return hash;
        };
        
        /*
        * 
        * @example $('#selector').formParser().valuesToForm(dataHash,excludeNames)
        * @desc Set fields data from hash to fields
        *
        * @name valuesToForm
        */
        $.fn.valuesToForm = function (dataHash,exludeArr) {
            $('#'+myId+' input[type="checkbox"]').each(function(ind){
                $(this).attr({'checked':false});
            });
            $('#'+myId+' input, #'+ myId+ ' select, #'+myId+' textarea').each(function(ind){
                var n = $(this).attr('name');
                var t = $(this).attr('type');
                var tag = this.tagName.toLowerCase();
                
                if ( inExclude(exludeArr,n) ){
                    return;
                }

                if ( tag == 'select' && typeof(dataHash[n]) == 'undefined' ){
                    $(this).val('');
                }
                else if ( tag == 'textarea' ){
                    
                    $(this).val(dataHash[n]);                    
                    $(this).html(dataHash[n]);                    
                }
                else if ( t == 'button' ){}
                else if ( t == 'checkbox' || t == 'radio' ) {
                    var thisId = $(this).attr('id');
                    var thisName = $(this).attr('name');
                    //console.log(dataHash[thisName]);
                    if( dataHash[thisName] && typeof dataHash[thisName] != 'undefined' ){
                        if ( dataHash[thisName].length > 0 ) {
                            for(var i=0;i<dataHash[thisName].length;i++){
                                if ( dataHash[thisName][i] === $('#'+thisId).val() ) {
                                    $('#'+thisId).attr('checked',true);
                                }
                            }
                        }
                    }
                }
                else if ( typeof(dataHash[n]) == 'undefined' ) {
                    $(this).val('');
                }
                else {
                    //console.log($(this).attr('id'));
                    $(this).val(dataHash[n]);
                }
            });
            return;
        };
        /*
        * 
        * @example $('#selector').formParser().valuesToQs(dataHash)
        * @desc Set fields data from hash to query string with escaping values
        *
        * @name valuesToQs
        */
        $.fn.valuesToQs = function (hash) {
            if ( !hash || typeof(hash) == 'undefined' ){
                hash = toHash();
            }
            var arr = [];
            for( var key in hash ){
                arr.push(key+'='+escape(hash[key]));
            }
            var str = arr.join('&');
            return str;
        };
        /*
        * 
        * @example $('#selector').formParser().fromQs(queryString)
        * @desc Convert query string to javascript object
        *
        * @name fromQs
        */
        $.fn.fromQs = function (qs) {
            var hash = {};
            var arr = [];
            arr = qs.split('&');
            for( var i=0;i<arr.length;i++ ){
                var myArr = arr[i].split('=');
                hash[myArr[0]] = myArr[1];
            }
            return hash;
        };
        
        var fields = toHash();
        /* 
        * @example $('#selector').formParser().reset()
        * @desc reset all fields in form
        *
        * @name clear
        */
        $.fn.clear = function (qs) {
            var data = toHash();
            for(key in data) {
                data[key] = '';
            }
            
            me.valuesToForm(data);
        };
        
        return this;
    };
})(jQuery);