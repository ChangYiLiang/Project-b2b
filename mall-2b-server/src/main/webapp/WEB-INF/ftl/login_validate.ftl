<#include "layout.common.ftl">

<@layout>
	<div class="text-center bg-white" style="min-height: 600px">
		<br /><br /><br />
		<img src="${BasePath}/images/2buser/2.gif" alt="" />
		<h3 style="font-size:18px;color:#333333">登录成功, 正在验证帐号安全性!</h3>
		<br /><br /><br />
	</div>
	
</@layout>

<#macro scripts>
<script>
function onLoginSuccess() {
	setTimeout(function () {
		location = "${service}";
	}, 0)
}
require(['jquery'], function() {
	$("#validateFrame").remove();
	var form = $("#submitForm").html();
	$("body").append('<iframe style="display:none" id="validateFrame"></iframe>');
	$("#validateFrame").contents().find('body').html(form);
	$("#validateFrame").contents().find("form").submit();
});
</script>
<script id="submitForm" type="text/html" style="display:none">
<form action="${CasPath}/registerCastgc" method="POST">
	<input type="hidden" name="service" value="${BasePath}/login_success.do" />
	<input type="hidden" name="CASTGC" value="${castgc}" />
</form>
</script>
</#macro>

