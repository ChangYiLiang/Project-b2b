<#include '../layout.ftl'>
<#macro myheader>
	<#import '../component.ftl' as com>
</#macro>

<#macro scripts>

<script src="${BasePath}/scripts/custom/user.js"></script>
<script>
    jQuery(document).ready(function() {       
    	CodeForm.init();
    });
</script>
</#macro>

<@layout header=myheader footer=scripts>
	<div class="alert alert-info">
		<strong>邮箱验证</strong>
	</div>
<#if user.email ??>
<#if user.isValidatedEmail == true >
<div class="container-fluid">
   <div class="row-fluid">
      <div class="col-lg-12">
         <div class="centering text-center" style="margin-top: 10%;">
            <div class="text-center">
               <h2 class="without-margin">
                  <span class="text-success"><big>您的邮箱已验证啦！</big></span>
               </h2>
            </div>
         </div>
      </div>
   </div>
</div>	
<#else>
<div class="container-fluid">
   <div class="row-fluid">
      <div class="col-lg-12">
      <form action="#" id="sendemail" name="sendemail" method="post"  autocomplete="off">
         <div class="centering text-center" style="margin-top: 10%;">
            <div class="text-center">
<!--                <h2 class="without-margin"> -->
<!--                   <span class="text">恭喜您！</span>  -->
<!--                </h2> -->
               <h4 class="text">您的邮箱:${ user.email!''}</h4>
               <br>
<!--                <div class="controls"><input type="text" id="code" name="code" /></div> -->
<!--                <div class="controls"><input class="btn btn-primary" id="btnSendCode" type="button" value="发送验证码" onclick="sendMessage()" /></div> -->
				<div class="form-group other-group" style="margin-left:265px; height:30px">
						<input style="width: 150px;" class="form-control" type="text" placeholder="输入验证码" name="validcode" id="validcode" />
				</div>
               <input type="hidden" id="email" name="email" value="${user.email!''}" /> 
				<div class="form-group other-group" style="position: relative;top:-44px;left:450px;width: 100px;">
					<input class="btn btn-primary" id="btnSendCode" type="button" value="发送验证码" onclick="sendMessage()" />
				</div>
            </div>
         </div>
      </form>
	<div class="centering text-center">
			<input type="submit" id="code_button" class="btn btn-primary" value="验证"  />
	</div>
      </div>
   </div>
</div>
</#if>
<#else>
<div class="container-fluid">
   <div class="row-fluid">
      <div class="col-lg-12">
         <div class="centering text-center" style="margin-top: 10%;">
            <div class="text-center">
               <h2 class="without-margin">
                  <span class="text-success"><big>出错啦！</big></span>
               </h2>
            </div>
         </div>
      </div>
   </div>
</div>	
</#if>
	

</@layout>