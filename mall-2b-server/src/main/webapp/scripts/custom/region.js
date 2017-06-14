$("#address1").unbind().change(function() {
				var data = $(this).serialize();
		
				if (!$(this).val()) {
					$("#address2").createOptions({}, "--加载中--");
					return;
				}
		
				$.getJSON("../city.do", data, function(data) {
					$("#address2").createOptions(data, "选择所属市");
				});
		
			});
		
$("#address2").unbind().change(function() {
	var data = $(this).serialize();
		
	if (!$(this).val()) {
		$("#address3").createOptions({}, "--加载中--");
			return;
		}
		
	$.getJSON("../city1.do", data, function(data) {
		$("#address3").createOptions(data, "选择所属县");
	});
		
});



var DataTable = function() {
	alert(4)
	
	
	$("#saveaddress").click(function(){
		var url="../addaddress.do";
		var data={
			"address1":$("#address1 option:selected").val(),
			"address2":$("#address2 option:selected").val(),
			"address3":$("#address3 option:selected").val(),
			"mobile":$("#mobile").val(),
			"addressDetail":$("#addressDetail").val()
		};
		Cl.ajaxRequest(url,data,function(result){
			if(!result) return ;		
			result = result.replace(/(^\s*)|(\s*$)/g,'');
			if(result == "success"){
				alert("添加地址成功");
				window.location.href="payMethod.do";
			} else {
				alert("添加地址失败");
				return ;			
			}
		});
	});

}
