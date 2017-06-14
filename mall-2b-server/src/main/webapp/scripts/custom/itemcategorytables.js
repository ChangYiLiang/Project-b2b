PaymentHelper = function() {
	function getGoodstype(source) {
		if (source.ifIdc == false) {
			return "硬件服务器";
		}
		else {
			return "IDC服务类";
		}
	}

	return {
		getGoodstype: getGoodstype
	}
	
}();


var UnpaymentDt = function () {
	function operator(source) {
		return '<a href="updateitemcategory.do?id={id}" class="update btn btn-primary">修改/查看</a>'.format(source);
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
                "sAjaxSource": "itemcategorylist2.do",
                "bSort": false,
                "aoColumns" : [
                               {"sTitle" : "编号", "mDataProp" : "id","sDefaultContent" : ""},
                               {"sTitle" : "名称", "mDataProp" : "typeName","sDefaultContent" : ""},
                               {"sTitle" : "类型", "mDataProp" : PaymentHelper.getGoodstype},
                               {"sTitle" : "属性", "mDataProp" : "typeAttr","sDefaultContent" : ""},
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