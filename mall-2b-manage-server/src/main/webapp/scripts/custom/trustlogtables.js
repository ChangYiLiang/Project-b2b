PaymentHelper = function() {
	
	return {
		types:{}
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		return '<a href="uptrustlog.do?id={id}" class="update btn btn-primary">去绑定or查看</a>'.format(source);
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
                "sAjaxSource": "trustlist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "编号", "mDataProp" : "id","sDefaultContent" : ""},
                               {"sTitle" : "用户ID", "mDataProp" : "userId","sDefaultContent" : ""},
                               {"sTitle" : "订单ID", "mDataProp" : "orderId","sDefaultContent" : ""},
                               {"sTitle" : "机器名称", "mDataProp" : "goodsName","sDefaultContent" : ""},
                               {"sTitle" : "托管机房", "mDataProp" : "trustName","sDefaultContent" : "未绑定"},
                               {"sTitle" : "托管区域", "mDataProp" : "name","sDefaultContent" : ""},
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