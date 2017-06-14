<#include "fuwuqiFourConfig.ftl" >

<ul class="ul-fuwuqi">
	<li>
		<br/>
		<br/>
		<ul class="ban-fuwuqi">
			<#list Gallery as Ga>
				<#if Ga_index=0>
					<li style="display:block"><img src="${Ga.imgurl!""}" alt="" /></li>
				<#else>
					<li><img src="${Ga.imgurl!""}" alt="" /></li>
				</#if>
			</#list>
		</ul>
		<ol class="ban-head">
			<#list Gallery as Ga>
			
				<#if Ga_index=0>
				<li class="current"></li>
  				<#else>
  					<li></li>
  				</#if>
			</#list>
		</ol>
	</li>
	<li>
        <div class="produce_rc">
        	<form action="${BasePath}/cart/rightnow.do"  method="post" id="form_cl" autocomplete="off">
				<input type="hidden" name="goodsId" id="goodsId" value="${goods.id}">
            	<input type="hidden" name="orderCycle" id="orderCycle" value="0">
            	<input type="hidden" name="pay" id="pay" value="${goods.goodsPrice?default(0)}">
				<input type="hidden" name="config" id="config" value="该商品没有配置参数">
				<input type="hidden" name="isIdc" id="isIdc" value="2">
				<input type="hidden" name="ipnum" id="ipnum" value="0">
				<input type="hidden" name="ipflag" id="ipflag" value="0">
				<input type="hidden" name="idlink" id="id" value="Cha">
            	<input type="hidden" name="price" id="price" value="${goods.goodsPrice?default(0)}">
            	<input type="hidden" name="trustarea" id="trustarea" value="0">
            	<input type="hidden" name="gssy" value="0" id="gssy">
            	<input type="hidden" name="centerid" value="0" id="centerid">

	      		<h3 style="margin-top:31px;font-size:20px;margin-bottom:0px">${goods.goodsName}</h3>
	      		<span style="color:#1b9d97">
	      			${goods.secondTitle!""}
	      		</span>
	      		<div class="r230_jiage" style="margin-top:-22px">
	                <div class="r230jg_l"> 
	               		<span class="r230_j">商城价：</span>
	               		<span class="r230_g sc C">${goods.goodsPrice!""}￥</span>
	               		&nbsp;&nbsp;&nbsp;&nbsp;
	               		<span class="jiangjiatongzhi">降价通知</span>
	               		<div class="r20_duibi" style="margin-left:160px;margin-top:7px;"><a class="duibi" href="javascript:;"><span class="guanzhu_tianj" ></span><em class="guanzhu_1">关注</em></a></div>
	               	</div>
	            </div>
	            <br/>
	          	<ul class="ul-left">
					<#list mapp?keys as val>
							<li>
							<p class="left-p">${val}：</p>
								<ul class="ul-left${val_index}">
									<#list mapp[val] as v>
										<li><button type="button" class="btn btn-default" value="${v.price}" id="${v.id}">${v.title!""}</button></li>
									</#list>
								</ul>
							</li>
					</#list>
				</ul>
            
            <ul class="P_price" style="display:none">
      		</ul>
			<ul class="P_id" style="display:none">
			</ul>
			 
            <p class="left-p">总价：</p>
            <p class="left-p left-p2" id="allprice">999</p>
            <br/>
            <p class="left-p">数量：</p>
            <div class="gw_num">
                <em class="jian" onclick="goods_cut();getAll()">-</em>
                <input type="text" name="number" id="number" value="1" class="num" readonly="readonly"/>
                <em class="add" onclick="goods_add();getAll()">+</em>
            </div>
            </form>         
            <br/>
            <br/>
            <div class="radio">
             <span class="buy-way"> 购买方式：&nbsp;</span>
			  <label id="qk">
			    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>&nbsp;全额支付</label>
			  &nbsp;
			  <label id="fq">
			    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1" >&nbsp;河马赊账</label>
			</div>
			<div id="yueg" style="margin-top:5px">
				<span style="margin-left:18px;">九河网为您提供“先提货，后付款”的信赊服务；</span><br/>
				<span style="margin-left:18px;">使用该服务需要通过河马赊账申请。</span><br/>
	        </div>	    
        	<div class="fukuan" style="position:relative;left:11px">
        	<#if user ??>
               <input type="button" id="ljgm" name="submit" value="立即购买" class="fuk1" onclick="User.submit()"/>
               <input type="button" id="gwc"  value="加入购物车" onclick="User.addCart()" class="fuk2" />
            <#else>   
               <input type="button" id="ljgm" value="立即购买" class="fuk1" onclick="User.noLogin()"/>
               <input type="button" id="gwc"  value="加入购物车" onclick="User.noLogin()" class="fuk2" />
            </#if>
               	<a href="${BasePath}/about/jinrong.do" target="_blank" id="sz" style="font-size:13px;">了解河马赊账>>></a>
            </div>
      	</div>	
	</li>
</ul>
<br/>
<br/>
<br/>