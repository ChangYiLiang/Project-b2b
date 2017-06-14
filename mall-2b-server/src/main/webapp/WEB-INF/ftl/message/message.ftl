<#include "../layout.b2b.ftl">
<#assign active='o6'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/message/list.do">我的消息</a></li>
</#macro>
<@layout header=head>
<style>
	.pager{float:right;margin-right:50px}
</style>
<link rel="stylesheet" href="${BasePath}/css/message.css" />
	<h2 class="bg-white">消息提醒</h2>
	<div class="bg-white other-body">
		<br/>
		<br/>
			<#if messageList?size==0>
				<div align="center" ><img src="${BasePath}/images/2bmessage/nomessage.png" style=" margin-top:100px"></div>
			</#if>
			<#list  messageList as message>			  		    	
					 <div style="background-color:WhiteSmoke;margin-left:45px;width:860px;height:110px;margin-bottom:18px;">
								    <div class="row text-right close"><a href="javascript:;" onclick="MyApp.message.del(${message.id})" style="color:#000000" >X</a></div>
									<div class="row message">
										     <div class="col-md-8">
											    <div class="mTitle">${message.title!""}</div>
											 </div>
											 <div class="col-md-4 text-right">
											    <div class="mTime">${message.createTime?datetime}</div>
											 </div>
									 </div>
									 <div class="mContent">${message.content}</div>
								    <#if (message.url)?? >
									    <div class="mUrl text-right"><a style="color:#74D2D4"  href="${message.url}" target="_blank">立即查看>>></a></div>
									</#if>
					</div>	
			</#list>			
	${pageCode}		
</div>	
</@layout>
<#macro script>
	requirejs(['message'])
</#macro>

