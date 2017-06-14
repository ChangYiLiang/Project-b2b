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
	
	function getCheckBox(source) {
		return '<input type="checkbox" value="{id}" />'.format(source);
	}
	
	
	return {
		getTime: getTime,
		getType: getType,
		getState: getState,
		getCheckBox:getCheckBox,
		busitype: {},
		busistate: {}
	}
	
}();
function checkAll(obj){
	$("input[type='checkbox']").prop('checked', $(obj).prop('checked'));
}


var DataTableBusi = function () {
	function operator(source) {
		if(source.state==states1.b||source.state==states1.c){
			return '<a href="toMyBusiDetail.do?id={id}" class="btn btn-primary">详情</a> <a href="toMyBusiRenew.do?id={id}" class="btn btn-primary"> 续费</a> <button class="btn btn-primary"   onclick="javascript:User.addCart({id});"> 加入购物车</button>'.format(source);
		}
		return '<a class="btn btn-primary" href="toMyBusiDetail.do?id={id}"><i class="fa fa-times"></i>详情</a>'.format(source);
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
            	"bPaginate": true,
                "bServerSide": true, // server side processing
                "sAjaxSource": "../busi/getBusiDataTables.do", // ajax source
                "bSort": false,
                "bFilter": false,
                "aoColumns" : [
                               {"sTitle" : "<input type='checkbox' onclick='checkAll(this)' />", "mDataProp": PaymentHelper.getCheckBox },
                               {"sTitle" : "序号", "mDataProp" : "id", "sDefaultContent" : ""},
                               {"sTitle" : "业务名称", "mDataProp" : "goodsName", "sDefaultContent" : ""},
                               {"sTitle" : "主IP", "mDataProp" : "mainIp", "sDefaultContent" : ""},
                               {"sTitle" : "续费价格", "mDataProp" : "renewAmount", "sDefaultContent" : ""},
                               {"sTitle" : "到期时间", "mDataProp" : PaymentHelper.getTime("endDate", "yyyy-MM-dd HH:mm")},
                               {"sTitle" : "业务状态", "mDataProp" : PaymentHelper.getState},
                               {"sTitle" : "操作", "mDataProp" : operator, "Width": "120px"},
                           ],
           }
        });
    }
	
	function getAjaxOptions(url, data, success, error) {
		return {
			url: url,
			data: data,
			type: "post",
			dataType: "json",
			success: function(data) {
				if(data==true) {
					alert(success);
				}else {
					alert(error);
				}
			}
		}
	}
    return {
        //main function to initiate the module
        init: function () {
    		handleOrder();
    		  
        },
        search_click: function() {
        	$("#mybusi_form").dataTable().fnDraw();
        },
        searchState_change: function() {
        	DataTableBusi.search_click();
    	},
    	addListCart: function() {
			if(!$("#mybusi_form :checked").length) {
				alert("请选择需要加入购物车的业务");
				return;
			}
			if(!confirm('是否加入购物车')) {
				return;
			}
			
			var data = {};
			var list = []
			$("#mybusi_form :checked").each(function(index){
				data["idlist[{index}]".format({index: index})] = $(this).val();
			})
			
			jQuery.ajax(getAjaxOptions("addListCart.do", data, "添加购物车成功", "添加购物车失败"));
		},
        tableName: "mybusi_form"
    };
}();

var DataTableBusi2 = function () {
	function operator(source) {
		if(source.state==states1.b||source.state==states1.c){
			return '<a href="toMyBusiDetail.do?id={id}" class="btn btn-primary">详情</a> <a href="toMyBusiRenew.do?id={id}" class="btn btn-primary"> 续费</a> <button class="btn btn-primary"   onclick="javascript:User.addCart({id});"> 加入购物车</button>'.format(source);
		}
		return '<a class="btn btn-primary" href="toMyBusiDetail.do?id={id}"><i class="fa fa-times"></i>详情</a>'.format(source);
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
			src: $("#merchantbusi_form"),
			dataTable: {  // here you can define a typical datatable settings from http://datatables.net/usage/options
				"iDisplayLength": 20,
				"bPaginate": true,
				"bServerSide": true, // server side processing
				"sAjaxSource": "../busi/getMerchantBusiDataTables.do", // ajax source
				"bSort": false,
				"bFilter": false,
				"aoColumns" : [
				               {"sTitle" : "<input type='checkbox' onclick='checkAll(this)' />", "mDataProp": PaymentHelper.getCheckBox },
				               {"sTitle" : "序号", "mDataProp" : "id", "sDefaultContent" : ""},
                               {"sTitle" : "企业代号", "mDataProp" : "merchantNo", "sDefaultContent" : ""},
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
	
	function getAjaxOptions(url, data, success, error) {
		return {
			url: url,
			data: data,
			type: "post",
			dataType: "json",
			success: function(data) {
				if(data==true) {
					alert(success);
				}else {
					alert(error);
				}
			}
		}
	}
	return {
		//main function to initiate the module
		init: function () {
			handleOrder();
			$("#serverkvm").click(function(){
    		 	if(confirm("确定要下载KVM控制吗？")){
    					var serviceId=$(this).attr("data");
    					$.ajax({  
    					       url : "toServerKVM.do",  
    					       data: {"serviceId":serviceId},
    					       type:'post',  
    					       success : function(data) {
    					       alert(0)
    					      		var data = eval("("+data+")")
    					       		var username=data.username
    					       		var password=data.password
    					       		var kvmIp=data.kvmip
    					       		alert(1)
    						        if("false"==data){
    							       alert("系统异常或没有空闲的外网IP")
    						        }else{
    						        	window.location.href ="${BasePath}/business-server/superkvm?username="+username+"&password="+password+"&kvmIp="+kvmIp;
    						        }
    					       }
    					  }); 
    				}
    		 });  
			
			
			$("#openpdu").click(function(){
				if(confirm("确定要开启吗？")){
					var serverId=$(this).attr("idvalue");
					$.ajax({  
						url : "openpdu.do",  
						data: {"serverId":serverId},
						type:'post',  
						success : function(data) {
							if("0"==data){
								alert("开启成功")
							}else{
								alert("系统异常")
							}
						}
					}); 
				}
				
			});
			
			$("#closepdu").click(function(){
				if(confirm("确定要关闭吗？")){
					var serverId=$(this).attr("idvalue")
					$.ajax({  
						url : "closepdu.do",  
						data: {"serverId":serverId},
						type:'post',  
						success : function(data) {
							if("0"==data){
								alert("关闭成功")
							}else{
								alert("系统异常")
							}
						}  
					}); 
				}
			});
			
			
			$("#restartpdu").click(function(){
				if(confirm("确定要重启吗？")){
					var serverId=$(this).attr("idvalue")
					$.ajax({  
						url : "restartpdu.do",  
						data: {"serverId":serverId},
						type:'post',  
						success : function(data) {
							if("0"==data){
								alert("重启成功")
							}else{
								alert("系统异常")
							}
						}  
					}); 
				}
			});
		},
		 search_click: function() {
	        	$("#merchantbusi_form").dataTable().fnDraw();
	        },
	     searchState_change: function() {
	        	DataTableBusi2.search_click();
	    	},
	     addListCart: function() {
				if(!$("#merchantbusi_form :checked").length) {
					alert("请选择需要加入购物车的业务");
					return;
				}
				if(!confirm('是否加入购物车')) {
					return;
				}
				
				var data = {};
				var list = []
				$("#merchantbusi_form :checked").each(function(index){
					data["idlist[{index}]".format({index: index})] = $(this).val();
				})
				jQuery.ajax(getAjaxOptions("addListCart.do", data, "添加购物车成功", "添加购物车失败"));
			},
		tableName: "merchantbusi_form"
	};
}();
var User = function(){
	return {
		addCart: function(id){
			var url="../cart/addrenew.do";
			var data={
				"id":id
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){								
					alert("添加购物车成功");
				} else {
					alert("添加购物车失败");
					return ;			
				}
			});
		}
	};
}();

var aoDataHandler = function(aoData) {
	var items = $("#searchForm").serializeArray();
	$(items).each(function(){
		if(this.value) {
			aoData.push(this);
		}
	})
}

	
