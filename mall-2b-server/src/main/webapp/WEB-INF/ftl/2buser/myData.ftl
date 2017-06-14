<#include "../layout.b2b.ftl">
<#assign active='u1'>
<#macro breadcrumb>
<li><a href="${BasePath}/controller/toUserCenter.do">个人中心</a></li>
<li><a href="${BasePath}/controller/user/tomydata.do">个人信息</a></li>
</#macro>
<#macro script>
requirejs(['user2b']);
</#macro>

<@layout>
 <script type="text/javascript" src="${BasePath}/scripts/custom/laydate.js"></script>
<style>
lable{font-size:14px;}
.userImg img{width:120px;height: 120px; border-radius: 60px;margin-top:150px;} 
.userImg .modify{margin-left: 45px; cursor:pointer; display:none;}
</style>
<h2 class="bg-white">个人信息</h2>
<div class="bg-white other-body" style="min-height: 865px">
<div class="col-md-12">
		<iframe src="" class="hidden" frameborder="0" name="upload"></iframe>
		<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data">
			<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
			<input type="file" name="file" id="uploadfile" onchange="document.getElementById('uploadform').submit()" />
		</form>
  		<div role="tabpanel" class="tab-pane" id="mydataModify">
  			  <div class="row">
  			  <form action="" class="form-horizontal" id="myDataModify_from" method="post">
  				<div class="col-md-2 userImg">
  				<#if userExpand ??>
  					<#if userExpand.userImg ??>
  						<img class="img" src="${userExpand.userImg!''}" alt="头像"/>
  						<p></p>
  						<span class="modify green" onclick="document.getElementById('uploadfile').click()">修改</span>
  					<#else>
  						<#if user.gender ??>
  							<#if user.gender == 1>
  								<img class="img" src="${BasePath}/images/2buser/u117.png"/>
  							<#else>
  								<img class="img" src="${BasePath}/images/2buser/u121.png"/>
  						</#if>
  					</#if>
  					<p></p>
  					<span class="modify green" onclick="document.getElementById('uploadfile').click()">修改</span>	
  					</#if>
  				<#else>
  					<#if user.gender ??>
  						<#if user.gender == 1>
  						<img class="img" src="${BasePath}/images/2buser/u117.png"/>
  						<#else>
  							<img class="img" src="${BasePath}/images/2buser/u121.png"/>
  						</#if>
  					</#if>
  					<p></p>
  					<span class="modify green" onclick="document.getElementById('uploadfile').click()">修改</span>
  				</#if>
  				</div>
  				<div class="col-md-1"></div>
  				<div class="col-md-9">
  					<div class="form-group">
  						<h4 style="color: #999; border-bottom: 1px solid #999; padding-bottom: 20px">基本资料</h4>
					</div>
					
  					<div class="row form-group">
						<label class="control-label col-md-2">用户名：</label>
						<div class="col-md-5 control">
							<p class="form-control-static" name="userName">${(user.username)!""}</p>
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">昵称：</label>
						<div class="col-md-5 control">
							<div class="form-control-static p-nickName">${(user.nickName)!''}</div>
							<input  class="form-control hidden p-nickName" name="nickName" id="nickName" value="${(user.nickName)!''}">
						</div>
						<div class="col-md-2">
							<div class="form-control-static" >
								<a href="javascript:;" class="p-nickName" style="color:#1B9D97" onclick="$('.p-nickName').toggleClass('hidden')"><#if user.nickName=="">设置<#else>修改</#if></a>
							</div>
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">性别：</label>
						<div class="col-md-5 control">
							<span class="form-control-static" name="gender"></span>
							<div class="btn-group" data-toggle="buttons">
								<#if user.gender ??>
								<#if user.gender == 1>
								<label class="btn btn-default active">
									<input type="radio" name="gender" value="1" id="option1" autocomplete="off" checked> 男
								</label>
								<label class="btn btn-default">
									<input type="radio" name="gender" value="0" id="option2" autocomplete="off"> 女
								</label>
								<#else>
								<label class="btn btn-default">
									<input type="radio" name="gender" value="1" id="option1" autocomplete="off" checked> 男
								</label>
								<label class="btn btn-default active">
									<input type="radio" name="gender" value="0" id="option2" autocomplete="off"> 女
								</label>
								</#if>
								</#if>
							</div>
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">生日：</label>
						<div class="col-md-5 control">
							<#if userExpand??>
									<div class="form-control-static s-birthday">${(userExpand.birthday?string('yyyy-MM-dd'))!""}</div>
									<input  class="form-control hidden s-birthday" name="birthday" id="birthday"  value="${(userExpand.birthday?string('yyyy-MM-dd'))!""}" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
							<#else>
									<div class="form-control-static s-birthday"></div>
									<input  class="form-control hidden s-birthday" name="birthday" id="birthday" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
							
							</#if>
						</div>
						<div class="col-md-2">
							<div class="form-control-static">
								<a href="javascript:;" class="s-birthday" style="color:#1B9D97"  onclick="$('.s-birthday').toggleClass('hidden')"><#if userExpand??>修改<#else>设置</#if></a>
							</div>
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">邮箱：</label>
						<div class="col-md-5 control">
							<#if user.email ??>
									<div class="form-control-static">${(user.email)!""}</div>
						    </#if>
						</div>
						
						<div class="col-md-3">
								<#if user.email ??>
									<#if user.isValidatedEmail==true >
										<span style="color:#1B9D97">邮箱已验证.</span>
									<#else>
										<a href="validateemail.do">立即验证</a>
									</#if>
								</#if>
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">手机：</label>
						<div class="col-md-5 control">
							<#if user.isValidatedMobile>
								<#--<input class="form-control mobile" class="mobile" value="${(user.mobile)!''}" disabled>-->
								<div class="form-control-static">${(user.mobile)!''}</div>
							<#else>
						
							<input class="form-control mobile" name="mobile" id="mobile" class="mobile" value="${(user.mobile)!''}" required >
							</#if>
						</div>
						<div class="col-md-3">
							<#if user.isValidatedMobile>
								<div class="form-control-static" >
							    	<span style="color:#1B9D97;margin-top:5px;">手机已验证</span>
							    </div>
							<#else>
								<div class="form-control-static" >
								  <a href="validatemobile.do">立即验证</a>
								</div>
							</#if>
						</div>
						
					</div>
					<#--
  					<div class="row form-group">
						<label class="control-label col-md-2">QQ账号：</label>
						<div class="col-md-5 control">
							<input class="form-control qq" name="qq" id="qq" value="${(user.qq)!''}" data-minlength="5" data-minlength-message="请输入正确的QQ号码.">
						</div>
					</div>
  					<div class="row form-group">
						<label class="control-label col-md-2">微信账号：</label>
						<div class="col-md-5 control">
							<input class="form-control wechat" name="wechat" id="wechat" value="${(user.wechat)!''}">
						</div>
					</div>
					-->
					<div class="row form-group">
						<label class="control-label col-md-2">所属公司：</label>
						<div class="col-md-5 control">
							<#if userExpand??>
									<div class="form-control-static s-company">${(userExpand.company)!''}</div>
									<input  class="form-control hidden s-company" name="company" id="company" value="${(userExpand.company)!''}">
							<#else>
									<div class="form-control-static s-company"></div>
									<input  class="form-control hidden s-company" name="company" id="company">
							
							</#if>
						</div>
						<div class="col-md-2">
							<div class="form-control-static">
								<a href="javascript:;" class="s-company" style="color:#1B9D97"  onclick="$('.s-company').toggleClass('hidden')"><#if userExpand??>修改<#else>设置</#if></a>
							</div>
						</div>
					</div>
					
					
  					<div class="row form-group">
						<label class="control-label col-md-2">岗位职称：</label>
						<div class="col-md-5 control">
						    <#if userExpand?? >
									<div class="form-control-static g-job">${userExpand.job!''}</div>
									<input  class="form-control hidden g-job" name="job" id="job" value="${userExpand.job!''}">
							<#else>
									<div class="form-control-static g-job"></div>
									<input  class="form-control hidden g-job" name="job" id="job">
							</#if>
						</div>
						<div class="col-md-2">
							<div class="form-control-static">
								<a href="javascript:;" class="g-job" style="color:#1B9D97"  onclick="$('.g-job').toggleClass('hidden')"><#if userExpand?? >修改<#else>设置</#if></a>
							</div>
						</div>
					</div>
			
					<div class="row">
						<div class="form-group">
							<div class="col-md-4 col-md-offset-2">
								<input type="submit" class="btn btn-primary" value="确认提交" style="margin-left:10px;"/>
							</div>
						</div>
					</div>
  				</div>
  				</form>	
  			</div>
  		</div>
	
</div>
	<div class="clearfix"></div>
</div>
<script>
	requirejs(['jquery'],function(){
		$(".userImg").mouseenter(function(){
			$(".modify").show();
		});
		$(".userImg").mouseleave(function(){
			$(".modify").hide();
		});
		window.fileupload_callback = window["fileupload_callback"] || function(data) {
			data = eval(data);
			$(".img").attr("src",data);
			var img = {img:data[0]};
			$.ajax({data:img,type:"POST",dataType:"JSON",url:"midifyuserimg.do",success:function(result){
				if(result){
					//layer.alertEx({content: "修改成功！", end: function () {
					//	window.location.reload();
					//}});
				}else{
				    layer.alertEx({content: "修改失败！",icon: "info"});
				}
			}});
		}
	});
	
</script>
</@layout>
