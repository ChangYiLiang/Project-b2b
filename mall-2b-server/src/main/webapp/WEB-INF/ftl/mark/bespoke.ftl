<#include "../layout.b2b.ftl">
<#assign active='s2'>
<#macro breadcrumb>
	<li>个人中心</li>
	<li>预约上门</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
		上门预约服务
	</p>	
</div>

<div class="bg-body bg-white other-body" style="min-height: 865px; padding: 14px 49px;">
	<ul class="nav nav-pills nav-other" style="margin-left:-14px" role="tablist">
		<li role="presentation" class="active"><a href="#cha1" role="tab" data-toggle="tab">上门预约服务</a></li>
		<li style="border-right:0px solid red" role="presentation"><a href="#cha2" role="tab" data-toggle="tab">预约记录</a></li>
	</ul>
	<hr class="charge-hr"/>
	<div class="tab-content">
	  	<div role="tabpanel" class="tab-pane active" id="cha1">
	  		<span style="color:#999999">请准确填写您的预约信息，我们将快速安排工程师上门服务。</span>
	  		<hr/>
	  		<form action="insertbespoke.do" id="form" method="POST">
	  			<!--
	  			<span>服务标题：</span>
	  			<input class="form-control" type="text" name="title" id="title" required/>
	  			<br/>
	  			<br/>
	  			-->
	  			<span>您的称呼：</span>
	  			<input class="form-control" type="text" name="person" id="person" required/>
	  			<br/>
	  			<br/>
	  			<span>联系电话：</span>
	  			<input class="form-control" type="text" name="mobile" id="mobile" required/>
	  			<br/>
	  			<br/>
	  			<span>预约日期：</span>
	  			<input class="form-control" type="text" name="bespokeDate" id="bespokeDate" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" required />
	  			<br/>
	  			<br/>
	  			<span class="other-span">详细需求：</span>
	  			<textarea name="desc" id="desc" class="form-control" style="width:778px" rows="5" required></textarea>
	  			<br/>
	  			<br/>
	  			<br/>
	  			<button class="btn-primary btn submit" type="button" name="submit">确认提交</button>
	  		</form>	
	  	</div>
	  	<div role="tabpanel" class="tab-pane" id="cha2">
			<table class="table table-bordered">
			  <thead>
			    <tr class="flag-tr">
			      <th width="20%">上门预约编号</th>
			      <th width="20%">提交时间</th>
			      <th width="20%">联系人</th>
			      <th width="20%">状态</th>
			      <th width="20%">操作</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list list as l>
			    <tr class="flag2-tr">
			      <td>${l.id}</td>
			      <td>${l.submitDate?datetime}</td>
			      <td>${l.person!""}</td>
			      <td style="color:#93d9d6">
			      	  <#if l.submitFlag=1>
			      	  	等待应答
			      	  <#elseif l.submitFlag=2>
			      	  	预约完成
			      	  <#else>
			      	  	取消预约
			      	  </#if>
			      </td>
			      <td><a href="bespokeinfo.do?id=${l.id}">查看详情</a></td>
			    </tr>
			    </#list>
			  </tbody>
			</table>
	  	</div>
	</div>
</div>
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	#form_cl span{color:#333;font-size:14px}
	.form-control{display:inline-block !important;width:250px}
	.other-span{position:relative;top:-110px}
	.submit{height:30px;width:130px;color:white;border-radius:0px;
			margin-left:63px ;font-weight:normal;line-height:30px}
	.flag-tr th{background-color:#93d9d6;text-align:center;border:1px solid #93d9d6 !important;font-size:14px}
	.flag2-tr td{text-align:center;font-size:14px;border:1px solid #F1F1F1 !important}
</style>
<script src="${BasePath}/scripts/custom/laydate.js"></script>
<script>
requirejs(["jquery"], function(){
		$(".submit").click(function(){
			var url="insertbespoke.do";
			var data={
					"person":$("#person").val(),
					"pokedesc":$("#desc").val(),
					"mobile":$("#mobile").val(),
					"bespokeDate":$("#bespokeDate").val()
				};	
			if(data.person=="" || data.pokedesc=="" || data.mobile=="" || data.bespokeDate==""){
				return false;
			}		
			$.ajax({url:url,type:"post",data:data,success:function(data){
						if(data=="true"){
							alert("预约成功！感谢您对我们的支持");
							window.location.href="bespoke.do";
						} else {
							alert("预约失败！请联系客服");
							window.location.href="bespoke.do";		
						}
			        }
				});
		});
	});
</script>

</@layout>