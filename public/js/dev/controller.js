var alprouteConfig = {
    gmapKey : 'ABQIAAAA0N8bZlbHdFSqx52tdkdfxRRu73JzjqOKVPR9mDkGgtmlsIlnwhSmd_FNMm1iSHwwXOGCxRUFb9h6Zg'    
};

var gmapInit = function() {
    try {
        var latlng = new google.maps.LatLng(43.12650001,42.66060001);
        var myOptions = {
            zoom: 12,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.SATELLITE
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
        var beachMarker = new google.maps.Marker({
            position: latlng,
            map: map,
            icon: ''
        });
    }
    catch(e){
        alert(e);
    }
}

var alproute = {};
alproute.opts = {
    treeUrl: '/rest/alproute',
    gridUrl: '',
    leafUrl: '/rest/alproute/leaf',
    treeId : 'routeTree',
    listId: 'list',
    pagerId: 'pager'
};

alproute.dict = {
    "success"       : "Все отлично",
    "error"         : "Чето паламалося",
    "loadingGrid"   : "Спокойно - усЁ грузицца",
    "treeLoading"   : "Спокойно - дерево грузится и растет",
    "treeError"     : "Не быйте мяне па галаве - йа паламалось",
    "selectOne"     : "Выберите минимум одну строку"
};

alproute.gridParams = {
    gridId: alproute.opts.listId,
    pagerId: alproute.opts.pagerId,
    url: alproute.opts.gridUrl,
    datatype: "json",
    colNames: ["id","Гора","Маршрут","Высота","Категория","Трудность","Широта","Долгота"],
    colModel: [
        {width:50,name:"id"},
        {width:130,name:"mountain"},
        {width:250,name:"route"},
        {width:100,name:"high"},
        {width:90,name:"category"},
        {width:90,name:"difficulty"}
    ],
    rowNum: 50,
    rowList: [10,30,50,100],
    pager: $('#'+alproute.opts.pagerId),
    sortname: 'mountain',
    viewrecords: true,
    sortorder: 'asc',
    loadtext: alproute.dict.loadingGrid,
    caption: "Alproutes",
    recordtext: '',
    shrinkToFit: true,
    mtype: 'GET',
    height: 350,
    hiddengrid: true,
    toppager: true,
    remove: false,
    reload: true,
	add: false
};

var initTree = function(){
    // --- Initialize sample trees
    $("#"+alproute.opts.treeId).dynatree({
        title: "Дерево маршрутов",
        fx: {
            height: "toggle",
            duration: 200
        },
        autoFocus: false,
        // Set focus to first child, when expanding or lazy-loading.
        // In real life we would call a URL on the server like this:
        //          initAjax: {
        //              url: "/getTopLevelNodesAsJson",
        //              data: { mode: "funnyMode" }
        //              },
        // .. but here we use a local file instead:
        initAjax: {
            url: alproute.opts.treeUrl
        },
        onClick: function(node,event){
            var targetType = node.getEventTargetType(event);
            if ( targetType == 'title' ){
                $.getJSON(alproute.opts.leafUrl+"/"+node.data.id, function(data) { 
                    alprouteModel.names(data);
                    alprouteModel.show(0);
                });
            }
        },
        //onActivate: function(node) {
        //    if( !node.data.isFolder ){
        //        alert(node.data.title);
        //        $.getJSON("/rest/alproute", function(data) { 
        //            alprouteModel.names(data); 
        //            
        //        });
        //    }
        //},
         
         onLazyRead: function(node) {
            //node.tree.enableUpdate(true);
            if ( !node.bExpanded ) {
                node.expand(true);
            }
            var url = alproute.opts.treeUrl+"/"+node.data.id;
            node.appendAjax({
                url: url,
                data: {
                    "parent_id": node.data.id, // Optional url arguments
                    "is_parent" : 1,
                    "mode": "all"
                }
            });
        }
    });
   
};
  
var RouteInfo = function(param){
    if ( param ) {
        this.name = new ko.observable(param.name);
        this.id = new ko.observable(param.id);
        this.description = new ko.observable(param.description);
        this.region_map = new ko.observable(param.region_map);
        this.category = new ko.observable(param.category);
        this.difficulty = new ko.observable(param.difficulty);
        this.high = new ko.observable(param.high);
        this.images = new ko.observableArray(param.images);
    }
    else {
        this.name = new ko.observable("");
        this.id = new ko.observable("");
        this.description = new ko.observable("");
        this.region_map = new ko.observable("");
        this.category = new ko.observable("&nbsp;");
        this.difficulty = new ko.observable("&nbsp;");
        this.high = new ko.observable("&nbsp;");
        this.images = new ko.observableArray([]);
    }
    return this;
};

var alprouteModel = {
    images: new ko.observableArray([]),
    names: new ko.observableArray([]),
    show: function(i){
        var current =  new RouteInfo(alprouteModel.names()[i]);
        alprouteModel.current = current;
        alprouteModel.images(current.images());
        $("a[rel^='prettyPhoto']").prettyPhoto();
        return false;
    },
    routes: new ko.observableArray([]),
    images: new ko.observableArray([]),
    current: new RouteInfo(null),
    lastSavedJson: new ko.observable("")
};


RouteGrid = newClass(BaseGrid,{
    onSelectRow: function(rowdata,locationId){
        if ( locationId && typeof locationId != 'undefined') {
            
        }
        else {
            locationId = rowdata.location_id;
        }
        alert('selected' + rowdata.route);
        //var url = locationEditor.opts.locationUrl+'?location_id='+locationId;
        //$.ajax({
        //    type: 'GET',
        //    url: url,
        //    success: function(req){
        //        EditorController.locationInfo = new LocationInfoModel(req.location_info);
        //        if ( req.alias_list && req.alias_list.length > 0 && typeof req.alias_list != 'undefined' ) {
        //            EditorController.aliasList(req.alias_list);  
        //        }
        //        else {
        //            EditorController.aliasList([]);  
        //        }
        //        if ( req.ipnum_list && req.ipnum_list.length > 0 && typeof req.ipnum_list != 'undefined' ) {
        //            EditorController.ipnumList(req.ipnum_list);  
        //        }
        //        else {
        //            EditorController.ipnumList([]);  
        //        }
        //        $('#region_code').val(req.location_info.region_code);
        //        
        //        $('#'+locationEditor.opts.locationInfoId).show();
        //    },
        //    error: EditorController.error
        //});
    }
});

var rg = new RouteGrid( alproute );

$(document).ready(function(){
    //gmapInit();
    initTree();
    ko.applyBindings(alprouteModel);
});