BaseGrid = newClass(null,{
    param: {},
    gridParams: {},
    lang: {},
    forUpdate: false,
    currentRowId: 0,
    constructor:    function(opts){
        this.param = opts;
        this.dlgOpts = {
            modal:      true,
            autoOpen:   false,
            bgiframe:   true
        }
    },
    reloadGrid: function(opts) {
        var datastr = $('#'+this.param.opts.filterId).formParser().valuesToQs();
        var url = this.param.opts.url + '?' + datastr;
        jQuery("#"+this.param.opts.gridId).setGridParam({ url : url, page : 1}).trigger("reloadGrid");
        return false;    
    },
    getCurrentRowData: function(){
        return this.param.currentRowData;
    },
    setVal: function(colModelIndex,editOptionsName,value){
        this.param.gridParams.colModel[colModelIndex][editOptionsName].value = value;
    },
    showAddDlg: function(){
        document.forms[this.param.opts.formId].reset();
        this.forUpdate = false;
        $('#'+this.param.opts.dlgId).dialog('open');
        return false;
    },
    showEditDlg: function(){
        if(!this.forUpdate) {
            alert(this.param.opts.selectRowLabel);
        }
        else {
            this.forUpdate = true;
            $('#'+this.param.opts.dlgId).dialog('open');
        }
        return false;
    },
    save: function(){
        var type = 'POST';
        if(this.forUpdate ) {
            type = 'PUT';
        }
        var self = this;
        //alert(toQs(this.param.opts.formId));
        $().formSubmitter({
            url: this.param.opts.url,
            type: type,
            formId: this.param.opts.formId,
            success: function(req){
                self.reloadGrid();  
            }
        })
        .ajaxSubmit();
        return false;
    },
    remove: function(){
        if ( this.forUpdate ) {
            $('#'+this.param.opts.itemId).val(this.currentRowData['id']);
            var url= this.param.opts.url+'?id='+this.currentRowData['id'];
            var self = this;
            $().formSubmitter({
                url: url,
                type: 'DELETE',
                formId: this.param.opts.formId,
                success: function(req){
                    self.currentRowData = {};
                    self.forUpdate = false;
                    self.reloadGrid();
                }
            })
            .ajaxSubmit();
        }
    },
    initGrid: function(navGridParams){
        var param = this.param;
        var gridParams = this.param.gridParams;

        var hiddenGrid = false;
        if ( param.hiddenGrid == 1 ){
            hiddengrid = true;
        }
        var height = 500;
        if ( this.param.height > 0 ){
            height = param.height;
        }

        this.param = param;
        var self = this;
        param.opts.gridId = gridParams.gridId;
        function _onSelectRow(){
            var sr      = $('#'+param.opts.gridId).getGridParam("selrow");
            var rowdata = $('#'+param.opts.gridId).getRowData(sr);
            for(key in rowdata){
                var re = new RegExp( /^(\[)/ );
                if( re.test(rowdata[key]) ){
                    var mt =  eval( rowdata[key] );
                    rowdata[key] = mt;
                }
            }

            $('#'+param.opts.formId).formParser().valuesToForm(rowdata,['created','updated']);
            self.forUpdate = true;
            self.currentRowId = sr;
            self.currentRowData = rowdata;
            if ( typeof self.onSelectRow != 'undefined' ) {
                self.onSelectRow(rowdata);
            }
        }
        param.gridParams.onSelectRow = _onSelectRow;

        if( gridParams.edit ){
            gridParams.onEdit = function(){self.showEditDlg();};
        }
        if( gridParams.add ){
            gridParams.onAdd = function(){self.showAddDlg();};
        }
        if ( gridParams.remove ){
            gridParams.onRemove = function(){ self.remove(); };
        }
        this.param.opts.url = param.gridParams.url;
        $("#"+param.gridParams.gridId).jqGrid(param.gridParams);
    }    
});