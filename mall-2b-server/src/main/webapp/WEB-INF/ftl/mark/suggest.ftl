<#include "../layout.b2b.ftl">
<#assign active='s3'>
<#macro breadcrumb>
<li>个人中心</li>
<li>我的建议</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
		投诉建议
	</p>	
</div>

<div class="bg-body bg-white other-body" style="min-height: 865px; padding: 24px 49px;">
	<!--
	<span>感谢您对九河网的支持，如您有任何意见或建议，请以邮件或致电的方式反馈给我们，我们会及时采纳，力求为您提供最优质的服务。</span>
	-->
	<form action="#" id="form" method="POST">
		<!--
		<label><input name="type" type="radio" value="1" checked/><span>我要建议</span></label> 
		<label><input name="type" type="radio" value="2" /><span>我要投诉</span></label>
		-->
		<span style="font-size:13px">选择类型：</span>
		<select name="type" id="type" style="display:inline-block;width:160px" class="form-control">
			<option value="1" selected>我要建议</option>
			<option value="2">我要投诉</option>
		</select>
		<br/>
		<br/> 
		<span style="font-size:13px">内容描述：</span>
		<textarea name="content" id="content" class="form-control textarea required" rows="5"></textarea>
		<span id="tip"></span>
		<button class="btn-primary btn submit" type="button" id="submit" name="submit">确认提交</button>
	</from>
</div>
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	label{width:120px}
	label span{margin-left:3px;font-size:13px;font-weight:normal}
	.textarea{width:780px;position:relative;left:68px;top:-20px}
	.submit{height:30px;width:130px;color:white;border-radius:0px;
			margin-left:68px ;font-weight:normal;line-height:30px}
</style>
<script>
	requirejs(["jquery"], function() {
		$(".submit").click(function(){
			var url="insertsuggest.do";
			var data={
					"type":$("#type").val(),
					"content":$("#content").val()
				};
			if(data.content==""){
				return false;
			}
			$.ajax({url:url,type:"post",data:data,success:function(data){
						if(data=="true"){
							alert("提交成功！感谢您对我们的支持");
							window.location.href="suggest.do";
						} else {
							alert("提交失败！请联系客服");
							window.location.href="suggest.do";		
						}
			        }
				});
		});
	});
</script>
</@layout>