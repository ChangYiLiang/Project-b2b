<#if setuser??>
<script>
	if (window.parent && window.parent.setLoginUser) {
		var user = {};
		user.username = "${user.username}";
		window.parent.setLoginUser(user);
	}
</script>
</#if>