define( function(){
	requirejs(['jquery','core'],function() {
	
	var address = MyApp.namespace("address");
	
		$(".myAddress").each(function(){
			$(this).mouseenter(function(){
				$(this).children(".addressOperate").children().last().show();
			})
		});
		$(".myAddress").each(function(){
			$(this).mouseleave(function(){
				$(this).children(".addressOperate").children().last().hide();
			})
		});
		
		$("#addAddress_from").i9heValidate({submitHandler: function(){
			var url="addaddress.do";
			var data={
					"address1":$("#address1 option:selected").val(),
					"address2":$("#address2 option:selected").val(),
					"address3":$("#address3 option:selected").val(),
					"mobile":$("#mobile").val(),
					"consigneeName":$("#consigneeName").val(),
					"streetAddress":$("#streetAddress").val()
				}
			$.ajax({type:"POST",url:url,data:data,dataType:"JSON",success:function(result){
				if(result){
					layer.alertEx({content: "添加地址成功！", end: function () {
						window.location.href="myaddress.do";
					}});	
					} else {
						layer.alertEx({content: "添加地址失败！", end: function () {
							window.location.href="myaddress.do";
						}});
				}
				
			}});
		}});
		
		$("#editAddress_from").i9heValidate({submitHandler: function(){
			var url="editaddress.do";
			var data={
					"address1":$("#editaddress1 option:selected").val(),
					"address2":$("#editaddress2 option:selected").val(),
					"address3":$("#editaddress3 option:selected").val(),
					"mobile":$("#mobile").val(),
					"id":$("#id").val(),
					"consigneeName":$("#consigneeName").val(),
					"streetAddress":$("#streetAddress").val()
			}
			$.ajax({type:"POST",url:url,data:data,dataType:"JSON",success:function(result){
				if(result){
					layer.alertEx({content: "修改地址成功！", end: function () {
						window.location.href="myaddress.do";
					}});
				} else {
					layer.alertEx({content: "修改地址失败！", end: function () {
						window.location.href="myaddress.do";
					}});
				}
				
			}});
		}});
		
		address.deleteAddress = function(data){
			var data = data.id;
			layer.confirmEx({content: "确定删除该地址！?", icon: "question", yes: function () {
				var url = "../address/deleteaddress.do";
				var data1 = {
					"id" : data
				};
				$.ajax({
					url: url,
					type: "POST",
					dataType: "JSON",
					data: data1,
					success: function(data){
						if(data){
							layer.alertEx({content: "删除地址成功！", end: function () {
								window.location.reload();
							}});
							
						} else {
							layer.alertEx({content: "删除地址失败！", end: function() {
								window.location.reload();
							}});
						}
					}
				});
	        }});
		}
		

		//设置默认地址
		address.setMainAddress = function(data){
			var url="setMainAddress.do";
			var data = data;
			$.ajax({url:url,data:data,type:"POST",dataType:"JSON",
				success: function(result){
					if(result){
						window.location.reload();
//						layer.alertEx({content: "设置默认地址成功！", end: function() {
//							
//						}});
					}else{
						layer.alertEx({content: "设置默认地址失败！", end: function() {
							window.location.reload();
						}});
					}
				}
			});
		}
		
		//加载下拉省数据
		$.getJSON("getprovince.do", function(data) {
			$("#address1").createOptions(data, "选择所属省");
			$("#editaddress1").createOptions(data, "选择所属省");
			$("#editaddress1").children().each(function(){
				if($(this).text() == $("#editaddressOption1").val()){
					$(this).prop("selected","selected");
				}
			})
			
			$.getJSON("city.do", {parentId:$("#editaddress1").val()}, function(data) {
				$("#editaddress2").createOptions(data, "选择所属市");
				$("#editaddress2").children().each(function(){
					if($(this).text() == $("#editaddressOption2").val()){
						$(this).prop("selected","selected");
					}
				})
				
				$.getJSON("city.do", {parentId:$("#editaddress2").val()}, function(data) {
					$("#editaddress3").createOptions(data, "选择所属县");
					$("#editaddress3").children().each(function(){
						if($(this).text() == $("#editaddressOption3").val()){
							$(this).prop("selected","selected");
						}
					})
				});
			});
			
		});
		
		//省县市 三级联动
		$("#address1").unbind().change(function() {
			if (!$(this).val()) {
				$("#address2").createOptions({}, "--加载中--");
				return;
			}
			$.getJSON("city.do", {parentId:$(this).val()}, function(data) {
				$("#address2").createOptions(data, "选择所属市");
			});

		});
		
		$("#address2").unbind().change(function() {
			var data = $(this).serialize();

			if (!$(this).val()) {
				$("#address3").createOptions({}, "--加载中--");
				return;
			}

			$.getJSON("city.do", {parentId:$(this).val()}, function(data) {
				$("#address3").createOptions(data, "选择所属县");
			});

		});
		
		$("#editaddress1").unbind().change(function() {
			if (!$(this).val()) {
				$("#editaddress2").createOptions({}, "--加载中--");
				return;
			}
			$.getJSON("city.do", {parentId:$(this).val()}, function(data) {
				$("#editaddress2").createOptions(data, "选择所属市");
			});
			
		});
		
		$("#editaddress2").unbind().change(function() {
			var data = $(this).serialize();
			
			if (!$(this).val()) {
				$("#editaddress3").createOptions({}, "--加载中--");
				return;
			}
			
			$.getJSON("city.do", {parentId:$(this).val()}, function(data) {
				$("#editaddress3").createOptions(data, "选择所属县");
			});
			
		});
		
		jQuery.validator.addMethod("mobile", function(value, element) {
			  var length = value.length;
			  var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
			  return this.optional(element) || (length == 11 && mobile.test(value));
			}, "请正确填写您的手机号码"); 
		
		
	//end	
	});
	
	return {
		
	};
});
