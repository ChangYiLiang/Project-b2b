<div class="big-right">
	<ul class="right-top">
		<li class="right-top-left">
            <#if userImg ??>
                <img src="${userImg!''}">
            <#else>
				<#if user.gender ??>
	  				<#if user.gender == 1>
	  					<img src="${BasePath}/images/2buser/u117.png"/>
	  				<#else>
	  					<img src="${BasePath}/images/2buser/u121.png"/>
	  				</#if>
	 			</#if>
 			</#if>
		</li>
		<li class="right-top-left2">
			<p>${user.username}
				<#if vip==0 >
					&nbsp;&nbsp;<span class="grvip">个人会员</span>
				<#else>
					&nbsp;<img src="${BasePath}/images/2buser/u190.png" />&nbsp;<span class="qyvip">企业会员</span>
				</#if>
			</p>
			<#if vip==1>
				<p>${name!""}</p>
			</#if>
			<p>账户余额：${yue!'0.00'}元</p>
			<p>节操币：${fest?default(0)}个</p>
			<p>节操券：${size?default(0)}张【可用】</p>
			<p><a href="${BasePath}/controller/user/tomydata.do" style="color:#1b9d97;font-size:14px">修改个人信息></a></p>
		</li>
		<li class="right-top-left3">
			<p>绑定手机：${user.mobile?default("暂无")}</p>
			<p>绑定邮箱：${user.email?default("暂无")}</p>
		</li>
	</ul>
	<ul class="right-top2">
		<li>
			<div>
				<img src="${BasePath}/images/2buser/u140.png">
				<br/>
				<span style="font-size:18px">待支付的订单：${orderCount.notPayOrder! "0"}</span>
				<br/>
				<br/>
				<span><a style="font-size:14px" href="${BasePath}/controller/order/tomyorder.do?state=0">查看待支付订单></a></apan>
			</div>
		</li>
		<li>
			<div>
				<img src="${BasePath}/images/2buser/u146.png">
				<br/>
				<span style="font-size:18px">待收货的订单：${orderCount.receivingOrder! "0"}</span>
				<br/>
				<br/>
				<span><a style="font-size:14px" href="${BasePath}/controller/order/tomyorder.do?state=6">查看待收货的订单></a></apan>
			</div>
		</li>
		<li>
			<div>
				<img src="${BasePath}/images/2buser/u152.png">
				<br/>
				<span style="font-size:18px">待评价的订单：${orderCount.notCommentOrder! "0"}</span>
				<br/>
				<br/>
				<span><a style="font-size:14px" href="${BasePath}/controller/order/tomyorder.do?state=7&isComment=0">查看待评价的订单></a></apan>
			</div>
		</li>
		<li>
			<div>
				<img src="${BasePath}/images/2buser/u158.png">
				<br/>
				<span style="font-size:18px">关注的商品：${count1}</span>
				<br/>
				<br/>
				<span><a style="font-size:14px" href="${BasePath}/concern/list.do">查看关注的商品></a></apan>
			</div>
		</li>
	</ul>
</div>


<style>
	
	.right-top,.right-top2{width:890px;border-bottom:1px solid #ccc;height:260px;
				margin-left:30px}
	.right-top li,.right-top2 li{float:left;}
	.right-top-left{margin-top:60px;margin-bottom:30px}
	.right-top-left2{width:180px;height:120px;margin-top:30px;margin-bottom:30px;
					margin-left:50px}
	.right-top-left3{width:200px;height:120px;margin-top:30px;margin-bottom:30px;
					margin-left:50px;}
	.right-top2{height:500px;border-bottom:0px solid red}
	.right-top2 li{width:320px;height:180px;}
	.right-top2 li div{margin-top:60px}
	.right-top2 li div img{float:left}
	.right-top2 li div span{margin-left:20px;}
	.qyvip {color:#FFD700}
	.grvip {color:#1b9d97}
	.right-top-left img{width:120px;height: 120px; border-radius: 60px;}
</style>  