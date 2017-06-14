<ul class="ul-fuwuqi">
            		<li>
            			<br/>
            			<br/>
            			<!--
            			<ul class="ban-fuwuqi">
		      				<li style="display:block"><img src="${BasePath}/images/2babout/about_banner1.png" alt="" /></li>
		      				<li><img src="${BasePath}/images/2babout/about_banner2.png" alt="" /></li>
		      				<li><img src="${BasePath}/images/2babout/about_banner3.png" alt="" /></li>
      					</ul>
		      			<ol class="ban-head">
		      				<li class="current"></li>
		      				<li></li>
		      				<li></li>
		      			</ol>
		      			-->
		      			
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
				      		<h4>${goods.goodsName}</h4>
				      		<p class="produce_p1">
				      			${goods.secondTitle!""}
				      		</p>
				      		<p class="produce_p2">
				      			【创新融合存储，将全闪存存储性能发挥到极致！】
				      		</p>
				      		<div class="produce_bottom">
				      			<ul class="clearfix">
				      				<li class="advantage_1">项目设计</li>
				      				<li class="advantage_2">+</li>
				      				<li class="advantage_1">河马赊账</li>
				      				<li class="advantage_2">+</li>
				      				<li class="advantage_1">技术顾问</li>
				      			</ul>
				      			<button class="consult_btn consult_btn1">
				      				咨询报价
				      			</button>
				      			<#if user ??>
									<button class="chacha consult_btn">
					                                                            创建订单
					                </button>
								<#else>
									<button class="consult_btn" onclick="location='${BasePath}/i9he/login.do';return false;">创建订单</button>
								</#if>  
				      		</div>
			      		</div>
		      		</li>
	      		</ul>
	      		<br/>
	      		<br/>
	      		<br/>