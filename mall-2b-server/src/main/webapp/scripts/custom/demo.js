var jslist = ['common'];

// zhifu
requirejs(jslist, function(){
	var submitHandler = function() {
		alert("执行ajax提交")
	};
	$("#frm").i9heValidate({submitHandler: submitHandler});
});


