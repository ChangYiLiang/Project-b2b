//var EndUser = function() {
//	function addEndUser() {
//		var data = $("#form_cl").serializeObject();
//		var url = "../verificationCode.do";
//		Cl.ajaxRequest(url,data,function(result){
//			if(!result) return ;		
//			result = result.replace(/(^\s*)|(\s*$)/g,'');
//			if(result == "success"){
//				alert("验证成功");
//				window.location.href="toMyData.do";
//			} else {
//				alert("验证失败");
//				return ;			
//			}
//		});
//	}
//	 return {
//	        init: function () {
//	            $("#form_cl").i9heValidate({submitHandler: addEndUser});
//	        },
//	        formName: "form_cl"
//	 };
//}();
var FormCl = function () {
    var handleValidation = function() {
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
	                	url:"/i9he/getUser.do",
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
		            	url:"/i9he/getEmail.do",
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
                "stylesheets": ["http://fp.9he.com/privilege_inc/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
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
EndUserHelper = function() {
	function getTime(prop, format) {
		format = format || "yyyy-MM-dd";
		format = format.replace(/[yMdHhms]+/g, function(item){
			return "{"+item+"}";
		});
		return function(source) {
			if(source[prop]) {
				var d = new Date(source[prop]);
				return format.format({
					"yyyy": d.getFullYear(),
					"MM": d.getMonth() + 1,
					"dd": d.getDate(),
					"HH": d.getHours(),
					"hh": d.getHours() % 12,
					"mm": d.getMinutes(),
					"ss": d.getSeconds(),
				})
			}
			return "";
		};
	}
	function getCheckBox(source) {
		return '<input type="checkbox" value="{id}" />'.format(source);
	}
	function getAjaxOptions(url, data, success, error) {
		return {
			url: url,
			data: data,
			type: "post",
			dataType: "json",
			success: function(data) {
				if(data==true) {
					alert(success);
				}else {
					alert(error);
				}
			}
		}
	}
	return {
		getTime: getTime,
		getCheckBox:getCheckBox,
		getAjaxOptions:getAjaxOptions,
	}
}();

var EndUserDt = function () {
	function operator(source) {
		var html = "";
		html += " <a href='/controller/user/busidetails.do?id={id}' class='btn btn-primary'>查看业务</a>".format(source);
		html += " <a href='/controller/user/setbusi.do?id={id}'  class='btn btn-primary' >分配业务</a>".format(source);
		html += " <a href='/controller/user/cpassword.do?id={id}'  class='btn btn-primary' data-modal='true'>设置密码</a>".format(source);
		return html;
	}

	var handleEvents = function() {
		$("#searchForm select").change(function(){
			$("#datatable_cl").dataTable().fnDraw();
		})
	}
	
	var _aoDataHandler = function(aoData) {
		var data = $("#searchForm").serializeArray();
		$(data).each(function(){
			if(this.value!=='') {
				aoData.push(this);
			}
		})
	}
	
    var handleCl = function() {        
    	var grid = new Datatable();
    	
        grid.init({
            src: $("#datatable_cl"),
            dataTable: { 
            	"iDisplayLength": 20,
                "bServerSide": true,
                "sAjaxSource": "/controller/user/getUserDataTables.do",
                "bSort": false,
                "aoColumns" : [
	                               {"sTitle" : "用户编号", "mDataProp" : "id", "sDefaultContent" : ""},
	                               {"sTitle" : "用户名称", "mDataProp" : "username", "sDefaultContent" : ""},
	                               {"sTitle" : "创建时间", "mDataProp" : EndUserHelper.getTime("createdDate", "yyyy-MM-dd HH:mm:ss")},
	                               {"sTitle" : "电子邮箱", "mDataProp" : "email", "sDefaultContent" : ""},
	                               {"sTitle" : "业务数量", "mDataProp" : "count", "sDefaultContent" : ""},
	                               {"sTitle" : "操作", "mDataProp" : operator, "sWidth": "180px"},
                               
                               ],
            }
        });
    }
    return {
        init: function () {
    		window.aoDataHandler = _aoDataHandler;
    		handleCl();
    		handleEvents();
        },
        tableName: "datatable_cl"
    };
}();
function checkAll(obj){
	$("input[type='checkbox']").prop('checked', $(obj).prop('checked'));
}
var EndUserBusiDt = function () {
	function operator(source) {
		var html = "";
		html += " <button class='btn btn-primary'  onclick='javascript:User.delbusi({id});'> 删除业务</button>".format(source);
		html += " <a href='/controller/busi/toMyBusiDetail.do?id={id}'  class='btn btn-primary' >业务详情</a>".format(source);
		return html;
	}

	var handleEvents = function() {
		$("#searchForm select").change(function(){
			$("#datatable_cl").dataTable().fnDraw();
		})
	}
	
	var _aoDataHandler = function(aoData) {
		var data = $("#searchForm").serializeArray();
		$(data).each(function(){
			if(this.value!=='') {
				aoData.push(this);
			}
		})
	}
	
    var handleCl = function() {        
    	var grid = new Datatable();
    	var id = $("#userId").val();
        grid.init({
            src: $("#datatable_cl"),
            dataTable: { 
            	"iDisplayLength": 20,
                "bServerSide": true,
                "sAjaxSource": "/controller/user/getUserBusiDataTables.do?id="+id,
                "bSort": false,
                "aoColumns" : [
                               	   {"sTitle" : "<input type='checkbox' onclick='checkAll(this)' />", "mDataProp": EndUserHelper.getCheckBox },
                               	   {"sTitle" : "序号", "mDataProp" : "id", "sDefaultContent" : ""},
                               	   {"sTitle" : "业务名称", "mDataProp" : "goodsName", "sDefaultContent" : ""},
                               	   {"sTitle" : "主IP", "mDataProp" : "mainIp", "sDefaultContent" : ""},
                               	   {"sTitle" : "业务价格", "mDataProp" : "orderAmount", "sDefaultContent" : ""},
                               	   {"sTitle" : "到期时间", "mDataProp" : EndUserHelper.getTime("endDate", "yyyy-MM-dd HH:mm")},
//                               	   {"sTitle" : "业务状态", "mDataProp" : PaymentHelper.getState},
                               	   {"sTitle" : "操作", "mDataProp" : operator, "Width": "120px"},
                               
                               ],
            }
        });
    }
    return {
        init: function () {
    		window.aoDataHandler = _aoDataHandler;
    		handleCl();
    		handleEvents();
        },
        delListBusi: function() {
			if(!$("#datatable_cl :checked").length) {
				alert("请选择需要删除的业务");
				return;
			}
			if(!confirm('确定要删除该用户下的业务吗？')) {
				return;
			}
			
			var data = {};
			var list = []
			$("#datatable_cl :checked").each(function(index){
				data["idlist[{index}]".format({index: index})] = $(this).val();
			})
			var url="delListBusi.do";
//			jQuery.ajax(EndUserHelper.getAjaxOptions("delListBusi.do", data, "删除业务成功", "删除业务失败"));
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){								
//					window.location.href="/controller/user/busidetails.do?id="+userId;
					Cl.refreshDataTable("datatable_cl");
				} else {
					alert("删除业务失败");
					return ;			
				}
			});
		},
        tableName: "datatable_cl"
    };
}();

var userId = $("#userId").val();
var EndUserSetBusiDt = function () {
	function operator(source) {
		var html = "";
		html += " <button class='btn btn-primary'   onclick='javascript:User.setbusi({id});'> 分配业务</button>".format(source);
		html += " <a href='/controller/busi/toMyBusiDetail.do?id={id}'  class='btn btn-primary' >业务详情</a>".format(source);
		return html;
	}

	var handleEvents = function() {
		$("#searchForm select").change(function(){
			$("#datatable_cl").dataTable().fnDraw();
		})
	}
	
	var _aoDataHandler = function(aoData) {
		var data = $("#searchForm").serializeArray();
		$(data).each(function(){
			if(this.value!=='') {
				aoData.push(this);
			}
		})
	}
	
    var handleCl = function() {        
    	var grid = new Datatable();
//    	var id = $("#userId").val();
        grid.init({
            src: $("#datatable_cl"),
            dataTable: { 
            	"iDisplayLength": 20,
                "bServerSide": true,
                "sAjaxSource": "/controller/user/getUserOBusiDataTables.do",
                "bSort": false,
                "aoColumns" : [
                               	   {"sTitle" : "<input type='checkbox' onclick='checkAll(this)' />", "mDataProp": EndUserHelper.getCheckBox },
                               	   {"sTitle" : "序号", "mDataProp" : "id", "sDefaultContent" : ""},
                               	   {"sTitle" : "业务名称", "mDataProp" : "goodsName", "sDefaultContent" : ""},
                               	   {"sTitle" : "主IP", "mDataProp" : "mainIp", "sDefaultContent" : ""},
                               	   {"sTitle" : "业务价格", "mDataProp" : "orderAmount", "sDefaultContent" : ""},
                               	   {"sTitle" : "到期时间", "mDataProp" : EndUserHelper.getTime("endDate", "yyyy-MM-dd HH:mm")},
//                               	   {"sTitle" : "业务状态", "mDataProp" : PaymentHelper.getState},
                               	   {"sTitle" : "操作", "mDataProp" : operator, "Width": "120px"},
                               
                               ],
            }
        });
    }
    return {
        init: function () {
    		window.aoDataHandler = _aoDataHandler;
    		handleCl();
    		handleEvents();
        },
        setListBusi: function() {
			if(!$("#datatable_cl :checked").length) {
				alert("请选择需要分配的业务");
				return;
			}
			if(!confirm('确定要分配到该用户下吗？')) {
				return;
			}
			
			var data = {userId: userId};
			var list = []
			$("#datatable_cl :checked").each(function(index){
				data["idlist[{index}]".format({index: index})] = $(this).val();
			})
			var url="setListBusi.do";
//			jQuery.ajax(EndUserHelper.getAjaxOptions("setListBusi.do", data, "分配业务成功", "分配业务失败"));
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){								
//					window.location.href="/controller/user/setbusi.do?id="+userId;
					Cl.refreshDataTable("datatable_cl");
				} else {
					alert("分配业务失败");
					return ;			
				}
			});
		},
        tableName: "datatable_cl"
    };
}();

var passwordForm = function() {
	function cpasswordment() {
		var data = $("#cpassword_form").serializeObject();
		var url = "/controller/user/setpassword.do";
		Cl.ajaxRequest(url,data,function(result){
			if(!result) return ;		
			result = result.replace(/(^\s*)|(\s*$)/g,'');
			if(result == "success"){
				alert("修改成功");
				window.location.href="euList.do";
			} else {
				alert("修改失败");
				return ;			
			}
		});
		
	}
	return {
		init: function(){
			var $form = $("#cpassword_form");
			$form.i9heValidate({submitHandler: cpasswordment});
			$("#cpassword_button").click(function(){
				$form.submit();
			});
		}
	}
}();

var User = function(){
	return {
		add: function(){
			var url="addeuser.do";
			var data = $("#form_cl").serializeObject();
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("添加终端用户成功.");
					window.location.href="/controller/user/euList.do";
				} else if(result == "error"){
					alert("验证码错误.");
					return ;			
				} else{
					alert("添加终端用户失败.");
					return ;
				}
			});
		},
		setbusi: function(id){
			var url="/controller/user/setbusiToUser.do"
			var data={
				"busiId":id,
				"userId":userId
			};
			if(!confirm('确定要分配吗？')) {
				return;
			}
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){								
//					alert("分配业务成功");
//					window.location.href="/controller/user/setbusi.do?id="+userId;
					Cl.refreshDataTable("datatable_cl");
				} else {
					alert("分配业务失败");
					return ;			
				}
			});
		},
		delbusi: function(id){
			var url="/controller/user/delbusiToUser.do"
			var data={
				"busiId":id
//				"userId":userId
			};
			if(!confirm('确定要删除吗？')){
				return;
			}
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){								
//					alert("删除业务成功");
//					window.location.href="/controller/user/busidetails.do?id="+userId;
					Cl.refreshDataTable("datatable_cl");
				} else {
					alert("删除业务失败");
					return ;			
				}
			});
		}
	};
}();