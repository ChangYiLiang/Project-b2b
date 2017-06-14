PaymentHelper = function() {
	
	function getGoodsbuy(source) {
		if (source.state == 0) {
			return "等待安装";
		}
		else if(source.state == 1) {
			return "正常";
		}
		else if(source.state == 2) {
			return "过期";
		}
		else{
			return "机房取消";
		}
	}
	
	return {
		getGoodsbuy: getGoodsbuy
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		return '&nbsp;&nbsp;&nbsp;<a class="update bibobi btn btn-primary" href="edit.do?id={serviceId}">修改/查看</a>'.format(source);
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
                "sAjaxSource": "busitrusteeshiplist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "订单编号", "mDataProp" : "orderId","sDefaultContent" : ""},
                               {"sTitle" : "托管规格", "mDataProp" : "trustSize","sDefaultContent" : ""},
                               {"sTitle" : "功率", "mDataProp" : "power","sDefaultContent" : ""},
                               {"sTitle" : "带宽", "mDataProp" : "bandwidth","sDefaultContent" : ""},
                               {"sTitle" : "线路", "mDataProp" : "line","sDefaultContent" : ""},
                               {"sTitle" : "IP个数", "mDataProp" : "ipCount","sDefaultContent" : ""},
                               {"sTitle" : "业务状态", "mDataProp" : PaymentHelper.getGoodsbuy},
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