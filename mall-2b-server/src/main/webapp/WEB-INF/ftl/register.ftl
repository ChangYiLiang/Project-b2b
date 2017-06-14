<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
		<title>九河互联电商</title>
</head>
<style type="text/css">
.navbar-fixed-top{height:65px}
.header-jiuhe{width:1170px;margin:0px auto;height:65px;}
.nav-pills li a{width:170px;height:65px;text-align:center;fold-weight:bold;line-height:45px}

.form{background: rgba(255,255,255,0.2);width:388px;margin:100px auto;border:1px solid #2679b9;border-top:0px;}
.fa{display: inline-block;top: 27px;left: -48px;position: relative;color: #ccc;}
.form-group{height:50px}
.other-tab{width:398px;height:400px;position:relative;top:-100px;}
.other-nav{background:rgba(255,255,255,0.2);width:400px;border-bottom:1px solid rgba(255,255,255,0.2)}
.form-group{position:relative;left:-40px;}
.other-nav li{width:200px;text-align:center;font-weight:bold;font-size:15px}
/*
.tab-pane{position:relative;top:-99px}
*/
.form-left{position:relative;top:28px;left:-50px;font-size:15px;color:#555}
.form-control{width:295px}
.pull-right,.pull-left{font-weight:bold;width:130px}
.pull-left{position:relative;top:-30px;}
.pull-right{position:relative;top:4px;left:80px;background-color:#428bca}
#user_tip,#password_tip,#confirm_tip,#email_tip,#code_tip{font-size:12px;color:#428bca;}
.getcode{background:#428bca;color:white;font-weight:bold;position:relative;left:163px;top:-34px;height:34px;width:130px}
input[type="text"],input[type="password"]{padding-left:26px;}
.checkbox{padding-left:21px;}
.other-btn{background-color:#428bca;width:300px}
.res-btn{background-color:#428bca;width:300px}





.right-div{float:left;width:650px;height:110px;margin-left:50px;border-bottom:1px solid #ccc}
.radio-inline{background-image: url('${IncPath}/images/zhifubao.jpg')}
.inline-div{width:150px;height:70px;float:left;margin-left:50px}
.radio-diy{position:relative;top:27px;left:80px}

.right-check{float:left;width:650px;height:300px;margin-top:20px;border:0px solid #ccc;margin-left:50px}
.check-btn{margin-left:500px;background-color:#428bca;width:120px;font-weight:bold;height:50px}




.footer_box{ background-color:#fff;  padding-top:30px; border-top:1px solid #ccc; }
.footer{ width:1200px; margin:auto;}
.footer_box .list_ft_1{ text-align:left;}
.footer_box .list_ft_1 a:hover{ color:#df0531;}
.footer_box .list_ft_2{ margin-top:20px; text-align:left; overflow:hidden; padding-bottom:40px; }
.list_ft_2 .ft_fir{ float:left; padding-right:30px; margin-top:6px;}
.list_ft_2 .ft_fir img{ width:84px;}
.list_ft_2 .ft_sec{ float:left; line-height:24px; }
.list_ft_2 .ft_thd{ float:right; margin-top:44px; line-height:16px; background:url(${IncPath}/images/ico_13.png) no-repeat 0 0;padding-left:50px;  }
.ft_thd .lianxi{ font-size:18px; color:#666;}
.ft_thd .ph{ font-size:36px; color:#ff456a;}



.register-top{width:386px;float:left;background:linear-gradient(45deg, #10559e 5%, #1e88e5 65%, #40BAF5 98%);height:40px;}
.register-top span{color:white;font-size:14px;position:relative;top:10px;left:20px}
.register-top a{color:#ccc;position:relative;left:180px;top:13px}
</style>
<script>
	function xiaosi(){
					Cl.hideModalWindow(Cl.modalName);
					Cl.refreshDataTable(DataTableCl.tableName);
	}
</script>
<body>
	<div class="form row" id="reg" style="background-color:white">
		<div class="register-top">
			<span class="glyphicon glyphicon-fire fa-lg" style="color:black;font-size:18px"></span>
			<span>欢迎注册九河互联商城</span>
			<a id="xiaosi" class="glyphicon glyphicon-remove" href="#" onclick="xiaosi()"></a>
		</div>
		<form action="#" class="form-horizontal col-sm-offset-3 col-md-offset-3" id="form_cl" name="form_cl">
			<div class="col-sm-9 col-md-9">
				<div class="form-group">
					<span class="form-left label">账号</span>
					<i class="fa fa-user fa-lg"></i>
					<input class="form-control required" type="text" placeholder="Username" name="username" id="username" autofocus="autofocus" onblur="CheckUsername()"/>
				</div>
				<div class="form-group">
						<span class="form-left label">密码</span>
						<i class="fa fa-lock fa-lg"></i>
						<input class="form-control required" type="password" placeholder="Password" id="password" name="password" onblur="CheckPassword()" />	
				</div>
				<div class="form-group">
						<span class="form-left label">确认</span>
						<i class="fa fa-check fa-lg"></i>
						<input class="form-control required" type="password" placeholder="Re-type Your Password" name="rpassword" id="rpassword" onblur="CheckConfirm()" />	
				</div>
				<div class="form-group">
						<span class="form-left label">邮箱</span>
						<i class="fa fa-envelope fa-lg"></i>
						<input class="form-control eamil" type="text" placeholder="Email" name="email" id="email" />
				</div>
				<div class="login-foot" style="position:relative;left:-55px">
					<input type="checkbox" name="accepttos" id="accepttos" checked disabled></input>
					<span>&nbsp;我同意注册条款</span>
				</div>
				<div class="form-group" style="position:relative;top:10px">
					<button type="button" class="btn res-btn pull-right" onclick="javascript:$('#form_cl').submit();">注册</button>
					<input id="reset" type="reset" value="重 置" style="display:none"/> 
				</div>
			</div>
		</form>
	</div>
</body>
<script>
    jQuery(document).ready(function() {       
       FormCl.init();
    });
</script>
</html>
