<#-- 业务类型 -->
<#macro type _type>
<#switch _type>
	<#case 0>服务器租用<#break>
	<#case 1>独立高防<#break>
	<#case 2>分布式高防<#break>
	<#case 3>托管业务	<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#-- 业务状态 -->
<#macro state _type>
<#switch _type>
	<#case 0>服务器租用<#break>
	<#case 1>独立高防<#break>
	<#case 2>分布式高防<#break>
	<#case 3>托管业务	<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#-- 订购周期: 1-小时、2-天，3-周、4-月付、5-季付、6-半年付、7-年付、8-2年付，9-3年付 -->
<#macro cycle _cycle>
<#switch _cycle>
	<#case 1>小时<#break>
	<#case 2>天<#break>
	<#case 3>周<#break>
	<#case 4>月付<#break>
	<#case 5>季付<#break>
	<#case 6>半年付<#break>
	<#case 7>年付<#break>
	<#case 8>2年付<#break>
	<#case 9>3年付<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#--0：等待安装，1：正常，3：已过期，4：机房取消-->
<#macro state _state>
<#switch _state>
	<#case 0>等待安装<#break>
	<#case 1>正常<#break>
	<#--<#case 2><#break>-->
	<#case 3>已过期<#break>
	<#case 4>机房取消<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#-- 托管规格: 1-1U 2-2U 4-4U 5-半机柜 0-全机柜 -->
<#macro trustSize _trustSize>
<#switch _trustSize>
	<#case 1>1U<#break>
	<#case 2>2U<#break>
	<#case 4>4U<#break>
	<#case 5>半机柜<#break>
	<#case 0>全机柜<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#--
<#macro dropdownlist source, name, textField, valueField, optionalText='', selectedValue=''>
<select name="${name}">
	<#if optionalText != ''>
	<option value="">${optionalText}</option>
	</#if>
	<#list source as item>
	<#if item[valueField] == selectedValue>
	<option selected value="${item[valueField]}">${item[textField]}</option>
	<#else>
	<option value="${item[valueField]}">${item[textField]}</option>
	</#if>
	</#list>
</select>
</#macro>
-->

<#-- 用户性别：1男0女 -->
<#macro gender _gender>
<#switch _gender>
	<#case 0>女<#break>
	<#case 1>男<#break>
	<#default>其他<#break>
</#switch>
</#macro>

<#-- 订单状态：订单状态 0-未支付 1-已支付 2-已退款 3-已取消 4-已过期 -->
<#macro orderstate _orderstate>
<#switch _orderstate>
	<#case 0>未支付<#break>
	<#case 1>已支付<#break>
	<#case 2>已退款<#break>
	<#case 3>已取消<#break>
	<#case 4>已过期<#break>
	<#case 5>已作废<#break>
	<#default>系统异常<#break>
</#switch>
</#macro>

<#macro iplistinfo iplist = [], mainip=''>
	<div class="row">
		<div class="col-md-11 col-md-offset-1">
			<#if (iplist?size == 0)>
				<p>没有绑定IP</p>
			<#else>
				<ul class="nav nav-pills nav-stacked">
					<#list iplist as ip>
					<li class="">
						<span>${ip}
						<#if ip == mainip!''>
							<strong class="text-success">&nbsp;&nbsp;&nbsp;主IP</strong>
						</#if>
						</span>
					</li>
					</#list>
				</ul>
			</#if>
		</div>
	</div>
</#macro>

<#macro businessinfo business = {}>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订单编号 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderId)!""}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">下单时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.stratDate?date)!'-'}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">开始时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.stratDate?date)!}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">到期时间</label>
			<div class="controls">
				<p class="form-control-static">${(business.endDate?date)!}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购金额 </label>
			<div class="controls">
				<p class="form-control-static">${(business.orderAmount)!' '}</p>
			</div>
		</div>

		<div class="form-group col-md-5">
			<label class="control-label col-md-6">状态</label>
			<div class="controls">
				<p class="form-control-static"><@com.state business.state/></p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">销售人员</label>
			<div class="controls">
				<p class="form-control-static">${(business.salesPersion)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">客服人员</label>
			<div class="controls">
				<p class="form-control-static">${(business.servicePersion)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">订购周期</label>
			<div class="controls">
				<p class="form-control-static">${(orderCycle)!" "}</p>
				<p class="hidden">${(orderCycle)!" "}</p>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6"></label>
			<div class="controls">
				<a href="toMyBusiRenew.do?id=${business.id}" class="btn btn-primary"> 续费</a>
			</div>
		</div>
	</div>
</#macro>

<#macro serverinfo assServer = {}>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">品牌</label>
			<div class="controls">
				<p class="form-control-static">${(assServer.brand)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">cpu数量</label>
			<div class="controls">
				<p class="form-control-static">${(assServer.cpuNo)!" "}</p>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">内置硬盘信息</label>
			<div class="controls">
				<p class="form-control-static">${(assServer.hdd)!" "}</p>
			</div>
		</div>
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">已使用硬盘插槽数</label>
			<div class="controls">
				<p class="form-control-static">${(server.hddUsed)!" "}</p>
			</div>
		</div>
		
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">硬盘插槽数</label>
			<div class="controls">
				<p class="form-control-static">${(server.hddCount)!" "}</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">内置内存信息</label>
			<div class="controls">
				<p class="form-control-static">${(assServer.ram)!" "}</p>
			</div>
		</div>
			<div class="form-group col-md-5">
			<label class="control-label col-md-6">已使用内存插槽数</label>
			<div class="controls">
				<p class="form-control-static">${(server.ramUsed)!" "}</p>
			</div>
		</div>
		
	</div>
	<div class="row">
		<div class="form-group col-md-5">
			<label class="control-label col-md-6">内存插槽数</label>
			<div class="controls">
				<p class="form-control-static">${(server.ramMax)!" "}</p>
			</div>
		</div>
	</div>
</#macro>



