var TrustAction = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Trust.add();
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

var UpTrustAction = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Trust.up();
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

var AreaAction = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   Trust.addarea();
	        }    
	    });
    }
    
    return {
        init: function () {
            handleValidation();
        },
        formName: "form_cll"
    };
}();

var TrustlogAction = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   Trust.uplog();
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

var Trust = function(){
	return {
		add: function(){
			var url="addtrust.do";
			var data={
				"truname":$("#truname").val(),
				"no":$("#no").val(),
				"city":$("#city").val(),
				"comment":$("#comment").val(),
				"goodsId":$("#goodsId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("机房绑定区域成功！！！");
					window.location.href="trust.do";
				} else {
					alert("机房绑定区域失败！！！");
					window.location.href="trust.do";
				}
			});
		},
		addarea: function(){
			var url="addarea.do";
			var data={
				"name":$("#name").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("插入区域成功！！！");
					window.location.href="trust.do";
				} else {
					alert("插入区域失败！！！");
					window.location.href="trust.do";
				}
			});
		},
		up: function(){
			var url="uptru.do";
			var data={
				"truname":$("#truname").val(),
				"no":$("#no").val(),
				"city":$("#city").val(),
				"comment":$("#comment").val(),
				"goodsId":$("#goodsId").val(),
				"id":$("#id").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("修改成功！！！");
					window.location.href="trust.do";
				} else {
					alert("修改失败！！！");
					window.location.href="trust.do";
				}
			});
		},
		uplog: function(){
			var url="uptrustlogg.do";
			var data={
				"trustName":$("#trustName").find("option:selected").text(),
				"trustId":$("#trustName").val(),
				"id":$("#id").val(),
				"comment":$("#comment").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(result==true){
					alert("修改成功！！！");
					window.location.href="trustlog.do";
				} else {
					alert("修改失败！！！");
					window.location.href="trustlog.do";
				}
			});
		}
	};
}();

