<#include "../layout.b2b.ftl">
<#assign active='b3'>
<#macro breadcrumb>
<li>个人中心</li>
<li>节操券</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">我的节操券</p>	
</div>
<div class="bg-white other-body" style="min-height: 865px; padding: 10px 40px;">
	<ul class="nav nav-pills nav-other" style="margin-left:-4px" role="tablist">
		<li role="presentation" class="active"><a href="#cha1" role="tab" data-toggle="tab">未使用的节操券</a></li>
		<li role="presentation"><a href="#cha2" role="tab" data-toggle="tab">已使用的节操券</a></li>
		<li style="border-right:0px solid red" role="presentation"><a href="#cha3" role="tab" data-toggle="tab">已过期的节操券</a></li>
	</ul>
	<hr class="bonus-hr"/>
	<div class="tab-content">
	  	<div role="tabpanel" class="tab-pane active" id="cha1">
	  		<ul class="tab-body">
		  		<#list BonusOne as one>
		  		<li>
		  			<div class="tab2-divone">
		  				<br/>
		  				<p><span style="position:relative;top:-12px;font-size:18px">￥</span><span style="font-size:35px">&nbsp;${one.typeMoney?default(0)}</span></p>
		  				<p><span style="color:yellow;font-size:18px">${one.typeName}</span><span style="font-size:18px">【满${one.minAmount?default(0)}可用】</span></p>
		  			</div>
		  			<div class="tab2-divone other-divone" style="background-color:rgba(245, 245, 245, 1)">
		  				<br/>
		  				<p>限品类：限购【服务器】类商品</p>
		  				<p style="margin-left:-85px">限品台：全平台</p>
		  				<p style="margin-left:14px">时间：${one.startDate?substring(0,10)}—${one.endDate?substring(0,10)}</p>
		  				<p class="p-flag">立即使用</p>
		  			</div>
		  		</li>
		  		</#list>
	  		</ul>
	  	</div>
	  	<div role="tabpanel" class="tab-pane" id="cha2">
	  		<ul class="tab-body">
		  		<#list BonusTwo as Two>
		  		<li>
		  			<div class="tab2-divone" style="background-color:#999999">
		  				<br/>
		  				<p><span style="position:relative;top:-12px;font-size:18px">￥</span><span style="font-size:35px">&nbsp;${Two.typeMoney?default(0)}</span></p>
		  				<p><span style="color:yellow;font-size:18px">${Two.typeName}</span><span style="font-size:18px">【满${Two.minAmount?default(0)}可用】</span></p>
		  			</div>
		  			<div class="tab2-divone other-divone" style="background-color:#F9F9F9">
		  				<br/>
		  				<p>限品类：限购【服务器】类商品</p>
		  				<p style="margin-left:-85px">限品台：全平台</p>
		  				<p style="margin-left:14px">时间：${Two.startDate?substring(0,10)}—${Two.endDate?substring(0,10)}</p>
		  				<img style="margin-left:160px;margin-top:35px" src="${BasePath}/images/2buser/jj.PNG">
		  			</div>
		  		</li>
		  		</#list>
	  		</ul>
	  	</div>
	  	<div role="tabpanel" class="tab-pane" id="cha3">
	  		<ul class="tab-body">
		  		<#list BonusThree as Three>
		  		<li>
		  			<div class="tab2-divone" style="background-color:#999999">
		  				<br/>
		  				<p><span style="position:relative;top:-12px;font-size:18px">￥</span><span style="font-size:35px">&nbsp;${Three.typeMoney?default(0)}</span></p>
		  				<p><span style="color:yellow;font-size:18px">${Three.typeName}</span><span style="font-size:18px">【满${Three.minAmount?default(0)}可用】</span></p>
		  			</div>
		  			<div class="tab2-divone other-divone" style="background-color:#F9F9F9">
		  				<br/>
		  				<p>限品类：限购【服务器】类商品</p>
		  				<p style="margin-left:-85px">限品台：全平台</p>
		  				<p style="margin-left:14px">时间：${Three.startDate?substring(0,10)}—${Three.endDate?substring(0,10)}</p>
		  				<img style="margin-left:160px;margin-top:35px" src="${BasePath}/images/2buser/kk.PNG">
		  			</div>
		  		</li>
		  		</#list>
	  		</ul>
	  	</div>
	</div>
</div>
<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	.tab-pane {margin-left:13px}
	.tab-body > li{height:362px;width:240px;display:inline-block;
				margin-right:42px;margin-bottom:20px}
	.tab2-divone{width:100%;height:140px;background-color:#93d9d6}
	.tab2-divone p{text-align:center}
	.tab2-divone p span{color:white;font-size:14px}
	.other-divone {height:220px}
	.p-flag{width:160px;height:40px;background-color:white;
			border:1px solid #1b9d97;
			color:#1b9d97;border-radius:40px;font-size:14px;line-height:40px;margin-left:41px;margin-top:57px}
	.p-flag a{font-size:14px;}
</style>
<!--
<script>
requirejs(['jquery'], function(){
		$(".getbonus").click(function(){
			var url="adduserbonus.do";
			var data={
					"bonusId":$(this).attr("data")
				};
			$.ajax({url:url,data,success:function(data){
						if(data=="true"){
							alert("领取成功！！！");
							window.location.href="userbonus.do";
						} else {
							alert("您已领取过了，不能再领取了！！！");
							window.location.href="userbonus.do";		
						}
			        }
				});
		});
	});
</script>
-->
</@layout>