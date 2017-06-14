<!DOCTYPE html>
<html lang="zh-CN">
	<head>
	    <#include '../_inc_head.ftl'>
		
	</head>
<body>
       <#--
		 http://1555i80o68.imwork.net/xsb/orderinfo/pay
		 https://www.gssyu.com/xsb/orderinfo/pay
		 -->
		 <form action='${downOrderUrl}'>
		    <input  style="display:none" name="order_info" value='${order_info}'/>
		    <input  style="display:none" name="sign" value="${sign}"/>
		    <input  style="display:none" name="return_url" value="${return_url}"/>
		    <input  style="display:none" id="submit" type="submit"/>
		  
		 </form>
	
	</body>
		<script>requirejs(['core'],function(){
			$("#submit").click();
		})</script>
</html>
