var DataTableCl = function () {
    var handleUser = function() {        
    	var grid = new Datatable();
        grid.init({
            src: $("#datatable_cl"),
            onSuccess: function(grid) {
                // execute some code after table records loaded
            },
            onError: function(grid) {
                // execute some code on network or other general error  
            },
            dataTable: {  // here you can define a typical datatable settings from http://datatables.net/usage/options
            	"iDisplayLength": 20,
                "bServerSide": true, // server side processing
                "sAjaxSource": "getUserDataTables.do", // ajax source
                "bSort": false,
                "aoColumnDefs" : [{  // 隐藏第一列
                    'bVisible' : false,
                    'aTargets' : [ 0 ]
                }],
                "aaSorting": [[ 1, "asc" ]] // set first column as a default sort by asc
            }
        });
    }
    return {
        //main function to initiate the module
        init: function () {
    		handleUser();
    		
    		
        },
        tableName: "datatable_cl"
    };
}();

//$.validator.addMethod("regex1", function(value, element, regex1) {
//	if (value === "") {
//		return true;
//	}
//	
//	if (typeof regex === "string") {
//		regex1 = new RegExp(regex1);
//	}
//    return regex1.test(value);
//});

var FormCl = function () {
    var handleValidation = function() {
		// for more info visit the official plugin documentation: 
	    // http://docs.jquery.com/Plugins/Validation
	    var form1 = $('#form_cl');
	    var error1 = $('.alert-danger', form1);
	    var success1 = $('.alert-success', form1);	
	    form1.validate({
	        errorElement: 'span', //default input error message container
	        errorClass: 'help-block', // default input error message class
	        focusInvalid: false, // do not focus the last invalid input
	        ignore: "",
	        rules: {
	            username: {
	                minlength: 6,
	                maxlength: 15,
	                required: true,
	                remote:{
	                	url:"getUser.do",
	                	dataType:"json",
	                	type:"GET",
	                	data:{
	                		username:function(){
		            			return $("#username").val();	
		            		}
	                	}
	                },
	                regex:"^[a-zA-Z][a-zA-Z0-9]*$",
	            },
	            password: {
	            	minlength: 6,
	                maxlength: 15,
	                required: true
	            },
	            rpassword: {
	            	minlength: 6,
	                maxlength: 15,
	                required: true,
	                equalTo: "#password"
	            },
		        email: {
		        	email:true,
		            required: true,
		            remote:{
		            	url:"getEmail.do",
		            	type:"GET",
		            	dataType:"json",
		            	data:{
		            		email:function(){
		            			return $("#email").val();	
		            		}
		            	}
		            }
		        },
		        validcode: {
		        	required: true,
		        	minlength:4,
		        	number:true
		        }
	        },
            messages: { // custom messages for radio buttons and checkboxes
            	username:{
            		required:"请输入用户名",
            		remote:"用户名已存在,请重新输入.",
            		regex:"注册名只能以字母开头,且只能输入字母和数字",
            	},
            	password:{
            		required:"请输入密码",
            	},
            	rpassword: {
            		required:"请再次输入密码",
            		equalTo: "两次输入密码不一致."
                },
                email:{
                	required:"请输入电子邮件.",
                	remote:"邮箱已存在,请重新输入."
                },
		        validcode: {
		        	required: "请输入验证码",
		        	minlength:"至少输入四位验证码",
		        	number:"验证码只能输入数字"
		        }
            },
            errorPlacement: function (error, element) { // render error placement for each input type
                if (element.parent(".input-group").size() > 0) {
                    error.insertAfter(element.parent(".input-group"));
                } else if (element.attr("data-error-container")) { 
                    error.appendTo(element.attr("data-error-container"));
                } else if (element.parents('.radio-list').size() > 0) { 
                    error.appendTo(element.parents('.radio-list').attr("data-error-container"));
                } else if (element.parents('.radio-inline').size() > 0) { 
                    error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
                } else if (element.parents('.checkbox-list').size() > 0) {
                    error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
                } else if (element.parents('.checkbox-inline').size() > 0) { 
                    error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavior
                }
            },
	        invalidHandler: function (event, validator) { //display error alert on form submit              
	            success1.hide();
	            error1.show();
	            App.scrollTo(error1, -200);
	        },	
	        highlight: function (element) { // hightlight error inputs
	            $(element)
	                .closest('.form-group').addClass('has-error'); // set error class to the control group
	        },	
	        unhighlight: function (element) { // revert the change done by hightlight
	            $(element)
	                .closest('.form-group').removeClass('has-error'); // set error class to the control group
	        },	
	        success: function (label) {
	            label
	                .closest('.form-group').removeClass('has-error'); // set success class to the control group
	        },	
	        submitHandler: function (form) {
	         
	  				User.add();
//	  				User.get_code();
	        }    
	    });
    }

    var handleWysihtml5 = function() {
        if (!jQuery().wysihtml5) {            
            return;
        }
        if ($('.wysihtml5').size() > 0) {
            $('.wysihtml5').wysihtml5({
                "stylesheets": ["http://192.168.0.81/privilege_inc/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
            });
        }
    }
    return {
        //main function to initiate the module
        init: function () {
            handleWysihtml5();
            handleValidation();
        },
        formName: "form_cl"
    };
}();

//企业用户注册
var FormClTwo = function () {
	var handleValidation = function() {
		// for more info visit the official plugin documentation: 
		// http://docs.jquery.com/Plugins/Validation
		var form1 = $('#form_cl');
		var error1 = $('.alert-danger', form1);
		var success1 = $('.alert-success', form1);	
		form1.validate({
			errorElement: 'span', //default input error message container
			errorClass: 'help-block', // default input error message class
			focusInvalid: false, // do not focus the last invalid input
			ignore: "",
			rules: {
				username: {
					minlength: 6,
					maxlength: 15,
					required: true,
					remote:{
						url:"getUser.do",
						dataType:"json",
						type:"GET",
						data:{
							username:function(){
								return $("#username").val();	
							}
						}
					},
					regex:"^[a-zA-Z][a-zA-Z0-9]*$",
				},
				usrMerchant:{
					required: true
				},
				mailName:{
					required: true
				},
				password: {
					minlength: 6,
					maxlength: 15,
					required: true
				},
				rpassword: {
					minlength: 6,
					maxlength: 15,
					required: true,
					equalTo: "#password"
				},
				email: {
					email:true,
					required: true,
					remote:{
						url:"getEmail.do",
						type:"GET",
						dataType:"json",
						data:{
							email:function(){
								return $("#email").val();	
							}
						}
					}
				},
		        validcode: {
		        	required: true,
		        	minlength:4,
		        	number:true
		        }
			},
			messages: { // custom messages for radio buttons and checkboxes
				username:{
					remote:"用户名已存在,请重新输入.",
					regex:"注册名只能以字母开头,且只能输入字母和数字"
				},
				rpassword: {
					equalTo: "两次输入密码不一致."
				},
				email:{
					remote:"邮箱已存在,请重新输入."
				},
		        validcode: {
		        	required: "请输入验证码",
		        	minlength:"至少输入四位验证码",
		        	number:"验证码只能输入数字"
		        }
			},
			errorPlacement: function (error, element) { // render error placement for each input type
				if (element.parent(".input-group").size() > 0) {
					error.insertAfter(element.parent(".input-group"));
				} else if (element.attr("data-error-container")) { 
					error.appendTo(element.attr("data-error-container"));
				} else if (element.parents('.radio-list').size() > 0) { 
					error.appendTo(element.parents('.radio-list').attr("data-error-container"));
				} else if (element.parents('.radio-inline').size() > 0) { 
					error.appendTo(element.parents('.radio-inline').attr("data-error-container"));
				} else if (element.parents('.checkbox-list').size() > 0) {
					error.appendTo(element.parents('.checkbox-list').attr("data-error-container"));
				} else if (element.parents('.checkbox-inline').size() > 0) { 
					error.appendTo(element.parents('.checkbox-inline').attr("data-error-container"));
				} else {
					error.insertAfter(element); // for other inputs, just perform default behavior
				}
			},
			invalidHandler: function (event, validator) { //display error alert on form submit              
				success1.hide();
				error1.show();
				App.scrollTo(error1, -200);
			},	
			highlight: function (element) { // hightlight error inputs
				$(element)
				.closest('.form-group').addClass('has-error'); // set error class to the control group
			},	
			unhighlight: function (element) { // revert the change done by hightlight
				$(element)
				.closest('.form-group').removeClass('has-error'); // set error class to the control group
			},	
			success: function (label) {
				label
				.closest('.form-group').removeClass('has-error'); // set success class to the control group
			},	
			submitHandler: function (form) {
				Merchant.add();
			}    
		});
	}
	
	var handleWysihtml5 = function() {
		if (!jQuery().wysihtml5) {            
			return;
		}
		if ($('.wysihtml5').size() > 0) {
			$('.wysihtml5').wysihtml5({
				"stylesheets": ["http://192.168.0.81/privilege_inc/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
			});
		}
	}
	return {
		//main function to initiate the module
		init: function () {
			handleWysihtml5();
			handleValidation();
		},
		formName: "form_cl"
	};
}();

var User = function(){
	return {
		get_code: function() {
			var url="getCode.do";
			var data={
					"email":$("#email").val(),
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("发送成功,请注意查收.");
				} else {
					alert("发送失败.");
					return ;			
				}
			});
		},
		add: function(){
			var check=$('input[name="accepttos"]:checked').val();
			if(check==null){
				alert('请同意注册协议');
				return ;
			}
			var url="add.do";
			var data={
					"username":$("#username").val(),
					"password":$("#password").val(),
					"email":$("#email").val(),
					"validcode":$("#validcode").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("注册成功");
					window.location.href="../controller/main.do";
				} else if(result == "error"){
					alert("验证码错误");
					return ;			
				} else{
					alert("注册失败");
					return ;
				}
			});
		},
		pay: function(){
			var url="pay.do";
			var data={
					"paymentmethod":$('input[name="paymentmethod"]:checked').val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("注册成功");
//					Cl.hideModalWindow(Cl.modalName);
//					Cl.refreshDataTable(DataTableCl.tableName);
				} else {
					alert("注册失败");
					return ;			
				}
			});
		}
	};
}();
//企业用户注册
var Merchant = function(){
	return {
		get_code: function() {
			var url="getCode.do";
			var data={
				"email":$("#email").val(),
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){			
					alert("发送成功,请注意查收.");
				} else {
					alert("发送失败.");
					return ;			
				}
			});
		},
		add: function(){
			var check=$('input[name="accepttos"]:checked').val();
			if(check==null){
				alert('请同意注册协议');
				return ;
			}
			var url="merchantUser_add.do";
			var data={
				"username":$("#username").val(),
				"usrMerchant":$("#usrMerchant").val(),
				"mailName":$("#mailName").val(),
				"password":$("#password").val(),
				"email":$("#email").val(),
				"validcode":$("#validcode").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("注册成功");
			window.location.href="../controller/main.do";
				} else {
					alert("注册失败");
					return ;			
				}
			});
		},
		pay: function(){
			var url="pay.do";
			var data={
				"paymentmethod":$('input[name="paymentmethod"]:checked').val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("注册成功");
//					Cl.hideModalWindow(Cl.modalName);
//					Cl.refreshDataTable(DataTableCl.tableName);
				} else {
					alert("注册失败");
					return ;			
				}
			});
		}
	};
}();

var ForgetFormCl = function () {
	var messages = {
			"1": "该用户名不存在",
			"2": "邮箱与用户名不匹配",
			"3": "该邮箱未验证, 无法找回密码",
			"4": "发送邮件失败, 请与管理员联系",
			"0": "请登录注册邮箱根据连接提示找回密码。"
	}

	function sendemail(form, event) {
		var data = $(form).serialize();
		$.ajax({
			url: "sendforgetemail.do",
			data: data,
			type: "POST",
			dataType: "JSON",
			success: function(data) {
				alert(messages[data] || "未知错误, 请与管理员联系");
				if (data == 0) {
					location = "main.do";
				}
			}
		});
	}
	
    return {
        init: function () {
            $("#form_cl").i9heValidate({submitHandler: sendemail});
        },
        formName: "form_cl"
    };
}();

var ResetFormCl = function () {
	var messages = {
			"2": "用户名错误",
			"1": "该URL已过期",
			"0": "修改成功",
			"-1": "请求修改失败"
	}
	
	function resetpassword(form, event) {
		var data = $(form).serialize();
		$.ajax({
			// url: "",  回传当前URL
			data: data,
			type: "POST",
			dataType: "JSON",
			success: function(data) {
				alert(messages[data] || "未知错误");
				if (data == 0) {
					location = "../login.do";
				} else {
					// location.reload();
				}
			}
		});
	}
	
    return {
        init: function () {
            $("#form_cl").i9heValidate({submitHandler: resetpassword});
        },
        formName: "form_cl"
    };
}();


/**
 * 查询参数的处理，每个功能的DataTable都要处理自己的查询条件，并向服务器提交
 * 如果使用了DataTables控件，则都要定义这个函数
 */
var aoDataHandler = function(aoData) {
	//页面的查询条件
	//aoData.push( { "name": "name", "value": "" } );
}

var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function sendMessage() {
  　curCount = count;
　　//设置button效果，开始计时
     $("#btnSendCode").attr("disabled", "true");
     $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
　　  //向后台发送处理数据
     var url="sendCode.do";
	 var data={
			"email":$("#email").val(),
	};
	Cl.ajaxRequest(url,data,function(result){
		if(!result) return ;		
		result = result.replace(/(^\s*)|(\s*$)/g,'');
		if(result == "success"){			
			alert("发送成功,请注意查收.");
		} else {
			alert("发送失败.");
			return ;			
		}
	});
}

//timer处理函数
function SetRemainTime() {
            if (curCount == 0) {                
                window.clearInterval(InterValObj);//停止计时器
                $("#btnSendCode").removeAttr("disabled");//启用按钮
                $("#btnSendCode").val("重新发送验证码");
            }
            else {
                curCount--;
                $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
            }
        }

var CodeForm = function() {
	function sendCodement() {
		var data = $("#sendemail").serializeObject();
		var url = "../verificationCode.do";
		Cl.ajaxRequest(url,data,function(result){
			if(!result) return ;		
			result = result.replace(/(^\s*)|(\s*$)/g,'');
			if(result == "success"){
				alert("验证成功");
				window.location.href="toMyData.do";
			} else {
				alert("验证失败");
				return ;			
			}
		});
	}
	return {
		init: function(){
			var $form = $("#sendemail");
			$form.i9heValidate({submitHandler: sendCodement});
			
			$("#code_button").click(function(){
				$form.submit();
			});
		}
	}
}();
//</head>
//<body>
//        <input id="btnSendCode" type="button" value="发送验证码" onclick="sendMessage()" /></p>
//</body>