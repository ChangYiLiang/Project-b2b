
function gopaysubmit(){
	
	var type = $("#flag-addr").val();
	$("#remark").attr({"value":$("#remark2").val()});
	
	//如果值为0的话证明都是代理托管订单
	if(type==0){
		$("#form_cl").submit();
		return false;
	}
	$.post("isMain.do",{},function(data){
		if(data){
			$("#form_cl").submit();
		}else{
			layer.alertEx({content: "您还没有设置收货地址!",icon: "info",yes:function(index){
				window.location.reload();
				layer.close(index);
			}});
			return;
		}
	},'json')
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
		$("#header").attr({"value":"个人"});
		$("#content").attr({"value":fpcontent});
		alert($("#content").val());
		$("#mx1").html($("#fpcontent").val());
	}else{
		if(name &&　name!=''){
			$("#who").html($("#namec").val());
			$("#mx1").html($("#fpcontent").val());
			$("#header").attr({"value":$("#namec").val()});
			$("#content").attr({"value":fpcontent});
			alert($("#content").val());
		}else{
			alert("请填写单位名称");
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
	$("#content").attr({"value":$("#fpcontent").val()});
	$("#fpty").html("增值税发票");
	$("#who").html($("#companyName").val());
	$("#header").attr({"value":$("#namec").val()});
	$("#mx1").html("");
}