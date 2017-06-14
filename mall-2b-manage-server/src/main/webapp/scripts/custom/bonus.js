var BonusAction = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Bonus.add();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl"
    };
}();

var BonusAction2 = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Bonus.up();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cl"
    };
}();


var Bonus = function(){
	return {
		add: function(){
			var url="addbonus.do";
			var data={
				"typeName":$("#typeName").val(),
				"typeMoney":$("#typeMoney").val(),
				"minAmount":$("#minAmount").val(),
				"startDate":$("#startDate").val(),
				"endDate":$("#endDate").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("节操券录入成功！！！");
					window.location.href="bonus.do";
				} else {
					alert("节操券录入失败！！！");
					window.location.href="bonus.do";
				}
			});
		},
		up: function(){
			var url="upbonus.do";
			var data={
				"typeName":$("#typeName").val(),
				"typeMoney":$("#typeMoney").val(),
				"minAmount":$("#minAmount").val(),
				"startDate":$("#startDate").val(),
				"endDate":$("#endDate").val(),
				"typeId":$("#typeId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("修改节操券成功！！！");
					window.location.href="bonus.do";
				} else {
					alert("修改节操券失败！！！");
					window.location.href="bonus.do";
				}
			});
		}
	};
}();

