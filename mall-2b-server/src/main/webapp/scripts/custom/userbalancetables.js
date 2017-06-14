PaymentHelper = function() {
	
	return {
		types:{}
	}
	
}();


var UnpaymentDt = function () {
	
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
                "sAjaxSource": "userbalancelist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "时间", "mDataProp" : "chargeSj","sDefaultContent" : ""},
                               {"sTitle" : "充值/支出单号", "mDataProp" : "chargeOrder","sDefaultContent" : ""},
                               {"sTitle" : "充值", "mDataProp" : "money","sDefaultContent" : ""},
                               {"sTitle" : "充值方式", "mDataProp" : "chargeType","sDefaultContent" : ""},
                               {"sTitle" : "充值记录", "mDataProp" : "chargeLog","sDefaultContent" : ""},
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