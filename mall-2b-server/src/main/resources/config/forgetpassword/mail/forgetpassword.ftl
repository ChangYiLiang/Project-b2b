<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>九河互联密码找回</title>
</head>
<body>
	<p>尊敬的用户: <strong>${username}</strong></p>
	<h3>[九河互联]找回密码</h3>
	<p>你使用“找回密码”功能。点击以下链接，设置你的新密码：</p>
	<p><a href="${basepath}/i9he/${token}/resetpassword.do">${basepath}/i9he/${token}/resetpassword.do</a></p>
	<p>如果以上链接不能点击，你可以复制网址URL，然后粘贴到浏览器地址栏打开，完成更新。</p>
	<p><br /></p>
	<p style="color:#999">（这是一封自动发送的邮件，请不要直接回复）</p>
	<p style="color:#999">－如果你没有使用过“找回密码”功能，请忽略本邮件，你的[九河互联]账户依然是安全的。</p>
	<p style="color:#999">还有其他问题? 联系<a href="mailto:cs@9he.com">九河互联</a>客服。</p>
</body>
</html>