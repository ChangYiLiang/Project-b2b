function getUrlParam(name)
{
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
	var r = window.location.search.substr(1).match(reg);  //匹配目标参数
	if (r!=null) return unescape(r[2]); return null; //返回参数值
} 


$(function(){
	
	//将表单数据转换为json
	$.fn.serializeObject = function()  
	{  
	   var o = {};  
	   var a = this.serializeArray();  
	   $.each(a, function() {  
	       if (o[this.name]) {  
	           if (!o[this.name].push) {  
	               o[this.name] = [o[this.name]];  
	           }  
	           o[this.name].push(this.value || '');  
	       } else {  
	           o[this.name] = this.value || '';  
	       }  
	   });  
	   return o;  
	};
})
$.validator.addMethod("uncode_len", function(value, element,max) {
			var t =value.replace(/[\u4e00-\u9fa5]/g,'');//替换中文
		    var length = (value.length-t.length)*3+t.length;//判断长度
		    return length<=max;
		});

$.validator.addMethod("regex", function(value, element, regex) {
	if (value === "") {
		return true;
	}
	
	if (typeof regex === "string") {
		regex = new RegExp(regex);
	}
    return regex.test(value);
});


function getDepRateObjById(depRateId){
	for(var i=0;i<depRatesLists.length;i++){
		if(depRatesLists[i].depRateId == depRateId){
			return depRatesLists[i];
		}
	}
}
$("#resetbutton").click(function(){
  $("form").each(function(){
    $(this)[0].reset()
  });
});


//获取基于attribute验证规则
// 使用方式<input type="text" required data-number="true" data-maxlength="5" />
// required: 必填验证, data-number: 必须为数字, data-maxlength：最大长度5
$.fn.extend({
	_validationRule: function() {
		var rule = {};
		for (var k in $(this).data()) {
			if($.validator.methods[k]) {
				rule[k] = $(this).data(k);
			}
		}
		return rule;
	},
	
	_validationMessage: function() {
		var message = {}
		var data = $(this).data();
		for (var k in data) {
			if(/(\w+)Message$/.test(k)) {
				var ruleName = /(\w+)Message$/.exec(k)[1];
				message[ruleName] = data[k]
			}
		}
		
		return message;
	},
	
	validationRules: function(){
		var rules = {}
		$(this).find(":input[name]").each(function(){
			var name = $(this).attr("name");
			var rule = {};
			rule[name] = $(this)._validationRule();
			$.extend(rules,rule);
		})
		return rules;
	},
	validationMessages: function() {
		var messages = {}
		$(this).find(":input[name]").each(function(){
			var msg = $(this)._validationMessage()
			messages[$(this).attr("name")] = msg;
		})
		
		return messages;
	}
})

// i9he默认验证
$.fn.extend({
	i9heValidate: function(options){
		var $form = $(this);
	    var $error = $('.alert-danger', $form);
	    var $success = $('.alert-success', $form);	
	    var rules = $form.validationRules();
	    var messages = $form.validationMessages();
	    
	    
		
		var defaultOptions = {
			errorElement: 'span', //default input error message container
	        errorClass: 'help-block', // default input error message class
	        focusInvalid: false, // do not focus the last invalid input
	        ignore: "",
	        rules: rules,
	        messages: messages,
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
	        	$success.hide();
	        	$error.show();
	        	if(App && App.scrollTo) {
	        		App.scrollTo($error, -200);
	        	}
	        	
	        },	
	        highlight: function (element) { // hightlight error inputs
	            $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
	        },	
	        unhighlight: function (element) { // revert the change done by hightlight
	            $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
	        },	
	        success: function (label) {
	            label.closest('.form-group').removeClass('has-error'); // set success class to the control group
	        },
		}
		
		var _options = $.extend(true, {}, defaultOptions, options)
		
		return $form.validate(_options);
	}
});

String.prototype.format = function(obj) {
	return this.replace(/\{(\w+)\}/g, function(source, prop){
		return obj[prop];
	});
}

$.extend($.validator.messages, {
	uncode_len: '输入的字符长度不对',
	regex: '输入格式不正确'
})
		
function createSelect(id,data){
	 $('#'+id).empty();   //清空resText里面的所有内容
    var html = ''; 
    for(var index in data){
    	html += '<option value="'+index+'">'+data[index]+'</option>';
	 }
     $('#'+id).html(html);
}

// 初始化select内容
// selector: select选择器, data: 数据, optional: value=''的值
function createOptions(selector, data, optional) {
	$(selector).empty();
	if (optional) {
		$("<option>").val("").text(optional).appendTo(selector);
	}
	for(var val in data){
    	$("<option>").val(val).text(data[val]).appendTo(selector);
	}
}
$.fn.extend({createOptions: function(data, optional){
	createOptions(this, data, optional);
	return this;
}});

// 弹窗
$(function(){
	$(document).on("click", "[data-modal=true]", function(){
		Cl.showModalWindow(Cl.modalName, $(this).attr("href"));
		return false;
	});
	
	$(document).on("click", "[data-ajax=true]", function(){
		var url = $(this).attr("href");
		var success = $(this).attr("data-success");
		$.post(url, function(data){
			window[success](data);
		})
		return false;
	});
	$("[title]").tooltip();
});

$(document).ajaxError(function(event, jqXHR, ajaxSettings, thrownError){
	var res = jqXHR.responseJSON;
	if (res) {
		if (res.status === "i9he_exception") {
			alert("请求失败\n\t[{code}]{msg}".format(res));
		} else {
			alert("请求失败\n\tMessage:{msg}\n\tType:{type}".format(res));
		}
		if(console && console.info)
			console.info(res);
	}
});

