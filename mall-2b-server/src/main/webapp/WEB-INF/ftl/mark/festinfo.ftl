<#include "../layout.b2b.ftl">
<#assign active='b2'>
<#macro breadcrumb>
<li>个人中心</li>
<li>节操币</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">
	我的节操币：<span style="color:#1b9d97;font-weight:bold;font-size:14px">${fest?default(0)}个</span>
	<a style="width:130px;color:white;margin-top:15px;border-radius:0px;margin-right:37px;font-weight:normal" class="pull-right other-a" href="${BasePath}/mark/festrule.do">节操币使用说明>></a>
	<a style="width:130px;color:white;margin-top:15px;border-radius:0px;margin-right:37px;font-weight:normal" class="btn-primary btn pull-right" href="#" data-toggle="modal" data-target="#myModal">兑换余额</a>
	</p>	
</div>
<div class="bg-white other-body" style="min-height: 863px; padding: 16px 49px;">
	<ul class="nav nav-pills nav-other" style="margin-left:-14px" role="tablist">
		<li role="presentation" class="active"><a href="#cha1" role="tab" data-toggle="tab">节操币明细</a></li>
		<li role="presentation"><a href="#cha2" role="tab" data-toggle="tab">收入节操币</a></li>
		<li style="border-right:0px solid red" role="presentation"><a href="#cha3" role="tab" data-toggle="tab">支出节操币</a></li>
	</ul>
	<hr class="charge-hr"/>
	<div class="tab-content">
	  	<div role="tabpanel" class="tab-pane active" id="cha1">
	  		<table class="table table-bordered">
			  <thead>
			    <tr class="flag-tr">
			      <th>时间</th>
			      <th>收入/支出</th>
			      <th width="60%">备注</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list list as l>
			    <tr class="flag2-tr">
			      <td>${l.logTime?datetime}</td>
			      <td style="color:#1b9d97">${l.logNum?default(0)}个</td>
			      <td>${l.logDesc?default("")}</td>
			    </tr>
			    </#list>
			  </tbody>
			</table>
		</div>
		<div role="tabpanel" class="tab-pane" id="cha2">
			<table class="table table-bordered">
			  <thead>
			    <tr class="flag-tr">
			      <th>时间</th>
			      <th>收入+</th>
			      <th width="60%">备注</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list listadd as la>
			    <tr class="flag2-tr">
			      <td>${la.logTime?datetime}</td>
			      <td style="color:#1b9d97">+${la.logNum?default(0)}个</td>
			      <td>${la.logDesc?default("")}</td>
			    </tr>
			    </#list>
			  </tbody>
			</table>
		</div>
		<div role="tabpanel" class="tab-pane" id="cha3">
			<table class="table table-bordered">
			  <thead>
			    <tr class="flag-tr">
			      <th>时间</th>
			      <th>支出-</th>
			      <th width="60%">备注</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<#list listcut as lc>
			    <tr class="flag2-tr">
			      <td>${lc.logTime?datetime}</td>
			      <td style="color:#1b9d97">-${lc.logNum?default(0)}个</td>
			      <td>${lc.logDesc?default("")}</td>
			    </tr>
			    </#list>
			  </tbody>
			</table>
		</div>
	</div>
</div>

<!--充值弹出框-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">填写兑换个数</h4>
		  </div>
		  <div class="modal-body" style="height:128px">
			<form id="form_cl" action="#" method="POST">
				<input type="hidden" name="userId" value="${user.id}">
				<p>兑换账户：${user.username?default("")}</p>
				<p>兑换个数：<input type="text" style="border:1px solid #1b9d97" name="logNum" value="0" id="logNum">&nbsp;个</p>
				<p>兑换比率：<span style="font-size:13px">节操币的兑换比例是100:1，即在九河互联官网购物可以100节操币=1元抵扣现金。</span>
		  </div>
		  <div class="modal-footer">
			<button style="width:150px;color:white;border-radius:0px" type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
			<button style="width:150px;color:white;border-radius:0px" type="button" class="btn btn-primary Pikachu">充值</button>
		  </div>
		  </form>
		</div>
	  </div>
</div>

<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.other-a{color:#0099FE !important;font-size:14px;line-height:37px}
	/*弹窗css*/
	.modal-header{background:#1b9d97;opacity:0.8}
	.modal-header h4{color:white;font-size:16px}
	.modal-body p{font-size:16px}
	.modal-body p > input{border:1px solid #666;height:30px}
	.modal-body p > img{width:150px;height:60px;border:1px solid #1b9d97}
	.flag-tr th{background-color:#F1F1F1;text-align:center;border:1px solid #F1F1F1 !important;font-size:14px}
	.flag2-tr td{text-align:center;font-size:14px;border:1px solid #F1F1F1 !important}
</style>
<script>
requirejs(["jquery"],function(){
		$(".Pikachu").click(function(){
			var url="exchangefest.do";
			var data={
					"logNum":$("#logNum").val()
				};
			$.ajax({url:url,data:data,success:function(data){
						if(data=="true"){
							alert("兑换成功！！！");
							window.location.href="userfest.do";
						} else {
							alert("操作不规范，兑换失败！！！");
							window.location.href="userfest.do";		
						}
			        }
				});
		});
	});
</script>
</@layout>