// 创建命名空间
var MyApp = MyApp || {}
MyApp.namespace = function(str){
    var parts = str.split("."),
    parent = MyApp,
    i=0,
    l=0;

    if(parts[0]==="MyApp"){
        parts = parts.slice(1);
    }
    for(i=0,l=parts.length; i<l;i++){
        if(typeof parent[parts[i]] === "undefined"){
            parent[parts[i]] = {};
        }
        parent = parent[parts[i]];
    }
    return parent;
}



;(function(){
	// 基于 Bootstrap Button的Ajax封装
	var bs = MyApp.namespace("bootstrap");
	bs.ajaxButton = function(button, url, data, success, ajaxOptions) {
		$(button).each(function() {
			if (!$(this).data("loading-text")) {
				$(this).data("loading-text", $(this).text());
			}
		});
		$(button).button('loading');
		var options = {
				url: url,
				data: data,
				success: success,
				method: "POST",
				complete: function() { $(button).button('reset') }
		};
		options = $.extend({}, options, ajaxOptions);
		$.ajax(options);
	}
	
	// 基于 DataTable的ajax封装
	var dt = MyApp.namespace("datatable");
	dt.initTable = function(selector) {
		var ajaxSource = $(selector).data("table-ajax-source"),
			dataHandler = $(selector).data("table-data-handler"),
			searchForm = $(selector).data("table-search-form"),
			pagination = $(selector).data("table-pagination") !== false;
		var grid = new Datatable();
		// 查询条件
		
		var _handler = function(aoData) {
			
		};
		if (searchForm) {
			$(searchForm).find(":submit").click(function() {
				$(selector).dataTable().fnDraw();
				return false;
			});
			$(searchForm).find("select").change(function() {
				$(selector).dataTable().fnDraw();
			});
			_handler = function(aoData) {
				var data = $(searchForm).find(":input").serializeArray();
				for (var i=0;i<data.length;i++) {
					aoData.push(data[i]);
				}
			}
		}
		if (dataHandler) {
			_handler = MyApp.namespace(dataHandler);
		}
		grid.aoDataHandler = _handler
		window["aoDataHandler"] = function (aoData) {
			if (this.aoDataHandler && this.aoDataHandler != window["aoDataHandler"]) {
				this.aoDataHandler(aoData)
			}
		};
		
		// 显示列
		var columns = [];
		$(selector).find("tr.columns th").each(function() {
			var title = $(this).data("title") || $(this).find("[data-table-title]").html() || $(this).text(),
				prop = $(this).data("prop"),
				propHandler = $(this).data("prop-handler"),
				width = $(this).data("width") || "",
				_default = $(this).data("default") || "",
				isTemplate = $(this).data("template");
			var dataProp = prop;
			if (propHandler) {
				dataProp = window[propHandler] || MyApp.namespace(propHandler);
			}
			if (isTemplate|| (!prop && !propHandler)) {
				var $tmpl = $(this).clone();
				$tmpl.find("[data-table-title]").remove();
				
				var tmpl = $tmpl.html();
				dataProp = (function() {
					return function(source) {
						return window.template.compile(tmpl)(source);
					}
				})();
			}
			
			var meta = {"sTitle": title, "sWidth": width, "sDefaultContent": _default, mDataProp: dataProp}
			columns.push(meta);
		});
		
		grid.init({
            src: $(selector),
            dataTable: {
            	// from http://datatables.net/usage/options
            	"iDisplayLength": 20,
                "bServerSide": true,
                "sAjaxSource": ajaxSource,
                "bSort": false,
                "bFilter": false,
                "bPaginate": pagination,
                "bInfo": pagination,
                "aoColumns": columns,
                "fnDrawCallback": function() {
                	$(selector).find("thead :checkbox").prop("checked", false);
                	// 修复基于模板创建的uniform失效问题
                	if ($.uniform) {
	                	var $uniformElements = $(selector).find(":checkbox,:radio,select");
	                	$.uniform.restore($uniformElements);
	                	$uniformElements.each(function() {
	                		var $self = $(this);
	                		if ($self.parents(".checker").length) {
	                			$self.unwrap().unwrap();
	                		}
	                	})
	                	$uniformElements.uniform();
                	}
                }
            }
        });
	}
	
})();



