/*function submit(){
	var validcode = $("#validcode").val();
	$.post("check.do",{validcode:validcode},function(data){
		if(data){
			var who = $("#who").html();
			var mx1 = $("#mx1").html();
			var zzfpId = $("#zzfpId").val();
			var remark = $("#remark").val();
			window.location.href="topay.do?who="+who+"&mx1="+mx1+"&zzfpId="+zzfpId+"&remark="+remark;
		}else{
		    $("#errorInfo").html("验证码错误");	
		}
	},'json');
	
 }*/

function paysubmit(){
	var BasePath = $("#BasePath").val();
	//var validcode = $("#validcode").val();
	//$.post("check.do",{validcode:validcode},function(data){
		//if(data){
			var who = $("#who").html();
			var mx1 = $("#mx1").html();
			var zzfpId = $("#zzfpId").val();
			var remark = $("#remark").val();
			var id = $("#order").val();
			var type = $("#flag-addr").val();
			
			//如果值为0的话证明都是代理托管订单
			if(type==0){
				var addressId = "";
				window.location.href='topay.do?orderId='+id+"&who="+who+"&mx1="+mx1+"&zzfpId="+zzfpId+"&remark="+remark+"&type="+type+"&addressId="+addressId;
				return false;
			}
			$.post("isMain.do",{},function(data){
				if(data){
					var addressId = $("input[name='checkBox']:checked").val();
					window.location.href='topay.do?orderId='+id+"&who="+who+"&mx1="+mx1+"&zzfpId="+zzfpId+"&remark="+remark+"&type="+type+"&addressId="+addressId;
				}else{
					layer.alertEx({content: "您还没有设置收货地址!",icon: "info",yes:function(index){
						window.location.reload();
						layer.close(index);
					}});
					return;
				}
			},'json')
		//}else{
		   // $("#errorInfo").html("验证码错误");	
		//}
	//},'json');
}
function opendialog(){
	$("#opendialog1").modal();
}
function fapiaoc(){
    var fapiao = $("#fapiao").val();
	if(fapiao=='个人发票'){
		$("#namec").prop("disabled",true);
		$("#namec").val("");
		
	}else{
		$("#namec").prop("disabled",false);
	}
}

function save(){
	var fapiao = $("#fapiao").val();
	var name = $("#namec").val();
	$("#fpty").html("普通发票(电子)");
	var fpcontent = $("#fpcontent").val();
	if(!fpcontent || fpcontent==''){
		alert("请选择发票内容");
		return;
	}
	
	if(fapiao=='个人发票'){
		$("#who").html("个人");
		$("#mx1").html($("#fpcontent").val());
	}else{
		if(name &&　name!=''){
			$("#who").html($("#namec").val());
			$("#mx1").html($("#fpcontent").val());
		}else{
			alert("请填写单位名称")
		}
		
	}
}
function ptfp(){
	$("#save").hide();
	$("#save1").show();
}
function zzfp(){
	$("#save1").hide();
	$("#save").show();
	$.post();
}
function save1(){
	var companyName = $("#companyName").val();
	if(!companyName || companyName==''){
		return;
	}
	$("#fpty").html("增值税发票");
	$("#who").html($("#companyName").val());
	$("#mx1").html("");
}



