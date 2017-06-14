function gotoLogin() {
	layer.open({type: 1, content: $("#loginAlert"), area: ["610px", "280px"], title: false, btn: false, shadeClose: true});
}

var User = function() {
	return {
		submit : function() {
			
			var BasePath = $("#BasePath").text();
			
			//是否是信赊宝用户
			if ($("#optionsRadios2").prop("checked")) {
				$.post(BasePath+"/gssy/isExists.do", {}, function(data) {
					if (data) {
						$.post(BasePath+"/controller/product/isMain.do", {}, function(data) {
							if (data) {
								$("#form_cl").submit();
							} else {
								layer.alertEx({content: "请到个人中心设置收货地址", icon: "info", end: function() { }});
							}
						}, 'json')
					}else{
						layer.alertEx({content: "如果您没有信赊宝账户请点击右边的了解河马赊账!", icon: "info", end: function() { }});
					}
				}, 'json')
				return;
			}
			$("#form_cl").submit();
		},
		noLogin : function() {
			gotoLogin();
		},
		addCart : function() {
			var gwc = $("#gwc").val();
			if (gwc == '加入购物车') {
				var BasePath = $("#BasePath").text();
				var goodsId = $("#goodsId").val();
				var url = BasePath+"/cart/add.do";
				var data = {
					"price" : $("#pay").val(),
					"config" : $("#config").val(),
					"isIdc" : $("#isIdc").val(),
					"cycle" : $("#orderCycle").val(),
					"goodsId" : $("#goodsId").val(),
					"goodsNum" : $("#number").val(),
					"itemIdList" : $('input[name="idlink"]').val(),
					"trustarea" : $("#trustarea").val()
				};
				Cl.ajaxRequest(url, data, function(result) {
					if (!result)
						return;
					result = result.replace(/(^\s*)|(\s*$)/g, '');
					if (result == "success") {
						layer.alertEx({content: $("#addcart")});
					} else if (result == "exists") {
						gotoLogin();
						return;
					} else {
						layer.alertEx({content: "添加购物车失败", icon: "info", end: function() { }});
						return;
					}
				});

			} else {
				$.post(BasePath+"/gssy/isExists.do", {}, function(data) {
					if (data) {
						var loginUrl = $("#loginUrl").val();
						window.open(loginUrl);
					}else{
						$('.regMessage').stop().fadeIn();
						$('.regMessage_1').stop().fadeIn();
					}
				}, 'json')
			}
		},
		addCart2 : function() {
			var url = "./cart/add2.do";
			var data = {
				"price" : $("#pay").val(),
				"config" : $("#config").val(),
				"isIdc" : $("#isIdc").val(),
				"cycle" : $("#orderCycle").val(),
				"goodsId" : $("#goodsId").val(),
				"goodsNum" : $("#number").val(),
				"itemIdList" : $('input[name="idlink"]').val()
			};
			Cl
					.ajaxRequest(
							url,
							data,
							function(result) {
								if (!result)
									return;
								result = result.replace(/(^\s*)|(\s*$)/g, '');
								if (result == "success") {
									window.location.href = "http://192.168.30.210:8888/2b/pay/nowpay.do";
								} else if (result == "exists") {
									gotoLogin();
									return;
								} else {
									alert("立即购买失败，请规范操作");
									return;
								}
							});
		}
	}
}();
