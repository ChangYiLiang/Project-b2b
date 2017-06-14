
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
				"goodsImg":$("#goodsImg").val(),
				"goodsType":$("#goodsType").val(),
				"goodsTest":$("#goodsTest").val()
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
				"goodsPrice":$("#goodsPrice").val(),
				"categoryId":$("#categoryId").val(),
				"isBuy":$("#isBuy").val(),
				"ifIdc":$("#ifIdc").val(),
				"goodsDesc":$("#goodsDesc").val(),
				"id":$("#id").val(),
				"goodsImg":$("#goodsImg").val(),
				"goodsTest":$("#goodsTest").val(),
				"goodsType":$("#goodsType").val()
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
