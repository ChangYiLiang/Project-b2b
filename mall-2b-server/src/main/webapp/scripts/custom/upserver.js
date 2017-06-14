
var upServer = function () {
	var handleValidation = function() {
		// for more info visit the official plugin documentation: 
		// http://docs.jquery.com/Plugins/Validation
		var form1 = $('#upServer_c1');
		
		//不用动
		form1.validate({
			submitHandler: function (form) {
				var data = $(form).serializeObject();

				$.ajax({
					url: "save.do",
					data: data,
					dataType: "json",
					method: "post",
					success: function(data){
						if(data) {
							alert("修改成功");
							location.reload();
						} else {
							alert("修改失败");
						}
					}
				})
			}
		});
	}
	return {
		//main function to initiate the module
		init: function () {
			handleValidation();
			
		},
		formName: "logistics_c1"

	};
}();

$("#yes").click(function(){
	var itemId = $("#UpBandwidthId").val();
	var id = $("#id").val();
	var url = "/controller/product/addUpServer.do?id="+id+"&itemId="+itemId;
	//alert(url)
	window.location.href= url;
	//序列化数据
   //	var param = $('#searchForm').serialize();
   	

/*		var exportExcelUrl = "/financial-server/controller/excel/exportExcel.do";
		//alert(exportExcelUrl);
		//window.location.href=exportExcelUrl；
 		$.ajax({
	     type: 'POST',
	     data: param ,
	     dataType: 'json',
	     url: exportExcelUrl ,
	     
	     success: function(msg){
        	//alert("交互成功");
		/////////////////////////////

		});*/
	});


var aoDataHandler = function(aoData) {
	//页面的查询条件
	//aoData.push( { "name": "name", "value": "" } );
}