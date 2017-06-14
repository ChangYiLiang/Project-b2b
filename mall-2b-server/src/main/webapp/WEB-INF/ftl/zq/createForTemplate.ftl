<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>众签合同</title>
		<#include '../_inc_head.ftl'>
	</head>
	<body>
			<br/>
			<br/>
			<br/>
			<div class="text-center">
			<a href="signAutomatic.do"  class="btn btn-primary ">自动签署</a><br/><br/>
			<a href="signByValidationCode.do"  class="btn btn-primary ">短信验证签署</a><br/><br/>
			<a href="signByWriting.do"  class="btn btn-primary ">验证手写签署</a><br/><br/>
			<#--<a href="" class="btn btn-primary ">硬Key签署</a>-->	
			</div>
	</body>
	<script>requirejs(['createContract','core'])</script>
</html>
