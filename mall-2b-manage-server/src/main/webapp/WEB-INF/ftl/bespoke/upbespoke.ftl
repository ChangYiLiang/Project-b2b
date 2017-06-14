<#include "../layout.ftl">

<#macro scripts>
	<script src="${BasePath}/scripts/custom/2bjs/jquery-1.9.1.min.js"></script>
	<script>
		$(function(){
			$(".submit").click(function(){
				var url="shenhepoke.do";
				var data={
						"id":$("#id").val(),
						"tecperson":$("#tecperson").val(),
						"pay":$("#pay").val(),
						"submitFlag":2
					};
				$.ajax({url:url,type:"post",data,success:function(data){
							if(data=="success"){
								alert("确认成功！！");
								window.location.href="bespokelog.do";
							} else {
								alert("确认失败！请联系技术员");
								window.location.href="bespokelog.do";		
							}
				        }
					});
			});
		});
	</script>
</#macro>

<@layout title="预约上门确认">
	<br/>
	<br/>
	<style>
		.form-control{display:inline-block;width:300px}
		#form_cl ul li span{font-size:14px}
	</style>
	<form action="#" id="form_cl">
		<input type="hidden" name="id" id="id" value="${list.id}">
	  	<ul class="list-group">
			<li class="list-group-item">
					<span>联系人：</span>
					<input type="text" class="form-control" name="person" id="person" value="${list.person!""}" disabled>
			</li>
			<li class="list-group-item">
					<span>联系电话：</span>
					<input type="text" class="form-control" name="mobile" id="mobile" value="${list.mobile!""}" disabled>
			</li>
			<li class="list-group-item">
					<span>预约日期：</span>
					<input type="text" class="form-control" name="listDate" id="listDate" value="${list.bespokeDate?datetime}" disabled required>
			</li>
			<li class="list-group-item">
					<span>需求内容：</span>
					<textarea name="goodsDesc" id="goodsDesc" class="form-control" rows="3" disabled>${list.pokedesc!""}</textarea>
			</li>
			<li class="list-group-item">
					<span>预约工程师：</span>
					<input type="text" class="form-control" name="tecperson" id="tecperson" value="${list.tecpsrson!""}" required>
			</li>
			<li class="list-group-item">
					<span>预约费用：</span>
					<input type="text" class="form-control" name="pay" id="pay" value="${list.pay!""}" required>
			</li>
			<li class="list-group-item">
					<button type="button" class="btn btn-primary submit">确认预约成功</button>
			</li>
		</ul>
	</form>
</@layout>