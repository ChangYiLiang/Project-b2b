PaymentHelper = function() {
	function getTime(prop, format) {
		format = format || "yyyy-MM-dd";
		format = format.replace(/[yMdHhms]+/g, function(item){
			return "{"+item+"}";
		});
		return function(source) {
			if(source[prop]) {
				var d = new Date(source[prop]);
				return format.format({
					"yyyy": d.getFullYear(),
					"MM": d.getMonth() + 1,
					"dd": d.getDate(),
					"HH": d.getHours(),
					"hh": d.getHours() % 12,
					"mm": d.getMinutes(),
					"ss": d.getSeconds(),
				})
			}
			return "";
		};
	}
	function getType(source) {
		return PaymentHelper.busitype[source.type] || "";
	}
	function getState(source) {
		return PaymentHelper.busistate[source.state] || "";
	}
	
	return {
		getTime: getTime,
		getType: getType,
		getState: getState,
		busitype: {},
		busistate: {}
	}
	
}();


var DataTableBusi = function () {
	function operator(source) {
		if(source.state==states1.b||source.state==states1.c){
			return '<a href="busi/toMyBusiDetail.do?id={id}" class="btn btn-primary">详情</a>&nbsp;&nbsp;&nbsp;<a href="busi/toMyBusiRenew.do?id={id}" class="btn btn-primary"> 续费</a> '.format(source);
		}
		return '<a class="btn btn-primary" href="busi/toMyBusiDetail.do?id={id}"><i class="fa fa-times"></i>详情</a>'.format(source);
	}
	var states1 = {
			a: 0,
			b: 1,
			c: 3,
			d: 4

	}
	
    var handleOrder = function() {
    	var grid = new Datatable();
        grid.init({
            src: $("#mybusi_form"),
            dataTable: {  // here you can define a typical datatable settings from http://datatables.net/usage/options
            	"iDisplayLength": 20,
                "bServerSide": true, // server side processing
                "sAjaxSource": "../controller/busi/getBusiDataTables.do", // ajax source
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "序号", "mDataProp" : "id", "sDefaultContent" : ""},
                               {"sTitle" : "业务名称", "mDataProp" : "goodsName", "sDefaultContent" : ""},
                               {"sTitle" : "主IP", "mDataProp" : "mainIp", "sDefaultContent" : ""},
                               {"sTitle" : "业务价格", "mDataProp" : "orderAmount", "sDefaultContent" : ""},
                               {"sTitle" : "到期时间", "mDataProp" : PaymentHelper.getTime("endDate", "yyyy-MM-dd HH:mm")},
                               {"sTitle" : "业务状态", "mDataProp" : PaymentHelper.getState},
                               {"sTitle" : "操作", "mDataProp" : operator, "Width": "120px"},
                           ],
           }
        });
    }
    return {
        //main function to initiate the module
        init: function () {
    		handleOrder();
        },
        tableName: "mybusi_form"
    };
}();


var aoDataHandler = function(aoData) {
	//页面的查询条件
	//aoData.push( { "name": "name", "value": "" } );
}

