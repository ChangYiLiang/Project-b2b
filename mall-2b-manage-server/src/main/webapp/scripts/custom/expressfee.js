    //编辑按钮
	$("tbody").on("click",".selectRegin",function(){
		$("#selectRegion").modal();
		$("div").removeClass("checker");
		$("input:checkbox").each(function(){
			$(this).prop("checked",false);
		});
		var th = $(this);
		var province = new Array();
		//点击选择省份
		$("#selectConfirm").click(function(){
			$(".checkProvince").each(function(){
				if($(this).prop("checked")){
					province.push($(this).val());
				}
			});
			var newProvince = formatProvince(province);
			//点击全国
			if($(".checkAll").prop("checked")){
				newProvince = "全国";
			}
			displayProvince(th,newProvince);
		});
	});
	//删除按钮
	$("tbody").on("click",".removeType",function(){
		if($("tbody tr").length == 2){
			alert("只剩最后一个模板了！");
		}else{
			$(this).closest("tr").remove();
		}
	});
	
	var formatProvince = function(province){
		var newProvince = "";
		for(var i=0;i<province.length;i++){
			if(i == province.length-1){
				newProvince += province[i]+'';
			}else{
				newProvince += province[i]+'、';
			}
		}
		return newProvince;
	}
	//显示所选省份
	var displayProvince = function(th,newProvince){
		th.parent().prev().children("input").val(newProvince);
		th.parent().prev().children("span").html(newProvince);
	}
	
	//加载下拉省数据
	$.getJSON("getprovince.do", function(data) {
			$("#senderProvince").createOptions(data, "选择所属省");
			$("#senderProvince1").createOptions(data, "选择所属省");
			$("#senderProvince1").children().each(function(){
				if($(this).text() == $("#senderProvince").val()){
					$(this).prop("selected","selected");
				}
			})
			
			$.getJSON("city.do", {parentId:$("#senderProvince1").val()}, function(data) {
				$("#senderCity1").createOptions(data, "");
				$("#senderCity1").children().each(function(){
					if($(this).text() == $("#senderCity").val()){
						$(this).prop("selected","selected");
					}
				})
			})
		})
		
	//省县市 三级联动
	$("#senderProvince").unbind().change(function() {
		if (!$(this).val()) {
			$("#senderCity").createOptions({}, "--加载中--");
			return;
		}
		$.getJSON("city.do", {parentId:$(this).val()}, function(data) {
			$("#senderCity").createOptions(data, "选择所属市");
		});
	});
	
	//添加一个
	var addType = function(){
		var lastType = $("#addType").closest("tr").prev().find(".provinceName").val();
		if(lastType.length == 0){
			alert("请先编辑完上一个模板!");
		}
		else if($("tbody tr").length>34){
			alert("最多添加34个模板!");
		}
		else{
			var html = '<tr><td><div class="col-sm-8 col-sm-offset-2"><input type="hidden" class="provinceName" name="provinceName" value=""><span>未添加指定地区</span></div><div class="col-sm-2 text-right"><a class="selectRegin" href="javascript:void(0)">编辑</a></div></td>'+
					  	  '<td><input type="text" class="firstCount" name="firstCount" value="1" /></td>'+
					  	  '<td><input type="text" class="firstFee" name="firstFee" value="0" /></td>'+
					  	  '<td><input type="text" class="addCount" name="addCount" value="1" /></td>'+
					  	  '<td><input type="text" class="addFee" name="addFee" value="0" /></td>'+
					  	  '<td><a href="javascript:void(0);" class="removeType">删除</a></td>'+
					  '</tr>';
			$("#addType").closest("tr").prev().after(html);
		}
	}
	
	var submitValidate = function(){
		var result = true;
		$(".error").html("");
		if($.trim($("#name").val()) == ""){
			$(".nameError").html("模板名不能为空！");
			result = false;
		}
		if($.trim($("#expressName").val()) == ""){
			$(".expressNameError").html("快递名称不能为空！");
			result = false;
		}
		if($.trim($('#senderProvince option:selected') .val()) == "" && $.trim($('#senderCity option:selected') .val()) == ""){
			$(".senderProvinceError").html("发货地不能为空！");
			result = false;
		}
		var lastType = $("#addType").closest("tr").prev().find(".provinceName").val();
		if($.trim(lastType) == ""){
			$(".expressfeeTypeError").html("目的地不能为空！");
			result = false;
		}
		return result;
	}
	
	var toSubmit = function(){
		var result =  submitValidate();
		if(result){
			var data = $("#addTemplate_from").serialize();
			var newData = data.replace(/\\+/g," ");//解决serialize()方法将空格转义的问题
			newData = decodeURIComponent(newData);//
			var url = "addtemplate.do";
			$.ajax({url:url,data:newData,type:"POST",dataType:"JSON",success:function(result){
				if(result){
					alert("提交成功！");
					window.location.reload();
				}else{
					alert("提交失败,请重新提交！");
					window.location.reload();
				}
			}});
		}
	}
	
	var modifyValidate = function(){
		var result = true;
		$(".error").html("");
		if($.trim($("#name").val()) == ""){
			$(".nameError").html("模板名不能为空！");
			result = false;
		}
		if($.trim($("#expressName").val()) == ""){
			$(".expressNameError").html("快递名称不能为空！");
			result = false;
		}
		if($.trim($('#senderProvince1 option:selected') .val()) == "" && $.trim($('#senderCity1 option:selected') .val()) == ""){
			$(".senderProvinceError").html("发货地不能为空！");
			result = false;
		}
		var lastType = $("#addType").closest("tr").prev().find(".provinceName").val();
		if($.trim(lastType) == ""){
			$(".expressfeeTypeError").html("目的地不能为空！");
			result = false;
		}
		return result;
	}
	
	var toModify = function(){
		var result =  modifyValidate();
		if(result){
			var data = $("#modifyTemplate_from").serialize();
			var newData = data.replace(/\\+/g," ");//解决serialize()方法将空格转义的问题
			newData = decodeURIComponent(newData);//
			var url = "modify.do";
			$.ajax({url:url,data:newData,type:"POST",dataType:"JSON",success:function(result){
				if(result){
					alert("修改成功！");
					window.location.reload();
				}else{
					alert("修改失败,请重新修改！");
					window.location.reload();
				}
			}});
		}
	}
	
	var deleteTemplate = function(id){
		if(confirm("确定删除该模板！")){
			var data = {templateId:id}
			var url = "delete.do";
			$.ajax({data:data,url:url,dataType:"JSON",type:"POST",success:function(result){
				if(result){
					alert("删除成功！");
					window.location.reload();
				}else{
					alert("删除失败！")
					window.location.reload();
				}
			}});
		}
	}
	var disableTemplate = function(id){
		var data = {templateId:id}
		var url = "disable.do";
		$.ajax({data:data,url:url,type:"POST",dataType:"JSON",success:function(result){
			if(result){
				window.location.reload();
			}
		}});
	}
	var enableTemplate = function(id){
		var data = {templateId:id}
		var url = "enable.do";
		$.ajax({data:data,url:url,type:"post",dataType:"json",success:function(result){
			if(result){
				window.location.reload();
			}
		}});
	}
	var seachTemplate = function(){
		var url = $("#basePath").val()+"/controller/expressfee/list.do?keyword="+$('#keyword').val();
		window.location.href = encodeURI(encodeURI(url));
	}
	