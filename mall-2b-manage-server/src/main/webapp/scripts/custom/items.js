
var GoodsItems = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Items.add();
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

var GoodsItemsBind = function () {
    var handleValidation = function() {
	    var form = $('#form_cl22');
	    form.validate({
	       submitHandler: function (form) {
	    	   Items.binditem();
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

var GoodsItemsBindPrice = function () {
    var handleValidation = function() {
	    var form = $('#form_cl33');
	    form.validate({
	       submitHandler: function (form) {
	    	   Items.addgoodsdetail();
	    	   Items.binditem2();
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


var UpdateItems = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   Items.update();
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


var UpdateItemsDetail = function () {
    var handleValidation = function() {
	    var form = $('#form_cll44');
	    form.validate({
	       submitHandler: function (form) {
	    	   Items.updateitemsdetail();
	        }    
	    });
    }

    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cll44"
    };
}();


/*items对象方法post方法*/

var Items = function(){
	return {
		add: function(){
			var url="additems.do";
			/*注:左边数据要对应xxMapper.xml 文件property字段*/
			var data={
				"title":$("#fuck").val(),
				"brandId":$("#brandId").val(),
				"categoryId":$("#categoryId").val(),
				"price":$("#price").val(),
				"itemType":$("#itemType99").val(),
				"args0":$("#args0").val(),
				"args1":$("#args1").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("配件录入成功");
					window.location.href="items.do";
				} else {
					alert("配件录入失败");	
				}
			});
		},
		/**
		 * 修改配件
		 */
		update: function(){
			var url="toupdateitems.do";
			var data={
				"title":$("#title").val(),
				"brandId":$("#brandId").val(),
				"categoryId":$("#categoryId").val(),
				"price":$("#price").val(),
				"args0":$("#args0").val(),
				"args1":$("#args1").val(),
				"itemType":$("#itemType").val(),
				"id":$("#id").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("修改成功");
					window.location.href="items.do";
				} else {
					alert("修改失败");
					return ;			
				}
			});
		},
		updateitemsdetail:function(){
			var url="updateitemsprice2.do";
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
					alert("修改配件价格成功");
					window.location.href="goods.do";
				} else {
					alert("修改配件价格失败");
					return ;			
				}
			});
		},
		/*绑定配件1*/
		binditem: function(){
			var url="binditems.do";
			var data={
				"goodsId":$("#goodsId").val(),
				"itemId":$("#title").val(),
				"sort":$("#sort").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("绑定成功");
					window.location.href="items.do";
				} else {
					alert("绑定失败");
					return ;			
				}
			});
		},
		/*绑定配件2*/
		binditem2: function(){
			var url="binditems2.do";
			var data={
				"goodsId":$("#goodsId2").val(),
				"itemId":$("#title2").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("绑定成功");
					window.location.href="items.do";
				} else {
					alert("绑定失败");
					return ;			
				}
			});
		},
		/*添加价格*/
		addgoodsdetail:function(){
			var url="addgoodsdetail2.do";
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
				"itemId":$("#title2").val(),
				"goodsId":$("#goodsId2").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					//alert("添加商品价格成功");
					//window.location.href="goods.do";
				} else {
					alert("添加失败");
					return ;			
				}
			});
		}
	};
}();


$(function(){
	$("#goodsId3").click(function(){
		var url="demo.do";
		var data=$(this).val();
		$.ajax({url:url,data:{"goodsId":data},success:function(data){
					if(data){
						if(data=="[]"){
							$("#cc").remove();
							$("#title3").remove();
							var a="<span id='cc' style='color:red'>该商品还没有绑定配件！！</span>";
							$("#chage").after(a);
							$("#WFZ").attr({"disabled":true});
						}
						else{
							var obj = eval(data);
							var a   = "<select class='form-control selectpicker' name='title3' id='title3'>";
							var b   = "</select>";
							var s   ="";
							for(var i=0;i<obj.length;i++){
								var v=obj[i]['id'];
								var k=obj[i]['title'];
								s +="<option value="+v+">"+k+"</option>";
							}
							var end=a+s+b;
							$("#cc").remove();
							$("#title3").remove();
							$("#chage").after(end);
							$("#WFZ").attr({"disabled":false});
							
						}
						return ;
					} else {
						alert("没有数据！！");
						return ;			
					}
		        }
			});
	});
});


$(function(){
	$("#goodsId").click(function(){
		$("#title").click();
	});
	$("#select").click(function(){
		var url="getitemType.do";
		var data=$(this).val();
		$.ajax({url:url,data:{"id":data},success:function(data){
			if(data){
				var obj = eval(data);
				var a   = "<select class='form-control selectpicker' name='title' id='title'>";
				var b   = "</select>";
				var s   = "";
				for(var i=0;i<obj.length;i++){
					var v=obj[i]['id'];
					var k=obj[i]['title'];
					s +="<option value="+v+">"+k+"</option>";
				}
				var end=a+s+b;
				$("#title").remove();
				$("#append").after(end);
				/*ajax回调需要重新绑定*/
				$(document).on('click', '#title', function() {
					var url="checkitem.do";
					var data={
							"goodsId":$("#goodsId").val(),
							"itemId":$(this).val()
						};
					$.ajax({url:url,data,success:function(data){
						if(data == "success"){
							$("#tip").text("已经添加").css({"color":"red"});
							$("#additem").attr({"disabled":true});
						} else {
							$("#tip").text("可以添加").css({"color":"green"});
							$("#additem").attr({"disabled":false});		
						}
			        }
					});
				});
				return ;
				} else {
					alert("没有数据！！");
					return ;			
				}
		    }
		});
	});
	$("#select").click(function(){
		$("#title").click();
	})
});



$(function(){
	$("#goodsId2").click(function(){
		$("#title2").click();
	});
	$("#select2").click(function(){
		var url="getitemType.do";
		var data=$(this).val();
		$.ajax({url:url,data:{"id":data},success:function(data){
				if(data){
					var obj = eval(data);
					var a   = "<select class='form-control selectpicker' name='title2' id='title2'>";
					var b   = "</select>";
					var s   ="";
					for(var i=0;i<obj.length;i++){
						var v=obj[i]['id'];
						var k=obj[i]['title'];
						s +="<option value="+v+">"+k+"</option>";
					}
					var end=a+s+b;
					$("#cc3").remove();
					$("#title2").remove();
					$("#append2").after(end);
					/*ajax回调需要重新绑定*/
					$(document).on('click', '#title2', function() {
						var url="checkitem.do";
						var data={
								"goodsId":$("#goodsId2").val(),
								"itemId":$(this).val()
							};
						$.ajax({url:url,data,success:function(data){
							if(data == "success"){
								$("#tip2").text("已经添加").css({"color":"red"});
								$("#additem2").attr({"disabled":true});
							} else {
								$("#tip2").text("可以添加").css({"color":"green"});
								$("#additem2").attr({"disabled":false});		
							}
				        }
						});
					});
					return ;
					} else {
						alert("没有数据！！");
						return ;			
					}
		        }
			});
	});
	$("#select2").click(function(){
		$("#title2").click();
	})
});


$(function(){
	$("#WFZ").click(function(){
		//alert();
		var url = "updateitemsprice.do";
		var v = $("#goodsId3").val();
		var b = $("#title3").val();
		window.location.href="updateitemsprice.do?goodsId="+v+"&&itemId="+b;
	});
})
