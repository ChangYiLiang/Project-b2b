<#include "../layout.ftl">
<@layout title="赊账订单">
	<div class="text-right" id="searchForm">
		<form class="form-inline" role="form">
			<div class="form-group">
				<select name="contractStatus" id="contractStatus" class="form-control">
					<option value="">--- 合同生效 ---</option>
					<option value="0">没生效</option>
					<option value="0">已生效</option>
				</select>
			</div>
		
			<div class="form-group">
				<input type="text" class="form-control" id="userId" name="userId" placeholder="用户编号">
			</div>
		  	<button type="submit" class="btn btn-primary">查找</button>
		</form>
	</div>
	<table class="table table-striped table-bordered table-hover" id="examineTable" data-table-ajax-source="contractList.do" data-table-search-form="#searchForm">
		<tr class="columns" style="display: none">
			<th data-title="合同编号" data-prop="contractNum" data-default="1" />
			<th data-title="用户ID" data-prop="userId" />
			<th data-title="用户签署时间" data-prop="userTime" />
			<th data-title="平台签署时间" data-prop="b2bTime" />
        	<th data-title="合同生效">
        		{{ contractStatus == 0 ? "没生效" : "" }}
			    {{ contractStatus == 1 ? "已生效" : "" }}
        	</th>
        	<th data-title="合同类型">
        		{{ contractType == 0 ? "自签署" : "" }}
        		{{ contractType == 1 ? "手写" : "" }}
        		{{ contractType == 2 ? "短信签署" : "" }}
        	</th>
        	<th data-title="操作" data-width="200px">
        		<a href='signContract.do?contractType={{contractType}}&contractNum={{contractNum}}' class="btn btn-primary"  >签署合同</a>
        		<a href="search.do?contractNum={{contractNum}}" class="btn btn-primary" target="_blank" >合同查看</a>
				<a href="download.do?contractNum={{contractNum}}" class="btn btn-primary" target="_blank" >合同下载</a>
			</th>
		</tr>
	</table>
	
</@layout>

<script>
		
</script>