<div class="tit2">
            ${catname}整机订购
        </div>
        <div class="r230_con clearfix">
            <div class="r230_cl">
			<form action="${BasePath}/cart/rightnow.do"  method="post" id="form_cl" autocomplete="off">
				<input type="hidden" name="goodsId" id="goodsId" value="${goods.id}">
            	<input type="hidden" name="orderCycle" id="orderCycle" value="0">
 				<input type="hidden" name="number" id="number" value="1">
            	<input type="hidden" name="pay" id="pay">
				<input type="hidden" name="config" id="config">
				<input type="hidden" name="isIdc" id="isIdc" value="2">
				<input type="hidden" name="ipnum" id="ipnum" value="0">
				<input type="hidden" name="ipflag" id="ipflag" value="0">
				<input type="hidden" name="idlink" id="id">
            	<input type="hidden" name="price" id="price" value="${goods.goodsPrice?default(0)}">
            	<input type="hidden" name="trustarea" id="trustarea" value="0">
            	<input type="hidden" name="gssy" value="0" id="gssy">
            	<input type="hidden" name="centerid" value="0" id="centerid">
            	<div class="xinghao">
                    <span class="zuowen" style="position:relative;top:-22px">当前型号 :</span>
                    <div class="goodscat">
                    	<ul id="bibi">
		                    <#list goodscat as gc>
		                    	<li class="xinghao_in"><a href="${BasePath}/mall/${gc.id}.html">${gc.goodsName}</a></li>
		                    </#list>
	                    </ul>
                    </div>
                </div>
            	<ul class="P_box0">
            		<#list mapp?keys as val>
            			<li>
	            			<span class="P_m zuowen">${val} : </span>
	            			<select class="xuanze1" style="padding:0 0 0 15px">
		            			<#list mapp[val] as v>
		            				<option value="${v.price}" id="${v.id}">${v.title}</option>
		            			</#list>
	            			</select>
            			</li>
            		</#list>
            	</ul>
            	</form>
        </div>
      	<ul class="P_price" style="display:none">
      	</ul>
		<ul class="P_id" style="display:none">
		</ul> 
        <div class="r230_cr clearfix" style="width:450px">
            <div class="dangqianpz">当前所选配置</div>
            <div class="peizism M_right_box">
				<ul class="P_link M_wen">
				</ul>
			</div>
            <div class="r230_jiage">
                <div class="r230jg_l"> 
               		<span class="r230_j">商城价：</span>
               		<span class="r230_g">￥</span>
               		<span class="r230_g M_pay" id="scj"></span>
               		&nbsp;<span class="jiangjiatongzhi">降价通知</span>
               		<div class="r20_duibi" style="margin-left:160px;margin-top:7px;"><a class="duibi" href="javascript:;"><span class="guanzhu_tianj" ></span><em class="guanzhu_1">关注</em></a></div>
               		
               	</div>
               	
            </div>
            <#if goods.iftrust=1>
	            <div class="yjst">
	                <div class="yjst_1">硬件生态：免费1个月数据中心托管；</div>
	                <div class="yjzs_2">
	                    <div class="yjzs_dq">选择地区：</div>
	                    <br/>
	                    <br/>
	                    <div class="diqu_r diqu">
	                    	<#if goods.iftrust=1>
	                    		<input type="button" data="0" value="暂不托管" class="current mm" />
	                    		<br/>
	                    		<select class="pppp" id="datacenter" name="datacenter">
	                    				<option class="mm" value="0" data="0">-选择区域-</option>	
			                        <#list area as ar>
			                        	<option class="mm" value="${ar.id}" data="${ar.id}">${ar.name?default("")}</option>	
			                        </#list>
		                        </select>
		         
		                    <#else>
		                    	<input type="button" data="0" value="暂不托管" class="current mm" />
	                        </#if>
	                    </div>
	                </div>
	            </div>
            </#if>
            <br/>
            
            <div class="radio">
                                       购买方式：&nbsp;
			  <label id="qk">
			    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>&nbsp;全额支付</label>
			  &nbsp;
			  
			  <#if goods.iftrust=1>
					
			    <#else>
			    	<label id="fq">
			    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1" >&nbsp;河马赊账</label>
			    
			   </#if>
			</div>
			
				<div id="yueg">
				<span style="margin-left:12px;">九河网为您提供“先提货，后付款”的信赊服务；</span><br/>
				
				<span style="margin-left:12px;">使用该服务需要通过河马赊账申请。</span><br/>
				<#--
					<ul id="fenqi">
						<li class="xfqt">3期</li>
						<li class="xfqt">6期</li>
						<li class="xfqt">12期</li>
						<li class="xfqt">24期</li>
					</ul>
					  <br>
					<p id="fqyg">月供:<span class="fqyg">￥</span><font class="fqyg">300元</font></p>
					-->
	          </div>
	          
          <div id="quank">
				商城价:<span class="sc">￥</span><span class="sc" id="allprice"></span>          		
          </div>
            	<div class="fukuan">
            	<#if user ??>
                   <input type="button" id="ljgm" name="submit" value="立即购买" class="fuk1" onclick="User.submit()"/>
                   <#if goods.iftrust=1>             
                   		<input type="button" id="gwc"  value="咨询客服" onclick="ysf.open()" class="fuk2" />
                   		<!--
                   		<input type="hidden" id="gwc"  value="加入购物车" onclick="User.addCart()" class="fuk2" />
                   		-->
                   <#else>
                   		<input type="button" id="gwc"  value="加入购物车" onclick="User.addCart()" class="fuk2" />
                   </#if>
                <#else>   
                   <input type="button" id="ljgm" value="立即购买" class="fuk1" onclick="User.noLogin()"/>
                   <#if goods.iftrust=1>       
                   		<input type="button" id="gwc"  value="咨询客服" onclick="ysf.open()" class="fuk2" />
                   <#else>
                   		<input type="button" id="gwc"  value="加入购物车" onclick="User.addCart()" class="fuk2" />
                   </#if>
                </#if>
                   		<a href="${BasePath}/about/jinrong.do" target="_blank" id="sz" style="font-size:13px;">了解河马赊账>>></a>
                </div>