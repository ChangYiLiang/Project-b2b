// purchase module
// define定义模块  异步加载回调
define(function(){
	requirejs(['jquery'], function() {
		if (location.hash) {
			$("a[href=\\" + location.hash + "]").click();
		}
	});
	
	var initValidateForm = function() {
		requirejs(['core'], function(){
			$("#requirementForm").i9heValidate();
			
			$("#requirementForm :submit").click(function() {
				if(!$("#requirementForm").valid()) {
					$("#requireAlert").alert();
				}
			});
			
		})
	}
	
	return {
		initValidateForm: initValidateForm
	};
});

