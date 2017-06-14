PaymentHelper = function() {
	function getGoodstype(source) {
		if (source.ifIdc == false) {
			return "IDC服务类";
		}
		else {
			return "硬件服务器";
		}
	}
	function getGoodsbuy(source) {
		if (source.isBuy == 1) {
			return "售卖中";
		}
		else {
			return "已下架";
		}
	}

	return {
		getGoodstype: getGoodstype,
		getGoodsbuy: getGoodsbuy
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		if(source.isBindExpressfee == 0){
			return '<a href="updategoods.do?id={id}" class="update btn btn-sm btn-primary">修改/查看</a>&nbsp;&nbsp;<a href="goodstaglist.do?id={id}" class="update btn btn-sm btn-primary">查看参数</a>&nbsp;&nbsp;<a href="bindinfo.do?id={id}" class="update btn btn-sm btn-primary">查看绑定</a>&nbsp;&nbsp;<a href="addlist.do?id={id}" class="update btn btn-sm btn-primary">绑定配件</a>&nbsp;&nbsp;<a href="#" data="{id}" class="update copy btn btn-sm btn-primary">复制商品</a>&nbsp;&nbsp;<a href="goodstaglist.do?id={id}" class="update btn btn-sm btn-primary">查看参数</a>&nbsp;&nbsp;<a href="bindexpressfee.do?id={id}" class="btn btn-sm btn-info">绑定运费</a>'.format(source);
		}else{
			return '<a href="updategoods.do?id={id}" class="update btn btn-sm btn-primary">修改/查看</a>&nbsp;&nbsp;<a href="goodstaglist.do?id={id}" class="update btn btn-sm btn-primary">查看参数</a>&nbsp;&nbsp;<a href="bindinfo.do?id={id}" class="update btn btn-sm btn-primary">查看绑定</a>&nbsp;&nbsp;<a href="addlist.do?id={id}" class="update btn btn-sm btn-primary">绑定配件</a>&nbsp;&nbsp;<a href="#" data="{id}" class="update copy btn btn-sm btn-primary">复制商品</a>&nbsp;&nbsp;<a href="goodstaglist.do?id={id}" class="update btn btn-sm btn-primary">查看参数</a>&nbsp;&nbsp;<a href="expressfee.do?id={id}" class="btn btn-sm btn-success">查看运费</a>'.format(source);
		}
	}
	
	function operator2(source) {
		return '<img style="width:100px;height:50px" src="{goodsImg}">'.format(source);
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
                "sAjaxSource": "goodslist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "编号", "mDataProp" : "id","sDefaultContent" : ""},
                               {"sTitle" : "商品名称", "mDataProp" : "goodsName","sDefaultContent" : ""},
                               {"sTitle" : "图片", "mDataProp" : operator2, "sWidth": "120px"},
                               {"sTitle" : "商品价格", "mDataProp" : "goodsPrice","sDefaultContent" : ""},
                               {"sTitle" : "上下架", "mDataProp" : PaymentHelper.getGoodsbuy},
                               {"sTitle" : "点击次数", "mDataProp" : "clickCount","sDefaultContent" : ""},
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