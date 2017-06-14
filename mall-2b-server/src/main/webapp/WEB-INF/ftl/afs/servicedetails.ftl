<#include "../layout.b2b.ftl">
<#assign active='s1'>
<#macro breadcrumb>
<li>个人中心</li>
<li>服务详情</li>
</#macro>
<@layout>
<div class="bg-top">
	<p class="top-p">服务详情</p>	
</div>
<div class="bg-white other-body" style="min-height: 865px; padding: 10px 40px;">
	<p style="font-size:16px;color:#1B9D97; padding:10px 0; margin: 0" class="pull-left">${(types[aftersale.type?string])!''}</p>
	<#if aftersale.state==0>
	<div class="pull-right">
		<button id="cancelButton" class="btn btn-primary" type="button" style="width: 130px; font-weight: normal">撤销申请</button>
	</div>
	</#if>
	<div class="clearfix"></div>
	<#if aftersale.state==6>
		<div style="border: 1px solid #ff9350; background-color: #f9e5db; padding: 20px;margin: 30px 0;">
		您已发起了撤销申请，如问题仍未解决，您可以重新发起申请或咨询在线客服；
		</div>
	<#else>
		<#if aftersale.refund??>
		<p style="font-size:14px;color:##eaf8ff;">
			<#if (aftersale.refund.refundMoney)??>
			申请退款金额：${aftersale.refund.refundMoney?string('0.00')}元
			</#if>
			
			<#if (aftersale.refund.confirmRefundMoney)??>
			确认退款金额：${aftersale.refund.confirmRefundMoney?string('0.00')}元
			</#if>
		</p>
		<#--
		<div style="border: 1px solid #ff9350; background-color: #f9e5db; padding: 10px; margin:30px 0;">
			<table border="0" style=" table-layout:fixed; width:100%;">
				<tr class="table-head">
	            	<td>退款明细</td>
	            	<td>金额(元)</td>
	            	<td>状态</td>
	         	</tr>
	         	<tr class="table-head">
	            	<td>退款到${"支付宝"}</td>
	            	<td>${(aftersale.refund.confirmRefundMoney?string('0.00'))!'未确认'}</td>
	            	<td>
	            		<#if !(aftersale.refund.confirmRefundTime)??>
	            			未确认
	            		<#elseif !(aftersale.refund.xxx)??>
	            			已确认退款
	            		<#elseif !(aftersale.refund.xxx)??>
	            			退款发放中
	            		<#elseif !(aftersale.refund.xxx)??>
	            			退款到账
	            		</#if>
	            	</td>
	        	</tr>
	         	<tr>
	            	<td>确认退款时间</td>
	            	<td>退款处理时间</td>
	            	<td>退款到账时间</td>
	        	</tr>
	        	<tr>
	            	<td>${(aftersale.refund.confirmRefundTime?string('MM月dd日 HH点mm分'))!'未处理'}</td>
	            	<td>${(aftersale.refund.confirmRefundTime?string('MM月dd日 HH点mm分'))!'未处理'}</td>
	            	<td>${(aftersale.refund.confirmRefundTime?string('MM月dd日 HH点mm分'))!'未处理'}</td>
	        	</tr>
	      	</table>
		</div>
		-->
		</#if>
	</#if>
    <div style="margin-top: 10px;">
    	<#list records as record>
    	<div class="status">
        	<div class="s-img">
        		<#if (record.userId)??>
        			<#if user.gender ??>
		  				<#if user.gender == 1>
		  					<img src="${BasePath}/images/2buser/u117.png"/>
		  				<#else>
		  					<img src="${BasePath}/images/2buser/u121.png"/>
		  				</#if>
		 			</#if>
        		<#else>
        			<img src="${BasePath}/images/9helogo.png"/>
        		</#if>
        	</div>
        	<div class="s-txt">
          		<p>
          			<#if record.userId??>
          			${user.username!''} - 买家
          			<#else>
          			九河网 - 卖家 
          			</#if>
          			${record.createTime?string('yyyy-MM-dd HH:mm:ss')}
          		</p>
          		<p>${record.details!''}</p>
        	</div>
    	</div>
    	</#list>
	</div>
</div>

<style>
	.bg-top,.bg-body{background:#fff;margin-left:0px;width:950px}
	.top-p{font-size:20px;color:#666;font-weight:bold;line-height:64px;padding-left:50px}
	
	table td{ padding: 5px 40px;font-weight: bold; }

	table tr.table-head td{ color: #323232; font-size: 20px; font-weight: bold; padding: 20px 40px; }
	
	.status{ border-top: 1px solid #bbb; border-bottom: 1px solid #bbb;  padding: 15px 0; overflow: hidden; margin-top: -1px; }
	.status .s-img{ margin-right:15px; float: left;  }
	.status .s-img img{ width: 60px; height: 60px; border-radius: 50%;}
	.status .s-txt{  float: left; }
	.status .s-txt p{font-size:14px;  }
</style>
</@layout>

<#macro scripts>
<script>
require(['layerEx'], function () {
	$("#cancelButton").click(function() {
		layer.confirmEx({content: "是否撤销改申请?", yes: function () {
			$.post('cancel.do?id=${aftersale.id}', function() {
				layer.closeAll();
				layer.alertEx({content: "您的申请已撤销", end: function() {
					location.reload();
				}});
			});
		}});
	});
});
</script>
</#macro>