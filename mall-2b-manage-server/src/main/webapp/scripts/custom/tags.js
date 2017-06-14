
(function(){
	
	var del = function(ele) {
		var url = ele.href;
		if(confirm("是否删除?")) {
			$.post(url, function() {
				App.alert({message: "删除成功"});
				$("table").dataTable().fnDraw();
			})
		}
		return false;
	}
	// Tag
	var tag = MyApp.namespace("Tags.Tag");
	tag.del = del;
	
	// 分组
	var category = MyApp.namespace("Tags.Category");
	category.del = del;
	
	// Tag映射
	var mappings = MyApp.namespace("Tags.Mappings");
	mappings.updateCheckBoxs = function (targets, checked) {
		$.uniform.update($(targets).prop("checked", checked));
	}
	mappings.create = function(ele) {
		var url = $(ele).attr("href");
		var bs = MyApp.namespace("bootstrap");
		bs.ajaxButton(ele, url, {}, function() {
			App.alert({message: "添加成功"});
			$(ele).parents("table").dataTable().fnDraw();
		});
		return false;
	}
	
	mappings.remove = function(ele) {
		if (confirm("是否移除该项?")) {
			var url = $(ele).attr("href");
			var bs = MyApp.namespace("bootstrap");
			bs.ajaxButton(ele, url, {}, function() {
				App.alert({message: "移除成功"});
				$(ele).parents("table").dataTable().fnDraw();
			});
		}
		return false;
	}

	mappings.batchCreate = function(ele, values) {
		var url = $(ele).attr("href");
		var bs = MyApp.namespace("bootstrap");
		var data = $(values).find(":checked").not("thead input").serializeArray();
		bs.ajaxButton(ele, url, data, function() {
			App.alert({message: "添加成功"});
			$(ele).parents("table").dataTable().fnDraw();
		});
		
		return false;
	}
	
	mappings.batchRemove = function(ele, values) {
		var data = $(values).find(":checked").not("thead input").serializeArray();
		if(!data.length) {
			alert("请选择需要移除的项")
			return false;
		}
		
		if (confirm("是否移除所选项?")) {
			var url = $(ele).attr("href");
			var bs = MyApp.namespace("bootstrap");
			
			bs.ajaxButton(ele, url, data, function() {
				App.alert({message: "移除成功"});
				$(ele).parents("table").dataTable().fnDraw();
			});
		}
		return false;
	}
	
	
})();
