<div class="modal fade" id="opendialog1">
    <div class="modal-dialog">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
		<h4 class="modal-title">发票信息</h4>
      </div>  
      <div class="modal-body"> 
        	 <div role="tablist" class="text-center">
					<span role="presentation"><a href="#putp" role="tab" data-toggle="tab" onclick="ptfp()" class="ptitle">普通发票</a></span>	
					<span role="presentation"><a href="#zzsp" role="tab" data-toggle="tab" onclick="zzfp()" id="zzfp" class="ptitle">增值税发票</a></span>
			 </div>
		  	<br>
		  	<hr/>
				  <div class="tab-content">
					  		<div class="tab-pane active" role="tabpanel" id="putp">
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>发票抬头：<span>
					  			 		
					  			 		<select id="fapiao" onchange="fapiaoc()">
					  			 			<option>个人发票</option>
					  			 			<option>单位发票</option>
					  			 		</select>
					  			 		<input type="hidden" id="fpcontent"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>单位名称：<span>
					  			 		
					  			 		<input class="bobo" id="namec"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span> 发票内容：<span>
					  			 		<div id="fpmx">
					  			 		<ul id="fpc">
											<li class="text-center fplist"><a href="javascript:;">明细</a></li>
											<li class="text-center fplist"><a href="javascript:;">办公用品</a></li>
											<li class="text-center fplist"><a href="javascript:;">电脑配件</a></li>
											<li class="text-center fplist"><a href="javascript:;">耗材</a></li>
										</ul>
					  			 		</div>
					  			 </div>
					  			
					  		</div>
				  		
					  		<div class="tab-pane" role="tabpanel" id="zzsp">
					  				
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>单位名称：<span>
					  			 		<input disabled id="companyName" class="zzp"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" style="margin-left:-2px">
					  			 		<span>纳税人识别码：<span>
					  			 		<input disabled id="lsNo" class="zzp" />
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>注册地址：<span>
					  			 		<input disabled id="addressp" class="zzp"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>注册电话：<span>
					  			 		<input  disabled id="phone" class="zzp"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>开户银行：<span>
					  			 		<input disabled id="bankName" class="zzp"/>
					  			 </div>
					  			 <br>
					  			 <div class="row fufu col-sm-offset-3" >
					  			 		<span>银行账户：<span>
					  			 		<input disabled id="bankNo" class="zzp"/>
					  			 		<input type="hidden" id="zzfpId"  value=""/>
					  			 </div>
					  			 <br>
					  		</div>
				  </div>
          
      </div>  
      
       <div class="modal-footer">  
      			 <button id="save"  onclick="save1()"  class="btn btn-success vv" data-dismiss="modal">保存</button>
		         <button id="save1" onclick="save()"  class="btn btn-success vv" data-dismiss="modal">保存</button> 
		         <button id="btnc"  class="btn btn-success vv" style="background:#ccc !important;border:1px solid #ccc" data-dismiss="modal">取消</button>     
	   </div> 
	     
    </div>
  </div>
</div>


<input id="BasePath" type="hidden" value="${BasePath!''}">

	<script>
	requirejs(['gopay','core'],function(){
		$("#save").hide();
		$("#namec").prop("disabled",true);
		$(".fplist").click(function(){
			$(".fplist").removeClass("lists");
			$(this).addClass("lists");
			$("#fpcontent").val($(this).children().html());
		})
		
	    var yunf = 0;
		$(".express").each(function(){
			yunf += parseFloat($(this).html());
		})
		$("#yunf").html(yunf.toFixed(2));
		$("#pay").html((parseFloat($("#sum").html())+yunf).toFixed(2));
		
		$("#zzfp").click(function(){
			 $.post("${BasePath}/cart/zzfp.do",{},function(data){
			 		if(data){
			 			$("#companyName").val(data.organization);
			 			$("#lsNo").val(data.userIdcode);
			 			$("#addressp").val(data.registAddress);
			 			$("#phone").val(data.registPhone);
			 			$("#bankName").val(data.bank);
			 			$("#bankNo").val(data.bankAccount);
			 			$("#zzfpId").val(data.id);
			 			$("#zzId").val(data.id);
			 		}else{
			 			layer.alertEx({content: "您还没有申请增值税发票!",icon: "info"});
			 		}
			 },'json')
		})
	})
	
	</script>	
