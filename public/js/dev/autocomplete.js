var autocomplete = {};
autocomplete.opts = {
    url: "/alproute/qsearch",
    search_div_id: "fb",
    search_btn_id: 'qsearch',
    width: 160,
    min_chars: 3,
    resultTemplate: '[#{id}] {name}',
    underTextBox: false,
    paging: {  
        style: 'input',             // or 'links'  
        cssClass: 'paging',         // prefix with containerClass (e.g. .ffb .paging)  
        pageSize: 10,               // acts as a threshold.  if <= pageSize results, paging doesn't appear  
        showSummary: true,          // whether to show 'displaying 1-10 of 200 results' text  
        summaryClass: 'summary',    // class for 'displaying 1-10 of 200 results', prefix with containerClass  
        summaryTemplate: 'Вывод {start}-{end} из {total} записей', // can use {page} and {pages} as well  
        maxPageLinks: 5             // used only if style is 'links'  
   }  
};
autocomplete.onselect = function(val){
    var id;
    if( val && typeof val != 'undefined' ) {
        id = document.getElementById('fb_input').value;
    }
    else {
        id = $('#'+autocomplete.opts.search_div_id+'_hidden').val();
    }
    document.location.href = autocomplete.opts.url+"?tid="+tid;
    return;
};

$(document).ready(function() {  
    $('#'+autocomplete.opts.search_btn_id).click(function(){
        var tid = $('#'+autocomplete.opts.search_div_id + '_input').val();
        autocomplete.onselect(tid);
    });
    $('#'+autocomplete.opts.search_div_id).flexbox(
        autocomplete.opts.url,
        {
            minChars: autocomplete.opts.min_chars,
            width: autocomplete.opts.width,
            paging: autocomplete.opts.paging,
            underTextBox: autocomplete.opts.underTextBox,
            onSelect: autocomplete.onselect,
            resultTemplate: autocomplete.opts.resultTemplate
        }
    );   
});  