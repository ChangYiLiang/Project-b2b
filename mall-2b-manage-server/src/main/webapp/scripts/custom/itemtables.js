PaymentHelper = function() {
	function getItemType(source) {
		if (source.itemType == 1) {
			return "机架类型";
		}
		else if(source.itemType == 2){
			return "处理器";
		}
		else if(source.itemType == 3){
			return "内存";
		}
		else if(source.itemType == 4){
			return "硬盘";
		}
		else if(source.itemType == 5){
			return "芯片组";
		}
		else if(source.itemType == 6){
			return "网卡";
		}
		else if(source.itemType == 7){
			return "RAID配置";
		}
		else if(source.itemType == 8){
			return "PCIe插槽";
		}
		else if(source.itemType == 9){
			return "电源";
		}
		else if(source.itemType == 10){
			return "租用型号";
		}
		else if(source.itemType == 11){
			return "cpu核数";
		}
		else if(source.itemType == 12){
			return "内存容量";
		}
		else if(source.itemType == 13){
			return "硬盘容量";
		}
		else if(source.itemType == 14){
			return "公网IP";
		}
		else if(source.itemType == 15){
			return "网络带宽";
		}
		else if(source.itemType == 16){
			return "操作系统";
		}
		else if(source.itemType == 17){
			return "托管规格";
		}
		else if(source.itemType == 18){
			return "机柜功率";
		}
		else if(source.itemType == 19){
			return "防御峰值";
		}
		else if(source.itemType == 20){
			return "默认配置";
		}
		else if(source.itemType == 21){
			return "主板";
		}
		else if(source.itemType == 22){
			return "私有内网";
		}
		else if(source.itemType == 23){
			return "电压";
		}
		else if(source.itemType == 24){
			return "电流";
		}
		else if(source.itemType == 25){
			return "磁盘控制器(RAID)";
		}
		else{
			return "未定义";
		}
	}
	
	return {
		getItemType: getItemType,
		types:{}
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		return '<a href="updateitems.do?id={id}" class="update btn btn-primary">修改/查看</a>'.format(source);
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
                "sAjaxSource": "itemlist.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "编号", "mDataProp" : "id","sDefaultContent" : ""},
                               {"sTitle" : "配件名称", "mDataProp" : "title","sDefaultContent" : ""},
                               {"sTitle" : "配件价格", "mDataProp" : "price","sDefaultContent" : ""},                 
                               {"sTitle" : "操作", "mDataProp" : operator, "sWidth": "120px"},
                               ],
            }
        });
    }
    return {
        init: function () {
        	window.aoDataHandler = _aoDataHandler;
    		handleCl();
    		//$("#type").createOptions(PaymentHelper.types, "--配件类型--");
    		//$("#status").createOptions(PaymentHelper.status, "--账单状态--");
    		//$("#payment").createOptions(PaymentHelper.payments, "--支付方式--");
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