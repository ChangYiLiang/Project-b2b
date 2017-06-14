
<!DOCTYPE html>
<html lang="zh-CN">
<head>
		<title>支付成功</title>
		<#include '../_inc_head.ftl'>
		<link rel="stylesheet" href="${BasePath}/css/user-center.css" />
		<#include "../2buser/userheader.ftl">
</head>
<body>
<br/>
<div class="bg-white" style="height:600px;width:1200px;margin:auto">
	<div class="container">
		<br/><br/><br/><br/>
		<div class="row ">
			<div class="text-center">
				<img src="${BasePath}/images/2buser/u140true.png" style="width:30px;height:30px;margin-top:-8px"/>
				 <span style="font-size:20px;">订单支付成功，即将跳转主页<span id="num" style="color:red;font-size:20px;">5</span></span>
			 </div>
		</div>
	</div>
</div>
<br />
<div id="footer" class="text-center">
	<#include "../2buser/userfooter.ftl">
</div>
<script>
	function goIndex(){
		var num = $("#num").html();
		$("#num").html(parseInt(num)-1);
		if($("#num").html()=='0'){
			window.location.href = '${BasePath}/controller/order/tomyorder.do?state=6';
		}
	}
</script>
<script>requirejs(['core'], function(){
		$("#index").click(function(){
			window.location.href = "${BasePath}/controller/order/tomyorder.do?state=6";
		})
		$(document).ready(function(){  
			 setInterval(goIndex, 1000);  
			});
	})
	</script>
</body>
</html>