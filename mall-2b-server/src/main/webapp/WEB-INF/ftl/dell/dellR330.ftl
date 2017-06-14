<!doctype html>
<html>
<head>
<title>九河-戴尔服务器订购</title>
<meta charset="utf-8">
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${IncPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/css/dell.css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/css/fuwuqi.css" />

<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${IncPath}/js/DellR330.js"></script>
<script type="text/javascript" src="${IncPath}/js/fuwuqi.js"></script>


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
	<#if user ??>
		<form action="${BasePath}/controller/product/addHardware.do"  method="post"  autocomplete="off">
	<#else>
		<form action="${url}"method="post"  autocomplete="off" onsubmit="location='${CasPath}/login?service=${url}';return false;">
	</#if>
		<input type="hidden" name="orderCycle" id="orderCycle" value="0">
 		<input type="hidden" name="number" id="number" value="1">
	
		<input type="hidden" name="goodsId" value="12">
		<input type="hidden" name="pay" id="pay">
		<input type="hidden" name="config" id="config">
		<input type="hidden" name="idlink" id="id">
	
		<div class="M_box">
			<div class="T_tit">戴尔服务器整机订购</div>
			<div class="M_left_box">
				<ul class="P_control">
					<li>
						<span class="P_m">型号 :</span>
						<select class="form-control selectpicker" id="select" onblur="getindex()">
							<option>PowerEdge R230</option>
							<option selected="selected">PowerEdge R330</option>
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
								<select class="form-control selectpicker" >
									<option selected value="9130" id="20">1U机架式</option>
								</select>
							</li>
							 <li>
								<span class="P_m">处理器 :</span>
								<a style="color:blue">提示：R330属于单路机架服务器，仅支持1颗CPU</a>
								<select class="form-control selectpicker">
									<option selected="selected" value="0" id="21">1颗英特尔®至强四核® E3-1220 v5 3.0GHz 8MB缓存 8GT/s DMI3（包含价格中）</option>
									<option value="936" id="22">1颗英特尔®至强四核® E3-1230 v5 3.4GHz 8MB缓存 8GT/s DMI3 [RMB936.00] </option>
									<option value="1415.70" id="23">1颗英特尔®至强四核® E3-1240 v5 3.5GHz 8MB缓存 8GT/s DMI3 [RMB1415.70]</option>
									<option value="2503.80" id="24">1颗英特尔®至强四核® E3-1270 v5 3.6GHz 8MB缓存 8GT/s DMI3 [RMB2503.80]</option>
									<option value="8318.70" id="25">1颗英特尔®至强四核® E3-1280 v5 3.7GHz 8MB缓存 8GT/s DMI3 [RMB8318.70] </option>
								</select>
							</li>
						   <li>
								<span class="P_m">内存 :</span>
								<a style="color:blue">提示：4个UDIMM插槽，最大支持扩展64GB</a>
								<select class="form-control selectpicker">
									<option selected="selected" value="0" id="26">4GB DDR4 ECC 2133Mhz（包含价格中）</option>
									<option value="900" id="27">8GB DDR4 ECC 2133Mhz [RMB900.00]</option>
									<option value="1800" id="28">16GB DDR4 ECC 2133Mhz [RMB1800.00]</option>
									<option value="3600" id="29">32GB DDR4 ECC 2133Mhz [RMB3600.00]</option>
									<option value="7200" id="30">64GB DDR4 ECC 2133Mhz [RMB7200.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">硬盘 :</span>
								<a style="color:blue">提示：硬盘最大支持4个3.5英寸或8个2.5英寸</a>
								<select class="form-control selectpicker">
									<option selected="selected" value="0" id="31">500GB 7.2K RPM SATA 6Gbps 3.5英寸硬盘（包含价格中）</option>
									<option value="1000" id="32">1TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1000.00]</option>
									<option value="1300" id="33">2TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1300.00]</option>
									<option value="1600" id="34">4TB 7.2K RPM SATA 6Gbps 3.5英寸硬盘 [RMB1600.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">芯片组 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="35">英特尔®C236</option>
								</select>
							</li>
							 <li>
								<span class="P_m">网卡 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="36">集成Broadcom 5720双端口千兆以太网卡（包含价格中）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">RAID配置 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="37">内置PERC S110阵列控制器（包含价格中）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">PCIe插槽 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="38">2个PCIe x16 G2插槽 3.0（内置）</option>
								</select>
							</li>
							  <li>
								<span class="P_m">电源 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="39">热插拔单电源,350W（包含价格中）</option>
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
				<br>
				<div class="buy-num" style="width:100%">
				<p class="left-p" style="float:left">购买数量：</p>
					<ul class="ul-num" style="position:relative;top:-10px"> 
						<li>
							<button type="button" class="btn" style="width:40px" onclick="goods_cut()" id="left-cut">
								<span class="glyphicon glyphicon-arrow-down other-span"></span>
							</button>
							<div class="form-group" style="display:inline-block">
								<input type="text" class="form-control" style="width:50px;position:relative;top:4px;text-align:center" value="1" disabled id="num">
							</div>
							<button type="button" class="btn" style="width:40px" onclick="goods_add()" id="right-add">
								<span class="glyphicon glyphicon-arrow-up other-span"></span>
							</button>
						</li>
					</ul>
				</div>
				<br/>
				<div class="M_wen" style="margin-left:-25px"><span class="P_m2"> 总价  ：</span><span class="M_pay">0.00</span></div>
				<br/>
				<input type="submit" name="submit" class="btn btn-primary"  value="立即购买" style="width:150px"/>
				<input type="reset" id="ask_me" class="btn btn-primary" value="询问客服" style="margin-left:50px;width:150px"/>
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
	<ul class="P_id" style="display:none">
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
		
	<div class="box_center" >
    <div class="L_box bac_f ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">戴尔PowerEdge R330 </span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1"> 这是入门级单路机架式服务器功能强大且可扩展，并具有高可用性，可提高中小型企业和远程办公室/分支办公室应用程序的运行速度。E3-1220V5产品系列，拥有稳定的处理性能。借助可扩展的内部存储容量，采用可随时用于虚拟化和高可用性群集可扩展平台，灵活地适应不断变化的工作负载情况，戴尔创新的故障保护型虚拟机管理程序可随着您的业务增长，为您的虚拟化工作负载提供虚拟机管理程序冗余。大容量存储硬盘，给您不一样的体验！办公室级的静音设计让这款服务器非常适合开放式办公环境，并且能够降低数据中心的噪音。
                        </span>
                    </li>

                </ul>
            </div>
                <div class="M_box_L_2  R730_2 ">
                    <ul class="R930_2">
                        <li class="R730_w_1 R230_1"><img src="${IncPath}/images/DR330_1.png" alt="" /></li>
                         <li class="R730_w_1 R230_1"  style="padding-left:5px;"><img src="${IncPath}/images/DR330_2.png" alt="" /></li>
                          <li class="R730_w_1 R230_1" style="margin-left:10px"><img src="${IncPath}/images/DR330_3.png" alt="" /></li>
                            <li class="R730_w_1 R230_1"><img src="${IncPath}/images/DR330_4.png" alt="" /></li>
                    </ul>
                          <a href="javascript:;" class="R730_btn1"><img src="${IncPath}/images/R730_btn1.png" alt="" /></a> <a href="javascript:;" class="R730_btn2"><img src="${IncPath}/images/R730_btn2.png" alt="" /></a>
                </div>

        </div>
    </div>
    <div class="tedian_box">
        <div class="R730_xian">
            <span class="fon_24 fon_w hui_f bac_3 R730_sp">PowerEdge R330 特点</span>
        </div>
         <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">自动化创新管理</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1">Dell OpenManage 系统管理产品组合包含多种创新型解决方案， 可简化并自动执行管理任务，使 IT 运营更加高效，并提升服务器整个生命周期内的成本效益。PowerEdge 中嵌入了带生命周期控制器的 iDRAC 技术，该技术可提供无可比拟的免代理功能，让服务器部署、 配置和更新变得快捷、可靠、轻松。R330 的监视和控制功能由 OpenManage Essentials 提供，并且还通过 OpenManage Mobile 随时随地支持移动访问。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_3"><img src="${IncPath}/images/330_1.png"></div>
        </div>
    </div>

     <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/330_2.png"></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">用途更广大</span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">利用最多四个内置 3.5 英寸有线或热插拔硬盘，或最多八个 2.5 英寸热插拔硬盘，应对数据增长需求。利用四个 DIMM 插槽逐步增加内存容量，这些插槽最多支持 64 GB的 DDR4 内存，可提高应用程序性能并缩短响应时间。利用支持 Microsoft® Windows Server® with Hyper-V®、VMWare® vSphere® ESXi® 和 Red Hat® Enterprise Virtualization 的虚拟化就绪型服务器，灵活地适应不断变化的工作负载条件。</span>
            </li>                
        </ul>
       
    </div>
</div>


             <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">性能卓越提升</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1"> 借助最多两个可选的 1.8 英寸固态硬盘，加快系统启动速度。与DDR3 相比，DDR4 内存可将内存性能提高 33%。与 PCIe 2.0 相比，两个 PCIe 3.0 插槽将数据吞吐量提升了两倍，从而增强 I/O 性能。与前一代R320/PERC8相比，R330/PERC9将IOPS性能提高了两倍。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_4"><img src="${IncPath}/images/330_3.png"></div>
        </div>
    </div>
         <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/330_4.png"></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">极致运营效率</span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">利用 Dell OpenManage 系统管理解决方案顺畅、快速地部署。英特尔®至强®处理器E3-1200 v5系列的每个内核都能多提供33 %的高速缓存，让您的应用程序发挥最大效用。利用简单、直观的 Dell OpenManage Essentials 控制台轻松地监控系统运行情况和行为。利用热插拔硬盘和电源，获得更大便利性和高可用性保护。 </span>
            </li>                
        </ul>
       
    </div>
</div>
    </div>

   <!--  配置参数 -->
   <div class="R730_pz_t fon_24 bac_3 hui_f fon_w">配置参数</div>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">基本资料</dt>
       <dd >产品型号：PowerEdge R330 <br />
     产品类型：单路至强1U机架式服务器 <br />
     产品尺寸：高度：43mm（1.69英寸）x宽度：4.34cm（17.08英寸）x深度：6.25cm（24.60英寸） <br />


        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">处理器</dt>
       <dd >处理器型号：英特尔®至强® E3-1220 v5 <br />
            标配数量/最大支持数量：  1颗/1颗 <br />
             处理器主频/缓存： 3.0Ghz/ 8 M <br />
             插槽数量/QPI：  2个PCIe插槽 <br />




        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">芯片组</dt>
       <dd > 芯片组：    Intel C236
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">内存</dt>
       <dd >标配容量/最大支持： 1x2GB/64GB <br />
      内存类型/工作频率： ECC自动纠错/2133Mhz <br />
      内存插槽数量：  4个DIMM插槽 <br />
        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">硬盘</dt>
       <dd >     标配容量/最大支持：500GB 7.2K RPM SATA 6Gbps 3.5英寸热插拔硬盘*1块/最大支持4块盘 
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">RAID控制器</dt>
       <dd > 内置PERC S110 阵列控制器（支持raid0,1,5,10）
        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">网卡</dt>
       <dd >     网卡控制器：集成Broadcom 5720双端口千兆以太网卡；
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">光驱装置</dt>
       <dd >类型：DVDRW
        </dd>
   </dl>
         <dl class="R730_dl bd_last">
       <dt class="red fon_16 fon_w">电源</dt>
       <dd > 类型：热插拔单电源,350瓦
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
           <div><img src="${IncPath}/images/fuwuliucheng.png" height="78" width="948" alt="" /></div>
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
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>
