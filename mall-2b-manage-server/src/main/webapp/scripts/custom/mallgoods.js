
var Goods = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.add();
	    	   //Action.addgoodsdetail();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl"
    };
}();


var Goods2 = function () {
    var handleValidation = function() {
	    var form = $('#form_cl22');
	    form.validate({
	       submitHandler: function (form) {
	    	   //Action.add();
	    	   Action.addgoodsdetail();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl22"
    };
}();


var Goods3 = function () {
    var handleValidation = function() {
	    var form = $('#form_cl33');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.addgoodstag();
	        }    
	    });
    }
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl33"
    };
}();

var Goods4 = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.addgallery();
	    	   //Action.addgoodsdetail();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl"
    };
}();

var UpdateGoodstag = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.updategoodstag();
	        }    
	    });
    }

    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cll"
    };
}();


var UpdateGoods = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.update();
	        }    
	    });
    }

    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cll"
    };
}();


var UpdateGoodsDetail = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   Action.update();
	    	   //Action.updategoodsdetail();
	        }    
	    });
    }

    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cll"
    };
}();


var Action = function(){
	return {
		add: function(){
			var url="addgoods.do";
			var data={
				"goodsName":$("#goodsName").val(),
				"secondTitle":$("#secondTitle").val(),
				"goodsPrice":$("#goodsPrice").val(),
				"categoryId":$("#categoryId").val(),
				"addDate":$("#addDate").val(),
				"isBuy":$("#isBuy").val(),
				"ifIdc":$("#ifIdc").val(),
				"goodsDesc":$("#goodsDesc").val(),
				"goodsImg":$("#test").val(),
				"goodsType":$("#goodsType").val(),
				"goodsTest":$("#test").val(),
				"sort":$("#sort").val(),
				"iftrust":$("#iftrust").val(),
				"ifonly":$("#ifonly").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("商品添加成功");
					window.location.href="goods.do";
				} else {
					alert("商品添加失败");
					window.location.href="goods.do";
				}
			});
		},
		update:function(){
			var url="toupdategoods.do";
			var data={
				"goodsName":$("#goodsName").val(),
				"secondTitle":$("#secondTitle").val(),
				"goodsPrice":$("#goodsPrice").val(),
				"categoryId":$("#categoryId").val(),
				"isBuy":$("#isBuy").val(),
				"ifIdc":$("#ifIdc").val(),
				"goodsDesc":$("#goodsDesc").val(),
				"id":$("#id").val(),
				"goodsImg":$("#test").val(),
				"goodsTest":$("#test2").val(),
				"goodsType":$("#goodsType").val(),
				"sort":$("#sort").val(),
				"iftrust":$("#iftrust").val(),
				"ifonly":$("#ifonly").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("修改成功");
					window.location.href="goods.do";
				} else {
					alert("修改商品失败");
					return ;			
				}
			});
		},
		updategoodsdetail:function(){
			var url="toupdategoodsdetail.do";
			var data={
				"monthPay":$("#monthPay").val(),
				"quartPay":$("#quartPay").val(),
				"hyPay":$("#hyPay").val(),
				"yearPay":$("#yearPay").val(),
				"tyPay":$("#tyPay").val(),
				"mrenewPay":$("#mrenewPay").val(),
				"qrenewPay":$("#qrenewPay").val(),
				"hrenewPay":$("#hrenewPay").val(),
				"yrenewPay":$("#yrenewPay").val(),
				"trenewPay":$("#trenewPay").val(),
				"goodsId":$("#goodsId").val(),
				"itemId":$("#itemId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("修改商品成功");
					window.location.href="goods.do";
				} else {
					alert("修改失败");
					return ;			
				}
			});
		},
		addgoodsdetail:function(){
			var url="addgoodsdetail.do";
			var data={
				"monthPay":$("#monthPay").val(),
				"quartPay":$("#quartPay").val(),
				"hyPay":$("#hyPay").val(),
				"yearPay":$("#yearPay").val(),
				"tyPay":$("#tyPay").val(),
				"mrenewPay":$("#mrenewPay").val(),
				"qrenewPay":$("#qrenewPay").val(),
				"hrenewPay":$("#hrenewPay").val(),
				"yrenewPay":$("#yrenewPay").val(),
				"trenewPay":$("#trenewPay").val(),
				"itemId":$("#itemId").val(),
				"goodsId":$("#goodsId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("添加商品价格成功");
					window.location.href="goods.do";
				} else {
					alert("添加失败");
					return ;			
				}
			});
		},
		addgoodstag:function(){
			var url="addgoodstag.do";
			var data={
				"isShow":$("#isShow").val(),
				"goodsTag":$("#goodsTag").val(),
				"goodsAttr":$("#goodsAttr").val(),
				"sort":$("#sort").val(),
				"goodsId":$("#goodsId2").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("绑定配置参数成功");
					window.location.href="goods.do";
				} else {
					alert("绑定配置参数失败");
					return ;			
				}
			});
		},
		updategoodstag:function(){
			var url ="updategoodstag2.do";
			var idd = $("#goodsId").val();
			var data={
				"isShow":$("#isShow").val(),
				"goodsTag":$("#goodsTag").val(),
				"goodsAttr":$("#goodsAttr").val(),
				"sort":$("#sort").val(),
				"id":$("#id").val(),
				"goodsId":$("#goodsId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("修改配置参数成功");
					window.location.href="goodstaglist.do?id="+idd;
				} else {
					alert("修改配置参数失败");
					return ;			
				}
			});
		},
		addgallery:function(){
			var url ="addgallery.do";
			var data={
				"goodsId":$("#goodsId").val(),
				"sort":$("#sort").val(),
				"imgurl":$("#test").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("添加成功");
					window.location.href="list.do";
				} else {
					alert("添加失败");
					return ;			
				}
			});
		}
	};
}();


/*表单验证*/

$(function(){
	$("#goodsId").click(function(){
		var url="checkgoods.do";
		var data={
				"goodsId":$(this).val(),
				"itemId":"0"
			};
		$.ajax({url:url,data,success:function(data){
					if(data == "success"){
						$("#tip").text("已经添加").css({"color":"red"});
						$("#additem22").attr({"disabled":true});
					} else {
						$("#tip").text("可以添加").css({"color":"green"});
						$("#additem22").attr({"disabled":false});		
					}
		        }
			});
	});
});
