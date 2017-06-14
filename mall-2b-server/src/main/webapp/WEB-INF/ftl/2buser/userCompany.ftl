<#include "../layout.b2b.ftl">
<#assign active='u4'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/authentication/show.do">企业认证</a></li>
</#macro>
<#macro script>
requirejs(['jquery','usera'],function(){
	
	$("#cardp1").click(function(){
		$("#notea").val("cardp1");
	})
	
	$("#preview").click(function(){
		$("#notea").val("cardp3");
	})
	
	$("#cardp2").click(function(){
		$("#notea").val("cardp2");
	})
	
  
   $("#sub").click(function(){
   			var phone = /^1[34578]\d{9}$/;
   			var idCard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
   			var name = $("#name").val();
   			var licenceNo = $("#licenceNo").val();
   			var licencePhoto = $("#licencePhoto").val();
   			var bossName = $("#bossName").val();
   			var endTime = $("#endTime").val();
   			var cardPhoto1 = $("#cardPhoto1").val();
   			var cardPhoto2 = $("#cardPhoto2").val();
   			
   			if(!name || name==''){
   			    $("#name").focus();
   				return;
   			}
   			
   			if(!licenceNo || licenceNo==''){
   			    $("#licenceNo").focus();
   				return;
   			}
   			<#--
   			if(!regAddress || regAddress==''){
				$("#regAddress").focus();
				return;
			} 
			-->
		
   			if(!licencePhoto || licencePhoto==''){
   			
   				layer.alertEx({content: "请选择文件", icon: "info", end: function() { }});
   				return;
   			}
   			if(!bossName || bossName==''){
   				$("#bossName").focus();
   				return;
   			}
   			if(!idCard.test($("#idCard").val())){
   				$("#idCard").focus();
   				return;
   			}
   			if(!endTime || endTime==''){
   			    $("#endTime").focus();
   				return;
   			}
   			if(!phone.test($("#phone").val())){
   				$("#phone").focus();
   				return;
   			}
   			if(!cardPhoto1 || cardPhoto1==''){
   				layer.alertEx({content: "请选择身份证附件正面", icon: "info", end: function() { }});
   				return;
   			}
   			if(!cardPhoto2 || cardPhoto2==''){
   				layer.alertEx({content: "请选择身份证附件反面", icon: "info", end: function() { }});
   				return;
   			}
   			
   			$("#submitFm").modal();
   })
   $("#submitA").click(function(){
   		fm.submit(); 	
   })
   $(".at").each(function(){
   		var att = $("#att").val();
   		if(att=='代理人'){
   		 $("#authenticator2").attr("checked","checked");
   		}else if(att=='法定代表人'){
   		 $("#authenticator1").attr("checked","checked");
   		}
   })
})
</#macro>
<@layout>
   
  <link rel="stylesheet" href="${BasePath}/scripts/custom/need/laydate.css" />
  <link rel="stylesheet" href="${BasePath}/css/usera.css" />
  <script type="text/javascript" src="${BasePath}/scripts/custom/laydate.js"></script>	
	<h2 class="bg-white">企业认证</h2>
	<div class="bg-white other-body" style="padding-bottom:30px;">	
	  <#if (state==-1 || state==2)>
	  <div class="" style="margin-left:30px;padding-top:31px;">
	  <div class="row">
	  <div class="col-md-9">
	  <img src="${BasePath}/images/2buser/u230.png">
	  <span style="margin-left:10px;font-size:15px;">
	  <#if state==-1>
	       你目前还不是企业会员，请按照以下流程进行认证
	       <#else>
	         <font id="ti" style="font-size:15px;">您的提交的资料没有通过我们的审核，请仔细核对您的信息</font>
	           </#if>
	       </span>
	  </div>
	  </div>
	  <p style="margin-top:41px;">企业认证流程</p>
		  <div class="row">
			  <div class="col-md-7">
			  <img src="${BasePath}/images/2buser/u142.png" style="width:780px;">
			  </div>
		  </div>  
	  </div>
	  
	  <iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
		<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
			<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
			<input type="file" name="file" id="uploadfile" multiple onchange="preview(this)"  />
		</form>
	  <form id="fm" class="form-horizontal" action="${BasePath}/authentication/save.do" method="post" enctype="multipart/form-data" role="form" style="padding-top:30px;margin-left:45px;">
	  <h4 style="font-weight:bold;padding-bottom:10px;">一、企业资料信息</h4>
	   <div class="form-group">
		    <label  for="name" class="col-sm-2 control-label">企业全称</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.name!""}" name="name" id="name" data-minlength="6" />
		    </div>
		    <font class="green">*</font>
		    <label  class="control-label">请填写工商营业执照上的企业全称。</label>
		  </div>
		  
		  <div class="form-group">
		   <label  for="licenceNo" class="col-sm-2 control-label" >营业执照代码</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.licenceNo!""}" name="licenceNo" id="licenceNo" >
		    </div>
		    <font class="green">*</font>
		    <label  class="control-label">若已办理三证合一，请填写对应证件上的18位统一信用代码。</label>
		  </div>
		  <#--
		  <div class="form-group">
		   <label  for="regAddress" class="col-sm-2 control-label">企业注册地址</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.regAddress!""}" name="regAddress" id="regAddress">
		    </div>
		     <label class="green control-label">*</label> 
		  </div>
		  -->
		   <div class="form-group">
		    <label  class="col-sm-2 control-label">营业执照扫描件副本</label>
		    <div class="col-sm-3">
		    <div id="preview" onclick="document.getElementById('uploadfile').click()">
		    <#if state==2>
		    <img style="width:200px;height:200px" src="${authentication.licencePhoto!''}">
		    	<#else>
		    <img style="width:200px;height:200px" src="${BasePath}/images/2buser/u168.png">
		    </#if>
		    </div>  
		     <input type="hidden"  value="${authentication.licencePhoto!''}"  id="licencePhoto" name="licencePhoto">
		     <#--
		     <button type="button"  id="cardp3" onclick="document.getElementById('uploadfile').click()" class="btn btn-primary btn-xs">选择文件</button>
		   	-->
		    </div>
		    <div class="col-sm-6" style="bottom:0; margin-left:8px;">
		    <font class="green">*</font>
		  	<p style="margin-top:80px;">证件要求：</p>
			<p>• 必须上传清晰彩色原件扫描件，图片大小不超过2M</p>
			<p>• 必须在有效期内且年检章齐全（当年成立的公司可无年检章）</p>
			<p>• 必须为中国大陆工商管理局颁发</p>
		    </div>
		  </div>
		  
		   <h4 style="font-weight:bold;padding-bottom:10px;">二、法定代表人信息</h4>
		   
		   <div class="form-group">
		   <label  for="bossName" class="col-sm-2 control-label">法人姓名</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.bossName!""}" name="bossName" id="bossName" >
		    </div>
		     <label class="green control-label">*</label> 
		  </div>
		   <div class="form-group">
		   <label  for="idCard" class="col-sm-2 control-label">身份证号码</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.idCard!""}" name="idCard" id="idCard" >
		    </div>
		    <font class="green">*</font>
		    <label  class="control-label">请填写真实的身份证号码，身份证号码是15或18位数字。</label>
		  
		  </div>
		  
		   <div class="form-group">
		   <label  for="cardp" class="col-sm-2 control-label">身份证照片上传</label>
		    <div class="col-sm-2 zen">
		    		<div class="cardp1" id="cardp1" onclick="document.getElementById('uploadfile').click()" >
		    			<#if state==2 >
		    				<img src="${authentication.cardPhoto1!''}" class="cardpp"/>
		    			<#else>
		    				<img src="${BasePath}/images/2buser/u206.png" class="cardpp"/>
		    			</#if>
		    		</div>
		      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>正面</span>
		    </div>
		    <input type="hidden" name="cardPhoto1" value="${authentication.cardPhoto1!""}"  id="cardPhoto1" style="border:1px solid"/>	
		    <div class="col-sm-2 fan">
		    		<div class="cardp1" id="cardp2" onclick="document.getElementById('uploadfile').click()" >
		    			<#if state==2 >
		    				<img src="${authentication.cardPhoto2!''}" class="cardpp"/>
		    			<#else>
		    				<img src="${BasePath}/images/2buser/u206.png" class="cardpp"/>
		    			</#if>
		    		</div>
		      		&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;<span>反面</span>
		      		<input type="hidden"  value="${authentication.cardPhoto2!""}" name="cardPhoto2" id="cardPhoto2" style="border:1px solid" />
		      		<input type="hidden" name="notea" id="notea" style="border:1px solid"/>
		    </div>
		     		  
		  </div>
		  
		  <div class="form-group">
		   <label  for="endTime" class="col-sm-2 control-label">身份证有效期</label>
		    <div class="col-sm-4">
		      <input name="endTime" id="endTime" value="${(authentication.exceed?string("yyyy-MM-dd"))!}" class="form-control"  onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
		    </div>
		    <label class="green" class="control-label">*</label>
		  </div>
		  <div class="form-group">
		   <label  for="idCard" class="col-sm-2 control-label">填写人身份</label>
		    <div class="col-sm-4">
		    
		      <label class="radio-inline">
		          <input type="hidden" id="att" value="${authentication.authenticator!""}"/>
				  <input type="radio" name="authenticator" class="at"  id="authenticator1" value="法定代表人">法定代表人
			  </label>
			  <label class="radio-inline">
				  <input type="radio" name="authenticator" class="at" id="authenticator2" value="代理人">代理人
			  </label>
			  
		    </div>
		   
		  </div>
		  <div class="form-group">
		   <label  for="phone" class="col-sm-2 control-label">联系电话</label>
		    <div class="col-sm-4">
		      <input class="form-control" value="${authentication.phone!""}" name="phone" id="phone" >
		    </div>
		    <font class="green">*</font>
		      <label  class="control-label">请填写有效手机号码，我们会将审核结果以短信形式通知您。</label>
		  </div>
		  <div class="form-group">
		   <label  for="phone" class="col-sm-2 control-label"></label>
		    <div class="col-sm-4">
		      <button type="button" id="sub" class="btn btn-primary" style="width:100px">下一步</button>
		    </div>
		  </div>
		  
      </form>
		
    </div>
    <div class="modal fade" id="submitFm" >
    <div class="modal-dialog" style="width:350px">  
    <div class="modal-content message_align">  
      <div class="modal-header">  
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>  
        <h4 class="modal-title">提交提醒</h4>  
      </div>  
      <div class="modal-body">  
        <img src="${BasePath}/images/2buser/u248.png" style="margin-left:125px;" >
        <h3 style="margin-left:80px;">信息确认无误?</h3>
      </div>  
      <div class="modal-footer">  
         <button id="submitA" class="btn btn-success" data-dismiss="modal">确认提交</button> 
         <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-right:80px">上一步</button>    
      </div>  
    </div>
  </div>
</div>
<#elseif state==0>
<div style="margin-left:4px;padding-top:31px;padding-bottom:231px;">
	      <p >企业认证流程</p>
		  <div class="row">
			  <div class="col-md-7">
			  <img src="${BasePath}/images/2buser/324.png" style="width:780px;">
			  </div>
		  </div>  
		  <div class="row" style="margin-top:70px;margin-left:40px;">
				    <div class="col-md-2">
							<img src="${BasePath}/images/2buser/u313.png" />
					</div>
					<div class="col-md-8"  style="margin-left:-20px;margin-top:22px;">
					     <p style="font-size:17px;">您已成功提交企业认证资料，请耐心等待客服审核。</p>
					     <p>我们将会在两个工作日内完成审核，审核结果将发送至您的手机或邮箱，请注意查收。</p>	
					</div>	
		  </div>
</div>

</div>
<#elseif state==1>
<div class="" style="margin-left:30px;padding-top:31px;">
	  <div class="row">
	  <div class="col-md-3" style="padding-left:250px;" >
		<img src="${BasePath}/images/2buser/1222.png"/>
		</div>
		<div class="col-md-6" style="margin-left:20px;">
		<h4>您已通过企业认证！</h4>
		</div>
		</div>
		<form class="form-horizontal" role="form">
			  <div class="form-group" style="margin-left:82px;margin-top:30px;">
			    <label  class="col-sm-3 control-label" >企业全称&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.name}</label>
			    </div>
			  </div>
			  <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >营业执照/组织机构代码&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.licenceNo}</label>
			    </div>
			  </div>
			   <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >法定代表人姓名&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.bossName}</label>
			    </div>
			  </div>
			   <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >身份证号码&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.idCard}</label>
			    </div>
			  </div>
			   <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >证件有效期&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.exceed?date}</label>
			    </div>
			  </div>
			   <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >证件人身份&nbsp;：</label>
			    <div class="col-sm-4">
			      <label class="control-label" >${authentication.authenticator}</label>
			    </div>
			  </div>
			  <div class="form-group" style="margin-left:82px">
			    <label  class="col-sm-3 control-label" >上传营业执照扫描件副本&nbsp;：</label>
			    <div class="col-sm-4">
			      <div style="width:210px;height:210px ">
			      <img style="width:200px;height:200px" src="${authentication.licencePhoto}" />
			      </div>
			    </div>
			  </div>			  
			  </div>
			</div>
</#if>
<script>
		 window.fileupload_callback = window["fileupload_callback"] || function(data) {
			data = eval(data);
			if($("#notea").val()=='cardp1'){
				document.getElementById('cardPhoto1').value= data;
			}else if($("#notea").val()=='cardp2'){
				document.getElementById('cardPhoto2').value= data;
			}else if($("#notea").val()=='cardp3'){
				document.getElementById('licencePhoto').value= data;
			}
			
		}
	</script>
</@layout>

