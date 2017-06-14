
var Category = function () {
    var handleValidation = function() {
	    var form = $('#form_cl');
	    form.validate({
	       submitHandler: function (form) {
	    	   CategoryAction.add();
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

var UpdateCategory = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   CategoryAction.update();
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

var UpdateItemCategory = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   CategoryAction.itemupdate();
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

var ItemCategory = function () {
    var handleValidation = function() {
	    var form = $('#form_cll');
	    form.validate({
	       submitHandler: function (form) {
	    	   CategoryAction.itemadd();
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

var CategoryAction = function(){
	return {
		add: function(){
			var url="addcategory.do";
			var data={
				"parentId":$("#parentId").val(),
				"name":$("#name").val(),
				"catDesc":$("#catDesc").val(),
				"structure":$("#structure").val(),
				"catLV":$("#catLV").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("分类录入成功");
					window.location.href="category.do";
				} else {
					alert("分类录入失败");	
				}
			});
		},
		update: function(){
			var url="upcategory.do";
			var data={
				"id":$("#id").val(),
				"parentId":$("#parentId").val(),
				"name":$("#name").val(),
				"catDesc":$("#catDesc").val(),
				"structure":$("#structure").val(),
				"catLV":$("#catLV").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("分类修改成功");
					window.location.href="category.do";
				} else {
					alert("分类修改失败");	
				}
			});
		},
		itemadd: function(){
			var url="additemcategory.do";
			var data={
				"typeName":$("#typeName").val(),
				"ifIdc":$("#ifIdc").val(),
				"typeAttr":$("#typeAttr").val(),
				"isShow":$("#isShow").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("配件分类录入成功");
					window.location.href="itemcategory.do";
				} else {
					alert("配件分类录入失败");	
				}
			});
		},
		itemupdate: function(){
			var url="upitemcategory.do";
			var data={
				"id":$("#id").val(),
				"typeName":$("#typeName").val(),
				"ifIdc":$("#ifIdc").val(),
				"typeAttr":$("#typeAttr").val(),
				"isShow":$("#isShow").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				if(result == "success"){
					alert("配件分类修改成功");
					window.location.href="itemcategory.do";
				} else {
					alert("配件分类修改失败");	
				}
			});
		}
	};
}();

