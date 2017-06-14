<#include "../layout.ftl">

<#macro scripts>
<script type="text/javascript" src="${BasePath}/scripts/custom/comment.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/zoomify.js"></script>
<script>
	jQuery(document).ready(function() {       
	   //App.init();
	   //Cl.initModal();
	   $(".example").zoomify();
	});
</script>
</#macro>

<@layout title="评价管理">
<link rel="stylesheet" type="text/css" href="${BasePath}/scripts/custom/zoomify.css" rel="stylesheet" type="text/css"/>

<div class="row">
	<div class="col-md-12">
		<!-- Begin: life time stats -->
		<div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-user"></i>评价管理
				</div>						
			</div>
			<div class="row">
				<div class="from-group col-md-12">
					<div class="from-group col-md-4">
					<span style="color:#DD143C; font-size: 40px;font-weight: bold;">${counts.commentDegree!''}%</span> <br/>
                     		<span>&nbsp;&nbsp;&nbsp;&nbsp;好评度</span>
					</div>
					<div class="from-group col-md-4">
					</div>
				</div>
			</div>
			
			<ul class="list-inline" style="background: #EDF2F2 none repeat scroll 0% 0%;padding: 10px 30px;margin-top: 30px">
                   <li><a href="${BasePath}/controller/comment/list.do?pageNo=1" style="color: #1B9D97">全部评价（${counts.allCount!''}）</a></li>
                   <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=2" style="color: #1B9D97">好评（${counts.positiveCount!''}）</a></li>
                   <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=1" style="color: #1B9D97">中评（${counts.mediumCount!''}）</a></li>
                   <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&overallComment=0" style="color: #1B9D97">差评（${counts.badCount!''}）</a></li>
                   <li><a href="${BasePath}/controller/comment/list.do?pageNo=1&&photo=true" style="color: #1B9D97">有图（${counts.photoCount!''}）</a></li>
               </ul>
			<div class="portlet-body">
				<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover" id="datatable_cl">
				<thead>
				<tr role="row" class="heading">
					<th width="8%">
						 综合评价
					</th>
					<th width="65%">
						 评价详情
					</th>
					<th width="10%">
						 所属用户
					</th>
					<th width="12%">
						 商品名称
					</th>
					<th width="5%">
						 操作
					</th>
				</tr>
				</thead>
				<tbody >
					<#list comments as comment>
					<tr>
						<td style="text-align:center;vertical-align:middle">
							<#list overallComment?keys as key>
							<#if key?eval == comment.overallComment>
								${overallComment[key]! ""} 
							</#if>	
							</#list> 
						</td>
						<td>
							<span class="com_connect">${comment.content! ""}</span><br>
							<span id="commentDate" style="color:#999">[${comment.commentDate?datetime }]</span><br>
							<#if comment.photos ??>
							<#list comment.photos as photo>
								<#if (photo!'')!=''>
								<br>
								<img class="example" style="width:100px ;height:100px" src="${photo}" />
								</#if>
							</#list><br>
							</#if>
							<#-- <#if comment.addContent ??>
								<br><span><span style="color:#999">[追加评论]:</span>&nbsp&nbsp${comment.addContent! ""}</span><br>
								<span id="commentDate" style="color:#999">[${comment.addCommentDate?datetime }]</span>
							</#if> -->
							<#if comment.replyContent ??>
								<br><span><span style="color:#999">[卖家回复]:</span>&nbsp&nbsp${comment.replyContent}</span><br>
								<span id="commentDate" style="color:#999">[${comment.replyDate?datetime }]</span>
							</#if>
						</td>
						<td style="text-align:center;vertical-align:middle">
							<span>V&nbsp${comment.userName! ""}</span>
						</td>
						<td style="text-align:center;vertical-align:middle">
							<#list goodsMap?keys as key>
								<#if key?eval == comment.goodsId>
									${goodsMap[key]! ""}
								</#if>
							</#list>
						</td>
						<td style="text-align:center;vertical-align:middle">
						<#if !comment.replyContent ??>
							<a href="${BasePath}/controller/comment/replyComment.do?id=${comment.id}&&page=${page.pageNo}" class="btn btn-primary" data-modal="true">回复</a><br><br>
						</#if>	
						<a href="${BasePath}/controller/comment/deleteComment.do?id=${comment.id}&&page=${page.pageNo}" class="btn btn-primary" data-modal="true">删除</a>
						</td>
					</tr>
					</#list>
				</tbody>
				</table>
				<nav>
				  <ul class="pagination">
				  	<#if page.pageNo != 1>
				  		<#if photo ??>
				  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&&photo=${(photo!'')?string}">&laquo;</a></li>
				  		<#else>
				  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&overallComment=${overComment!''}">&laquo;</a></li>
				  		</#if>
				  	<#else>
				  		<li class="disabled"><a>&laquo;</a></li>
				  	</#if>	
				    <#list 1..page.pageCount as i>
				   	 <#if page.pageNo == i>
				   	 	<li class="active"><a >${i}</a></li>
				   	 <#else>
				   	 	<#if photo ??>
				  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&photo=${(photo!'')?string}">&laquo;</a></li>
				  		<#else>
				   	 	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${i}&overallComment=${overComment!''}">${i}</a></li>
				  		</#if>
				   	 </#if>	
				    </#list>
				    <#if page.pageNo != page.pageCount>
				    	<#if photo ??>
				  		<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo -1}&&photo=${(photo!'')?string}">&laquo;</a></li>
				  		<#else>
				    	<li><a href="${BasePath}/controller/comment/list.do?pageNo=${page.pageNo +1}&overallComment=${overComment!''}">&raquo;</a></li>
				    	</#if>
				    <#else>
				    	<li class="disabled"><a>&raquo;</a></li>
				    </#if>
				  </ul>
			</nav>							
				</div>
			</div>
		</div>
		<!-- End: life time stats -->
	</div>
</div>
</@layout>