<#include "../layout.b2b.ftl">
<#assign active='s2'>
<#macro breadcrumb>
	<li>个人中心</li>
	<li>预约详情</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
		预约详情
	</p>	
</div>

<div class="bg-body bg-white other-body" style="min-height: 865px; padding: 14px 49px;">
	<#if list.submitFlag=1>
		<p style="color:#1b9d97;font-size:16px">等待应答</p>
	<#elseif list.submitFlag=2>
		<p style="color:#1b9d97;font-size:16px">预约完成</p>
	<#else>
		<p style="color:#1b9d97;font-size:16px">取消预约</p>
	</#if>
	<p style="font-size:16px">预约信息</p>
	<p>预约需求编号：${list.id}</p>
	<p>联系人：${list.person!""}</p>
	<p>预约电话：${list.mobile!""}</p>
	<p>提交时间：${list.submitDate?datetime}</p>
	<p>预约时间：${list.bespokeDate?datetime}</p>
	<p>提交的需求：${list.pokedesc!""}</p>
	<hr/>
	<#if list.submitFlag=1>
		<button class="btn-primary btn submit" value="3" type="button" id="submit" name="submit">取消预约</button>
		<input value="${list.id}" type="hidden" id="id"/>
	<#elseif list.submitFlag=2>
		<p>服务完成时间：${list.endDate}</p>
		<p>工程师：${list.tecperson!""}</p>
		<p>总费用：<span style="color:#1b9d97;font-size:16px">${list.pay!"0.00"}<span> 元</p>
	<#else>
		<p>您已取消预约</p>
	</#if>
	
</div>
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.other-body p{font-size:14px}
	.submit{height:30px;width:130px;color:white;border-radius:0px;
			margin-left:0px ;font-weight:normal;line-height:30px}
</style>
<script>
requirejs('jquery',function(){
		$(".submit").click(function(){
			var url="updatebespoke.do";
			var data={
					"submitFlag":$("#submit").val(),
					"id":$("#id").val()
				};		
			$.ajax({url:url,type:"post",data,success:function(data){
						if(data=="true"){
							alert("取消成功！！");
							window.location.href="bespoke.do";
						} else {
							alert("取消失败！！请联系客服");
							window.location.href="bespoke.do";		
						}
			        }
				});
		});
	});
</script>
</@layout>