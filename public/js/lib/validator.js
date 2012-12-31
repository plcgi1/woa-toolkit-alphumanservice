
/* Example of array for validator settings
	fields = 
	[
		{
			name: 'child_frm_1_txt1',
			required: 1,
			rules: [
				{ rule: 'integer' },
				{ rule: 'maxlength', param: 3 }
			]
		},
		{
			name: 'child_frm_1_txt2',
			required: 0,
			rules: [
				{ rule: 'email' },
			]
		},
		{
			name: 'child_frm_2_txt1',
			required: 1,
			rules: [
				{ rule: 'datetime', param:  'YYYY-MM-DD hh:mm'  }
			]
		},
		{		
			name: 'child_frm_2_txt2',
			required: 1,
			rules: [
				{ rule: 'minlength', param: 2 },
				{ rule: 'maxlength', param: 5 }			
			]		
		}	
	]
*/

/*
 * jQuery validator
 * By: Alexx Nosoff [plcgi1 AT gmail DOT com]
 * Version 0.01
 * Last Modified: 
 * 
 * Copyright 2012 Alex Nosoff
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 // constructor for validator
 
function Validator() {}

Validator.prototype = {
	fields: [],
	errorFields: {},
	success: false,
	errorSet: 0,
	constructor: function(){},
	// validate field values
	validate: function ( fields, values ) {
		this.errorFields = {};
		var errorCount = 0;
		for ( f in fields ) {
			var fieldName	= fields[f].name;
			var required	= fields[f].required;
			var flag = 0;
			var rules = fields[f].rules;
			var fieldValue = values[fieldName];
			
			if( !fieldValue || typeof fieldValue === 'undefined' ){
				fieldValue = null;
			}
			
			// checking on required
			if ( required == 1 && ( fieldValue == "" || fieldValue == null || typeof fieldValue === 'undefined' ) ) {
				this.errorFields[fieldName] = fields[f];
				errorCount++;
			}
			else {
				if ( required != 1 && ( fieldValue == "" || fieldValue == null || typeof fieldValue === 'undefined' ) ) {
					continue;
				}
				var rules = fields[f].rules;
				//console.log('fieldName:' + fieldName);
				//console.log('fieldvalue:' + fieldValue);
				// go through validate rules for field
				for ( i in rules ) {
					// get method name for call it
					var func = rules[i].rule;
					// get method result about field format 
					var res = this.rules[rules[i].rule]( fieldValue, rules[i].param );
					if ( !res || res == false || res == "") { 
						flag++;
					} // END if ( !res || res == false || res == "")
				} // END - for ( i in rules )
				if ( flag > 0 ) {
					errorCount++;
					this.errorFields[fieldName] = fields[f];
				}
			}
		} // END for ( f in this.fields )
		
		if ( errorCount > 0 ) {
			this.success = false;
		}
		else {
			this.success = true;
		}
			
		return this.success;	
	},
	renderErrors : function(fn){
		if( fn ){
			fn(this.errorFields,this.message);
		}
	},
	
	/******************************************************************************/
	/**************************    rules      *************************************/
	/******************************************************************************/
	rules: {
		// check if field is integer
		integer: function() {
			var fieldValue = arguments[0];
			var re = new RegExp(/^\d+$/);
			return _finalize(re,fieldValue);
			
		}, // END integer: function() 
		// check 
		real: function() {
			var fieldValue = arguments[0];
			var re = new RegExp(/^[+-]?\d+\.?\d*$/);
			return _finalize(re,fieldValue);
		}, // END real: function()
		
		pattern: function () {
			var fieldValue = arguments[0];
			var pattern = arguments[1];
			
			var re = new RegExp( pattern );
			return _finalize(re,fieldValue);
		}, // END pattern: function ()
		
		epattern: function () {
			var fieldValue = arguments[0];
			var pattern = arguments[1];
			var re = new RegExp( pattern );
			return _finalize(re,fieldValue);
		}, // END epattern: function ()
		
		email: function() {
			var fieldValue = arguments[0];			
			var re = new RegExp(/^[a-zA-Z][a-zA-Z0-9_.-]*\@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/);
			return _finalize(re,fieldValue);
		}, // END email: function()
		
		maxlength: function(){
			var fieldValue = arguments[0];
			var maxLength = arguments[1];
			
			if ( fieldValue.length <= maxLength ) return true;
			return false;		
		}, // END maxlength: function()
		
		minlength: function () {
			var fieldValue = arguments[0];
			var minLength = arguments[1];
			if ( fieldValue.length >= minLength ) return true;
			return false;				
		}, // END minlength: function ()
		date: function() {
			var fieldValue = arguments[0];
			var dFormat = arguments[1];
			var Y, M, D, val_f;
			var months = [31,28,31,30,31,30,31,31,30,31,30,31];
			
			if( dFormat.indexOf('Y') > -1 ) {
	    		Y = ValFromFormat( fieldValue, dFormat, 'Y', [4,2] );
			    if( Y<0 ) { return false; }
			}
			if( dFormat.indexOf('M') > -1 ) {
	    		M = ValFromFormat( fieldValue, dFormat, 'M', [2] );
			    if( M<1 || M>12 ) { return false; }
			}
			if( dFormat.indexOf('D') > -1 ) {
	    		D = ValFromFormat( fieldValue, dFormat, 'D', [2] );
		    	if( (Y%4) == 0 ) { months[1] = 29; }
		    	if( D < 1 || D > months[M-1] ) { return false; }
			}
			val_f = PodsFormat( dFormat, ['Y',Y,'M',M,'D',D] );
			if( val_f == fieldValue ) { return true; }
			return false;		
		}, // END date: function()
		
		datetime: function() {
			var fieldValue = arguments[0];
			var dFormat = arguments[1];
			var Y,M,D,val_f,h,m,s;
			var months = [31,28,31,30,31,30,31,31,30,31,30,31];
			if( dFormat.indexOf( 'h' ) > -1 ) {
			    h = ValFromFormat( fieldValue, dFormat, 'h', [2,1] );
							    
			    if( h < 0 || h > 23 ) { return false; }
			}
			if( dFormat.indexOf( 'm' ) > -1 ) {
			    m = ValFromFormat( fieldValue, dFormat, 'm', [2,1] );
			    
			    if( m < 0 || m > 59 ) { return false; }
			}
			if( dFormat.indexOf('s') > -1 ) {
			    s = ValFromFormat( fieldValue, dFormat, 's', [2,1] );
			    
			    if( s < 0 || s > 59 ) { return false;	}
			}
			if( dFormat.indexOf('Y') > -1 ) {
	    		Y = ValFromFormat( fieldValue, dFormat, 'Y', [4,2] );
	    		
			    if( Y<0 ) { return false; }
			}
			if( dFormat.indexOf('M') > -1 ) {
	    		M = ValFromFormat( fieldValue, dFormat, 'M', [2] );
	    		
			    if( M<1 || M>12 ) { return false; }
			}
			if( dFormat.indexOf('D') > -1 ) {
	    		D = ValFromFormat( fieldValue, dFormat, 'D', [2] );
	    		
		    	if( (Y%4) == 0 ) { months[1] = 29; }
		    	if( D < 1 || D > months[M-1] ) { return false; }
			}	
			
			val_f = PodsFormat( dFormat, ['Y',Y,'M',M,'D',D,'h',h,'m',m,'s',s] );
			if( val_f == fieldValue ) { return true; }
			return false;	
		}, // END datetime: function()
		anyText: function(){
			return true;
		},
		time: function() {
			var fieldValue = arguments[0];
			var dFormat = arguments[1];
			
			var h,m,s,val_f;
			if( dFormat.indexOf( 'h' ) > -1 ) {
			    h = ValFromFormat( fieldValue, dFormat, 'h', [2,1] );
			    if( h < 0 || h > 23 ) { return false; }
			}
			if( dFormat.indexOf( 'm' ) > -1 ) {
			    m = ValFromFormat( fieldValue, dFormat, 'm', [2,1] );
			    if( m < 0 || m > 59 ) { return false; }
			}
			if( dFormat.indexOf('s') > -1 ) {
			    s = ValFromFormat( fieldValue, dFormat, 's', [2,1] );
			    if( s < 0 || s > 59 ) { return false;	}
			}
			val_f = PodsFormat( dFormat, ['h',h,'m',m,'s',s] );
			if( val_f == fieldValue ) { return true; }
			
			return false;
		} // time: function()
	}// END rules
} // END Validator.prototype

/*********************** Util functions **************************************/
//-----------------------------------------------------------------------------
//--- 
function ValFromFormat(fValue, fFormat, fSymb, fKols) {
	var st ,ret, rez;

	for(var i=0; i<fKols.length; i++) {
	    st='';
	    for(var j=1; j<=fKols[i]; j++) {
	        st = st + fSymb;
	    }
	    ret = fFormat.indexOf(st);

	    if(ret>-1) {
	        rez = fValue.substr(ret, fKols[i]);
			// check if not integer
			var re = /^\d+$/;
			if ( !re.test(rez) ) return -1;
	        
	        return rez;
	    }
	}
	return -1;
} // END-ValFromFormat
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//--- 
function PodsFormat(format, mzn) {
    var fp, lp, tp, b, e;
    for(var i=0; i<mzn.length; i+=2) {
        fp = format.indexOf(mzn[i]);
        if(fp < 0) {continue;}
        lp = fp;
        while(1) {
            tp = format.indexOf(mzn[i], lp+1);
            if(tp < 0) { break;}
            lp = tp;
            if(lp == (mzn[i].length-1)) {break;}
        }
        b = format.slice(0, fp);
        e = format.slice(lp+1);
        format=b + mzn[i+1] + e;
    }
    return format;
} // END-PodsFormat
//-----------------------------------------------------------------------------
/********************* END Util functions ************************************/
function _finalize(re,fieldValue){
	var res = false;
	if ($.isArray(fieldValue)) {
		for ( var i=0;i<fieldValue.length;i++ ) {
			res = re.test( fieldValue[i] );
			if ( !res ) {
				break;
			}
		}
	}
	else {
		res = re.test( fieldValue );
	}
	return res;
}