var FormCl = function () {
    var handleValidation = function() {
	    var form1 = $('#form_cl');
	    form1.validate({
	       submitHandler: function (form) {
	        	Goods.add();
	        }    
	    });
    }

    var handleWysihtml5 = function() {
        if (!jQuery().wysihtml5) {            
            return;
        }
        if ($('.wysihtml5').size() > 0) {
            $('.wysihtml5').wysihtml5({
                "stylesheets": ["http://127.0.0.1/privilege_inc/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
            });
        }
    }
    return {
        //main function to initiate the module
        init: function () {
            handleWysihtml5();
            handleValidation();
        },
        formName: "form_cl"
    };
}();
var Goods = function(){
	return {
		add: function(){
//			var url="http://127.0.0.1:8888/mall-server/controller/product/addHardware.do";
//			var url="addHardware.do"
			var url="http://127.0.0.1:8888/mall-server/controller/product/addHardware.do";
			var data={
				"config":$("#config").val(),
				"pay":$("#pay").val(),
				"goodsId":$("#goodsId").val()
			};
			Cl.ajaxRequest(url,data,function(result){
				if(!result) return ;		
				result = result.replace(/(^\s*)|(\s*$)/g,'');
				alert(result);
				if(result == "success"){
					alert("插入账单成功了呀");
//					Cl.hideModalWindow(Cl.modalName);
//					Cl.refreshDataTable(DataTableCl.tableName);
//					$("#reset").click();
//					window.location.href="http://192.168.0.81:8888/mall-server/controller/main.do";
//					window.location.href="main.do";
					window.location.href="http://127.0.0.1:8888/mall-server/controller/main.do";
				} else {
					alert("注册失败");
//					window.location.href="http://127.0.0.1:8888/mall-server/controller/main.do"
//					return ;			
				}
			});
		}
	};
}();

/**
 * 查询参数的处理，每个功能的DataTable都要处理自己的查询条件，并向服务器提交
 * 如果使用了DataTables控件，则都要定义这个函数
 */
var aoDataHandler = function(aoData) {
	//页面的查询条件
	//aoData.push( { "name": "name", "value": "" } );
}
//<script type="text/javascript">
//
//var InterValObj; //timer变量，控制时间
//var count = 5; //间隔函数，1秒执行
//var curCount;//当前剩余秒数
//
//function sendMessage() {
//  　curCount = count;
//　　//设置button效果，开始计时
//     $("#btnSendCode").attr("disabled", "true");
//     $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
//     InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
//　　  //向后台发送处理数据
//     $.ajax({
//     　　type: "POST", //用POST方式传输
//     　　dataType: "text", //数据格式:JSON
//     　　url: 'Login.ashx', //目标地址
//    　　 data: "dealType=" + dealType +"&uid=" + uid + "&code=" + code,
//    　　 error: function (XMLHttpRequest, textStatus, errorThrown) { },
//     　　success: function (msg){ }
//     });
//}
//
////timer处理函数
//function SetRemainTime() {
//            if (curCount == 0) {                
//                window.clearInterval(InterValObj);//停止计时器
//                $("#btnSendCode").removeAttr("disabled");//启用按钮
//                $("#btnSendCode").val("重新发送验证码");
//            }
//            else {
//                curCount--;
//                $("#btnSendCode").val("请在" + curCount + "秒内输入验证码");
//            }
//        }
//</script>
//</head>
//<body>
//        <input id="btnSendCode" type="button" value="发送验证码" onclick="sendMessage()" /></p>
//</body>