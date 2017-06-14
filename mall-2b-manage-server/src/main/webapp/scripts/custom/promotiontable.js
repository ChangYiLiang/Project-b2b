PaymentHelper = function() {
	
	return {
		types:{}
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		return '&nbsp;&nbsp;&nbsp;<a class="update bibobi btn btn-primary" data={id} href="#">删除</a>'.format(source);
	}
	
	var handleEvents = function() {
		$("#searchForm select").change(function(){
			$("#datatable_cl").dataTable().fnDraw();
		})
	}
	
	var _aoDataHandler = function(aoData) {
		var data = $("#searchForm").serializeArray();
		$(data).each(function(){
			if(this.value) {
				aoData.push(this);
			}
		})
	}
	
    var handleCl = function() {        
    	var grid = new Datatable();
        grid.init({
            src: $("#datatable_cl"),
            dataTable: { 
            	"iDisplayLength": 20,
                "bServerSide": true,
                "sAjaxSource": "promotionlist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "编号", "mDataProp" : "id","sDefaultContent" : ""},
                               {"sTitle" : "所属版块", "mDataProp" : "name","sDefaultContent" : ""},
                               {"sTitle" : "图片", "mDataProp" : "title","sDefaultContent" : ""},
                               {"sTitle" : "链接", "mDataProp" : "promotionUrl","sDefaultContent" : ""},
                               {"sTitle" : "操作", "mDataProp" : operator, "sWidth": "120px"},
                               ],
            }
        });
    }
    return {
        init: function () {
        	window.aoDataHandler = _aoDataHandler;
    		handleCl();
    		handleEvents();
        },
        search_click:function(){
        	$("#datatable_cl").dataTable().fnDraw();
        },
        tableName: "datatable_cl",
    };
}();


var aoDataHandler = function(aoData) {
	//页面的查询条件
	//aoData.push( { "name": "name", "value": "" } );
}