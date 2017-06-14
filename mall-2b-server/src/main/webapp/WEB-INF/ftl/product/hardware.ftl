<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<head>
<title>九河互联-戴尔服务器订购</title>
<meta charset="utf-8">
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/dell.css" />

<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/DellR230.js"></script>

<script type="text/javascript">
    $(function(){
        var ulKey = 0;
        $('.R730_btn2').click(function(){
            ulKey--;
            if(ulKey<0){
                ulKey = 3;
            }
            var move = ulKey * -452;
            $('.R730_2 ul').stop().animate({'left':move + 'px'},500);
        })
        $('.R730_btn1').click(function(){
            ulKey++;
            if(ulKey>3){
                ulKey = 0;
            }
            var move = ulKey * -452;
            $('.R730_2 ul').stop().animate({'left':move + 'px'},500);
        });

            $(window).scroll(function () {
			
            if($(window).scrollTop()>866){
            $('.nav_3').addClass('nav_3_current');
        }else{
            $('.nav_3').removeClass('nav_3_current');
        }
    });
            $('.nav_3 ul li').eq(0).click(function(){
        
            $('body,html').animate({'scrollTop':'870px'},500)  
        });
            $('.nav_3 ul li').eq(1).click(function(){
        
            $('body,html').animate({'scrollTop':'2969px'},500)  
        });  
		            $('.nav_3 ul li').eq(3).click(function(){
        
            $('body,html').animate({'scrollTop':'4610px'},500)  
        });           


    })
</script>

<style>
ul,li,dl,dd{ margin:0; padding:0; list-style:none;}
*{ font-size:12px; color:#666; font-family:'微软雅黑';border:none;}
select::-ms-expand { display: none; }
select {
  appearance:none;
  -moz-appearance:none;
  -webkit-appearance:none;
    }

.M_box{ width:1200px; margin:40px auto; overflow:hidden;}
.M_left_box{ float:left;  width:720px; border-top:4px solid #dd143c;}
.T_tit{ font-size:20px; color:#666; margin-bottom:20px; font-weight:bold; }
.P_box0,.P_box1,.P_box2,.P_box3,.P_box4,.P_box5,.P_box6,.P_box7,.P_box8,.P_box9,.P_control{ margin-top:30px;}
.P_box0 li,.P_box1 li,.P_box2 li,.P_box3 li,.P_box4 li,.P_box5 li,.P_box6 li,.P_box7 li,.P_box8 li,.P_box9 li,.P_control li{ overflow:hidden; margin-top:20px;} 
.P_m{ font-size:14px; color:#666; line-height:30px; width:74px; text-align:right; display:block; float:left; margin-right:20px;}
.P_m2{font-size:14px; color:#666; width:74px; text-align:right;display:block;float:left}
.P_n { font-size:14px; color:#666; line-height:30px; width:624px; text-align:center; display:block; float:left; background-color:#f3f3f3;}
.P_box0 select,.P_box1 select,.P_box2 select,.P_box3 select,.P_box4 select,.P_box5 select,.P_box6 select,.P_box7 select,.P_box8 select,.P_box9 select,.P_control select{  border:1px solid #ccc; width:624px; text-align:center;
 background:url(../dell/images/jian_1.png) no-repeat scroll 98% center transparent; padding-left:20px; cursor:pointer;}
.P_box0 option,.P_box1 option,.P_box2 option,.P_box3 option,.P_box4 option,.P_box5 option,.P_box6 option,.P_box7 option,.P_box8 option,.P_box9 option,.P_control option{ font-size:14px; height:30px; line-height:30px;}

.M_right_box{ float:right; width:410px; padding:20px; border:1px solid #dd143c; color:#666;border-radius:5px}
/*
.M_right_box p{float:left;font-size:14px; color:#666;height:30px; text-align:right;display:block;width:285px;text-align:left;overflow:hidden;}
*/
.M_wen{ margin-bottom:15px; font-size:14px; line-height:25px;}
.M_pay{ font-size:36px; color:#dd143c;}
.t_tit{ font-size:22px; color:#666; margin-bottom:20px;}
/*
.M_b{ margin-top:30px; margin-bottom:24px;}
.M_b input{ font-size:16px; line-height:32px; color:#fff; width:120px; height:32px; text-align:center; margin-right:20px; cursor:pointer; }
.M_b input:hover{background-color:#333; }
.M_b .btn_1{ background-color:#ff5353;}
.M_b .btn_2{ background-color:#26d7b3;}
*/
</style>

<!--[if lt IE 9]>
  <link rel="stylesheet" href="${BasePath}/css/bsie.css" />
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="${BasePath}/css/IE8.js"></script>
<![endif]-->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!--[if IE 7]><body class="ie7"><![endif]-->
<!--[if IE 8]><body class="ie8"><![endif]-->
<!--[if IE 9]><body class="ie9"><![endif]-->
<!--[if !IE]>-->
<body>
<!--<![endif]-->
<#include "../header.ftl" >
<!--订购UI-->
<div class="Large_box">

	<form action="${BasePath}/controller/product/addHardware.do" name="submit" method="post"  autocomplete="off">
	
		<input type="hidden" name="pay" id="pay">
		<input type="hidden" name="config" id="config">
		<input type="hidden" name="goodsId" id="goodsId" value="1">
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
 		<input type="hidden" name="number" id="number" value="1">
	
		<div class="M_box">
			<div class="T_tit">戴尔服务器整机订购</div>
			<div class="M_left_box">
				<ul class="P_control">
					<li>
						<span class="P_m">型号 :</span>
						<select class="form-control selectpicker" id="select">
							<option selected="selected" value="20">PowerEdge R230</option>
							<option>PowerEdge R330</option>
							<option>PowerEdge R430</option>
							<option>PowerEdge R530</option>
							<option>PowerEdge R630</option>
							<option>PowerEdge R730</option>
							<option>PowerEdge R730XD</option>
							<option>PowerEdge R930</option>
						</select>
					</li>
				</ul>
				
				<ul class="U_control">
					<li>
						<ul class="P_box0">
							<li>
								<span class="P_m">机架类型 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected value="0">1U机架式</option>
								</select>
							</li>
							 <li>
								<span class="P_m">处理器 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="0">1颗英特尔®至强四核® E3-1220 v5 3.0GHz 8MB缓存 8GT/s DMI3（包含价格中）</option>
									<option value="936">1颗英特尔®至强四核® E3-1230 v5 3.4GHz 8MB缓存 8GT/s DMI3  [RMB936.00]</option>
									<option value="1415">1颗英特尔®至强四核® E3-1240 v5 3.5GHz 8MB缓存 8GT/s DMI3  [RMB1415.70]</option>
									<option value="2503">1颗英特尔®至强四核® E3-1270 v5 3.6GHz 8MB缓存 8GT/s DMI3  [RMB2503.80]</option>
									<option value="8318">1颗英特尔®至强四核® E3-1280 v5 3.7GHz 8MB缓存 8GT/s DMI3  [RMB8318.70]</option>
								</select>	
							</li>
						   <li>
								<span class="P_m">内存 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="0">4GB DDR4 ECC 2133Mhz（包含价格中）</option>
									<option value="900">8GB DDR4 ECC 2133Mhz [RMB900.00]</option>
									<option value="1800">16GB DDR4 ECC 2133Mhz [RMB1800.00]</option>
									<option value="3600">32GB DDR4 ECC 2133Mhz [RMB3600.00]</option>
									<option value="7200">64GB DDR4 ECC 2133Mhz [RMB7200.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">硬盘 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="0">500GB 7.2K RPM SATA 6Gbps 3.5英寸硬盘（包含价格中</option>
									<option value="1000">1TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1000.00]</option>
									<option value="1300">2TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1300.00]</option>
									<option value="1600">4TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1600.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">芯片组 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected="selected" value="0">英特尔®C236</option>
								</select>
							</li>
							 <li>
								<span class="P_m">网卡 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected="selected" value="0">集成双端口千兆以太网卡（包含价格中）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">RAID配置 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected="selected" value="0">内置PERC S110阵列控制器（包含价格中）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">PCIe插槽 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected="selected" value="0">2个PCIe x16 G2插槽（内置）</option>
								</select>
							</li>
							  <li>
								<span class="P_m">电源 :</span>
								<select class="form-control selectpicker" disabled>
									<option selected="selected" value="0">单个有线电源，250W（包含价格中）</option>
								</select>
							</li>
						</ul>
					</li>
				</ul>
				
			</div>
			<div class="M_right_box">
				<div class="t_tit">当前配置</div>
				<p id="P_other"></p>
				<ul class="P_link M_wen">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
				<br/>
				<div class="M_wen" style="margin-left:-25px"><span class="P_m2"> 总价  ：</span><span class="M_pay">0.00</span></div>
				<br/>
				<input type="submit" name="submit" class="btn btn-primary"  value="立即购买" style="width:150px"/>
				<input type="reset" class="btn btn-primary" value="询问客服" style="margin-left:50px;width:150px"/>
			</div>
		</div>
		
	</form>
	<ul class="P_price" style="display:none">
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
		<li>0</li>
	</ul>
	<p id="caonima"></p>
</div>



<div class="nav_3">
    <ul class="gun_qian">
        <li ><a href="javascript:;">产品介绍</a></li>
        <li ><a href="javascript:;">配置参数</a></li>
        <li ><a href="javascript:;">用户评价</a></li>
        <li ><a href="javascript:;">服务保障</a></li>
    </ul>
</div>
<ul class="nb_flag">
<li>
	<div class="box_center">
		<div class="L_box bac_f ">
			<div class="M_box">
			
				<div class="M_box_R tiyan_3 R730_1 ">
					<ul class="M_box_R ">
						<li class="H_t">
							<span class="tit_1 fon_24 hui_3 ">戴尔PowerEdge R230</span>
							<div class="tit_xian"></div>
						</li>
						<li class="H_wen">
							<span class="w_1"> PowerEdge R230服务器使用功能强大、用途广泛的高效PowerEdge R230单路1U入门级机架式服务器，整合数据并提升应用程序运行速度。新的处理器和内存技术帮助新服务器实现了对上一代产品的性能翻番提升。此外，服务器还支持新的PCIe 3.0 标准，从而让用户能够以小型机箱而拥有一个全功能的强大处理能力。
							</span>
						</li>

					</ul>
				</div>
					<div class="M_box_L_2  R730_2 ">
						<ul class="R930_2">
							<li class="R730_w_1 R230_1"><img src="images/R230_1.png" alt="" /></li>
							 <li class="R730_w_1 R230_1"  style="padding-left:5px;"><img src="images/R230_2.png" alt="" /></li>
							  <li class="R730_w_1 R230_1" style="margin-left:10px"><img src="images/R230_3.png" alt="" /></li>
								<li class="R730_w_1 R230_1"><img src="images/R230_4.png" alt="" /></li>
						</ul>
							  <a href="javascript:;" class="R730_btn1"><img src="images/R730_btn1.png" alt="" /></a> <a href="javascript:;" class="R730_btn2"><img src="images/R730_btn2.png" alt="" /></a>
					</div>

			</div>
		</div>
		<div class="tedian_box">
			<div class="R730_xian">
				<span class="fon_24 fon_w hui_f bac_3 R730_sp">PowerEdge R230 特点</span>
			</div>
			 <div class="L_box  ">
			<div class="M_box">
			
				<div class="M_box_R tiyan_3 R730_1 ">
					<ul class="M_box_R ">
						<li class="H_t">
							<span class="tit_1 fon_24 hui_3 ">极致传输速率</span>
							<div class="tit_xian"></div>
						</li>
						<li class="H_wen">
							<span class="w_1">R230服务器搭载了英特尔至强处理器E3-1200 v5系列的每个内核都能多提供33%的高速缓存，让您的应用程序发挥最大效用。4个DIMM插槽最高可配64 GB内存，有助于缩短响应时间，最新的第三代PCIe I/O插槽还能有效提高数据传输速率。</span>
						</li>

					</ul>
				</div>

							 <div class="M_box_L_2 R730_3"><img src="images/230_4.png"></div>
			</div>
		</div>

		 <div class="L_box ">
		<div class="M_box">
		 <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="images/230_3.png"></div>
		  <ul class="M_box_R">
				<li class="H_t">
					<span class="tit_1 fon_24 hui_3 ">充足的拓展空间</span>
					<div class="tit_xian"></div>
				</li>
				<li class="H_wen">
					<span class="w_1">人性化的内部拓展空间，支持2块3.5英寸或2个2.5英寸SATA/SAS硬盘，满足您多方面需求。完整的硬件配置可以快速上手使用，免去了单独采购硬件的麻烦同时降低了您的使用成本。双端口千兆网卡，带来极致网速体验。</span>
				</li>                
			</ul>
		   
		</div>
	</div>


				 <div class="L_box  ">
			<div class="M_box">
			
				<div class="M_box_R tiyan_3 R730_1 ">
					<ul class="M_box_R ">
						<li class="H_t">
							<span class="tit_1 fon_24 hui_3 ">集中式用户计算环境</span>
							<div class="tit_xian"></div>
						</li>
						<li class="H_wen">
							<span class="w_1"> 以优化的配置将Dell PowerEdge服务器的性能、内存容量和嵌入式虚拟机管理程序选项与桌面虚拟化软件整合在一起，创建集中式最终用户计算环境，支持更多用户终端设备，从而简化管理、操作。</span>
						</li>

					</ul>
				</div>

							 <div class="M_box_L_2 R730_4"><img src="images/230_2.png"></div>
			</div>
		</div>
			 <div class="L_box ">
		<div class="M_box">
		 <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="images/230_1.png"></div>
		  <ul class="M_box_R">
				<li class="H_t">
					<span class="tit_1 fon_24 hui_3 ">完美适配中小型企业</span>
					<div class="tit_xian"></div>
				</li>
				<li class="H_wen">
					<span class="w_1">戴尔PowerEdge R230服务器定位入门级用户群体，小型化的机身让这款服务器拥有了易于部署和管理的特点，依靠这款服务器支持的高效的管理系统和优秀的网络性能，用户可实现高效的远程管理，非常适合作为中小型企业的Web服务器或应用服务器采购。 </span>
				</li>                
			</ul>
		   
		</div>
	</div>
		</div>

	   <!--  配置参数 -->
	   <div class="R730_pz_t fon_24 bac_3 hui_f fon_w">配置参数</div>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">基本资料</dt>
		   <dd >产品型号：PowerEdge R230 <br />
				产品类型：单路四核至强1U机架式服务器 <br />
				产品尺寸：高度：43mm（1.69英寸）x宽度：6.72cm（26.45英寸）x深度：4.95cm（19.49英寸） <br />


			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">处理器</dt>
		   <dd >处理器型号：Intel®Xeon® E3-1220 v5 <br />
				标配数量/最大支持数量：  1颗 <br />
				处理器主频/缓存： 3.0Ghz/8M <br />
				插槽数量/QPI： 2个PCIe x16 G3插槽 <br />



			</dd>
	   </dl>
			 <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">芯片组</dt>
		   <dd > 芯片组：     Intel C236 
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">内存</dt>
		   <dd >标配容量/最大支持： 1x4GB/64GB <br />
		  内存类型/工作频率： ECC/2133MHz <br />
		  内存插槽数量： 最多4个DIMM插槽 <br />



			</dd>
	   </dl>
			 <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">硬盘</dt>
		   <dd >     标配容量/最大支持：500GB 7.2K RPM SATA 6Gbps 3.5英寸硬盘*1块/最大支持4块盘
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">RAID控制器</dt>
		   <dd > 内置PERC S110阵列控制器（支持raid0,1）
			</dd>
	   </dl>
			 <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">网卡</dt>
		   <dd >     网卡控制器：集成双端口千兆以太网卡
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w">光驱装置</dt>
		   <dd >类型：DVDRW
			</dd>
	   </dl>
			 <dl class="R730_dl bd_last">
		   <dt class="red fon_16 fon_w">电源</dt>
		   <dd > 类型：单个有线电源，250 瓦
			</dd>
	   </dl>
	<div class="R730_pz_t fon_24 bac_3 hui_f fon_w">服务保障</div>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun2">全程服务</dt>
		   <dd >作为国内专业的数据中心硬件服务商，九河互联提供覆盖服务器硬件完整生命周期的全程服务，从基础采购咨询到IT架构设计、业务运行部署、技术运维支持、行业解决方案等，全程服务体系带来高附加值服务，最大程度上降低用户TCO；九河互联拥有20多位资深硬件工程师团队，提供7x24小时全天候售前售后咨询服务：<br />
		  <div class="fuwu_zixun1"><a href="javascript:;" class="red "> 售前咨询>>></a>   <a href="javascript:;" class="red"> 技术支持>>></a></div>
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun3 fuwu_zixun2">预约上门</dt>
		   <dd >   服务器采购完成投入使用过程中，遇到不会操作部署、技术难题等情况怎么办？不用着急，九河互联20余位资深硬件工程师团队24小时随时待命，为您提供线上远程和线下上门技术服务，为了更快的帮助您解决问题，请联系客服人员预约，以便我们及时安排专业技术人员上门。

			</dd>
	   </dl>
			 <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun4 fuwu_zixun2">生态减免</dt>
		   <dd > 九河互联构建了全球首个亚太数据中心集群，您购买服务器整机后，可根据业务发展需求，将服务器托管至九河互联自营香港、美国、深圳、韩国、新加坡等地的数据中心，现在选购硬件可免费享受托管服务，详情请咨询在线客服人员。
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun5 fuwu_zixun2">自动化运维</dt>
		   <dd >  告别服务器硬件运维管理人工时代，九河互联自主研发软件级服务器管理服务，以往依赖技术人员手动操作管理，而现在可以通过管理软件一键自动化实现服务器开关机、重启、系统安装、业务部署等，极大降低了运维人员管理服务器的时间成本，让IT运维更简单便捷！

			</dd>
	   </dl>
			 <dl class="R730_dl">
		  <dt class="red fon_16 fon_w fuwu_zixun6 fuwu_zixun2">金融方案</dt>
		   <dd > 中小企业运营初期，硬件的成本投入是一笔不小的开支，我们深知企业初期资金压力颇大，为了解决资金方面的痛点，九河互联全面推出生态金融方案，中小企业可以采用月结或分期付款的方式享受优质的产品和服务，目前我们正在着力引入第三方金融机构针对性的提供分期付款服务。
			</dd>
	   </dl>
	   <dl class="R730_dl">
		  <dt class="red fon_16 fon_w fuwu_zixun7 fuwu_zixun2">价格保护</dt>
		   <dd >  硬件市场鱼龙混杂，价格参差不齐，对于初次采购硬件的用户来说，可能会面临价格猫腻的风险，九河互联提供的硬件产品全国统一标价，公开透明价格细微到每一个组件；另外我们建立了完善的价格保护机制，购买服务器七天内价格如有下调变动，用户可以联系客服人员索取差价
			</dd>
	   </dl>
			 <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun8 fuwu_zixun2">金牌物流</dt>
		   <dd >为了确保硬件产品安全无损送达客户手中，九河互联所有硬件产品默认发顺丰、联邦等第三方金牌物流公司，当然您也可以根据实际需求，选择更便捷安全的物流方式。
			</dd>
	   </dl>
	   <dl class="R730_dl">
		   <dt class="red fon_16 fon_w fuwu_zixun9 fuwu_zixun2">7天退换货</dt>
		   <dd >九河互联提供的服务器硬件均是原厂原装，经过多重质量检测，确保质量合格率达到99.99%，客户采购服务器后，产品7天内无人为损坏，不影响二次销售前提下因质量问题产生的退换货，运费由卖家承担，无质量问题退换货运费由买家承担。
		   <div class="fuwuliucheng">
			   <p>退换货流程</p>
			   <div><img src="images/fuwuliucheng.png" height="78" width="948" alt="" /></div>
			   <span>联系客服</span> <span>说明情况</span> <span>补拍运费款</span> <span>寄回产品</span> <span class="fuwusp1">收货</span><span>办理退换货</span>
		   </div>
			</dd>
	   </dl>
			 <dl class="R730_dl">
		 <dt class="red fon_16 fon_w fuwu_zixun10 fuwu_zixun2">增值运维服务</dt>
		   <dd>  九河互联拥有一支专业的技术工程师团队，可以为客户提供数据中心级运维增值服务，如日常服务器代维、服务器集群、负载均衡、内网组建等，客户仅需支付较少的费用，即可实现业务技术上的突飞猛进，详情请咨询客服人员）。
			</dd>
	   </dl>
	</div>
	</li>
<ul>
<#include "../footer.ftl" >
</body>
</html>