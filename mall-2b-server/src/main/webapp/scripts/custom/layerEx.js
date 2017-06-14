layer.config({
    extend: 'jiuhe/style.css',
    skin: 'layer-ext-jiuhe'
});
layer.alertEx = function(options) {
    var dOptions = {
        title: false, 
        icon: "success", // success, info, question
        //area: ["300px", "260px"], 
        area: "300px", 
        btn: ['确定'], 
        shadeClose: true, 
        resize: false,
        type: 0
    };
    options = $.extend({}, dOptions, options || {});
    if (options.type === 0 && typeof(options.content) !== "string" && options.content.html) {
        options.content = options.content.html();
    }
    layer.open(options);
}

layer.confirmEx = function(options) {
    var dOptions = {
        icon: "question", 
        btn: ["确定", "取消"], 
    };
    options = $.extend({}, dOptions, options || {});
    layer.alertEx(options)
}

;(function($) {
	$.extend($.fn, {
		alert: function(options) {
			var dOptions = $(this).data();
			dOptions.content =  $(this).html();
			options = $.extend({}, dOptions, options || {});
			layer.alertEx(options);
		}
		, confirm: function(options) {
			var dOptions = $(this).data();
			dOptions.content =  $(this).html();
			options = $.extend({}, dOptions, options || {});
			layer.confirmEx(options);
		}
		, open: function (options) {
			var dOptions = {
			        title: false, 
			        area: ["300px", "260px"], 
			        btn: false, 
			        shadeClose: true, 
			        resize: false,
			        type: 1,
			        btn: ["确定", '取消']
			    };
			var dOptions2 = $(this).data();
			options = $.extend({}, dOptions, dOptions2, options || {});
			options.content = $(this).html();
			layer.open(options)
		}
	});
})(window.jQuery);