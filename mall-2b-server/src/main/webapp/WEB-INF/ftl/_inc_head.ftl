
<meta charset="utf-8" />
<meta name="baidu-site-verification" content="hW3URgBK9A" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="${BasePath}/layer/skin/default/layer.css" />
<link rel="stylesheet" href="${BasePath}/layer/skin/jiuhe/style.css" />
<link rel="shortcut icon" href="${BasePath}/favicon.ico"/>
<script src="http://cdn.bootcss.com/require.js/2.3.2/require.js"></script>

<script>
	requirejs.config(
		{
			baseUrl: "${BasePath}/scripts/custom/",
			paths: {
				'jquery': ['http://cdn.bootcss.com/jquery/1.12.4/jquery.min'],
				'bootstrap': ['http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min'],
				'jquery.placeholder': ['http://cdn.bootcss.com/jquery-placeholder/2.3.1/jquery.placeholder.min'],
				'jquery.validate': ['${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min', 
									'http://cdn.bootcss.com/jquery-validate/1.15.1/jquery.validate.min'],
				'jquery.validate.addition': [ '${IncPath}/assets/plugins/jquery-validation/dist/additional-methods.min', 
												'http://cdn.bootcss.com/jquery-validate/1.15.1/additional-methods.min'],
				'core': ['i9he.core'],
				'inc': "${IncPath}/assets/plugins/",
				'html5shiv': 'http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min',
				'respond': 'http://cdn.bootcss.com/respond.js/1.4.2/respond.min',
				'layer': '${BasePath}/layer/layer'
			},
			shim: {
				'bootstrap': ['jquery'],
				'jquery.placeholder': ['jquery'],
				'jquery.validate': ['jquery'],
				'jquery.validate.addition': ['jquery.validate'],
				'common': ['jquery', 'jquery.validate', 'jquery.validate.addition'],
				'core': ['common'],
				'layer': ['jquery'],
				'layerEx': ['jquery', 'layer']
			}
		}
	);
	requirejs(['bootstrap', 'layerEx']);
</script>
<!--IE8支持 bootstrap布局, css3 background-size属性 -->
<!--[if lt IE 9]>

	<link rel="stylesheet" href="${BasePath}/css/bsie.css">
  	<script> requirejs(['html5shiv', 'respond']) </script>
  	<script> 
  		requirejs(['jquery', 'jquery.backgroundcover.min'], function() {
  			$(function(){
  				$('.ico').backgroundcover({ safearea: "50%,50%,50%,50%" });
  			})
  		});
  	</script>
<![endif]-->
<!--IE8, IE9 支持 placeholder和jquery.validate-->
<!--[if IE]>
  	<script>  
  		requirejs(['jquery.placeholder'], function() { 
  			$(":input").placeholder(); 
  			$("form").submit(function() {
  				if ($(this).data("validator") && $.fn.valid) {
  					return $(this).valid();
  				}
  			});
  		});
  	</script>
<![endif]-->