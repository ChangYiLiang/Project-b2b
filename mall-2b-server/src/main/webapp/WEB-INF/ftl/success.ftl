<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>九河-邮箱激活</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>
<link rel="shortcut icon" href="favicon.ico"/>
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
  <link rel="stylesheet" href="${BasePath}/css/bsie.css" />
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body  class="page-header-fixed">
<!--<![endif]-->


<div class="container-fluid">
   <div class="row-fluid">
      <div class="col-lg-12">
         <div class="centering text-center" style="margin-top: 10%;">
            <div class="text-center">
               <h2 class="without-margin">
                  <span class="text-success"><big>恭喜您！</big></span> 注册成功.
               </h2>
               <h4 class="text-success">验证成功后,将可使用验证方式登录.</h4>
               <div>页面将在<span id="num"></span>秒后跳转到登录页面<br/></div>
            </div>

         </div>
      </div>
   </div>
</div>

</body>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script type="text/javascript">
   var count=8;
   $(document).ready(function() {
      function jump() {
         window.setTimeout(function () {
            count--;
            if (count > 0) {
               $('#num').html(count);
               jump(count);
            } else {
               location.href = "${BasePath}";
            }
         }, 1000);
      }

      jump(3);
   });
</script>

</html>