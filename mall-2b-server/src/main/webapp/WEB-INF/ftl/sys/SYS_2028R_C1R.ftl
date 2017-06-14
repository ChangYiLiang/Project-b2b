<!doctype html>
<html>
<head>
<meta charset="utf-8">
<!--用百度的静态资源库的cdn安装bootstrap环境-->
<!-- Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<!--font-awesome 核心我CSS 文件-->
<link href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${IncPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/css/ibm.css" />
<link rel="stylesheet" type="text/css" href="${IncPath}/css/fuwuqi.css" />

<!-- 在bootstrap.min.js 之前引入 -->
<script src="${IncPath}/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${IncPath}/js/2028R-C1R.js"></script>
<script type="text/javascript" src="${IncPath}/js/fuwuqi.js"></script>

<title>SuperServer  SYS-5019S-L</title>

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
</head>

<#include "../header.ftl" >

<!--订购UI-->
<div class="Large_box">
  <#if user ??>
		<form action="${BasePath}/controller/product/addHardware.do"  method="post"  autocomplete="off">
	<#else>
		<form action="${url}"method="post"  autocomplete="off" onsubmit="location='${CasPath}/login?service=${url}';return false;">
	</#if>
		<input type="hidden" name="orderCycle" id="orderCycle" value="1">
 		<input type="hidden" name="number" id="number" value="1">

		<input type="hidden" name="goodsId" value="33">
		<input type="hidden" name="pay" id="pay">
		<input type="hidden" name="config" id="config">
		<input type="hidden" name="idlink" id="id">
	
		<div class="M_box">
			<div class="T_tit">美超微服务器整机订购</div>
			<div class="M_left_box">
				<ul class="P_control">
					<li>
						<span class="P_m">型号 :</span>
						<select class="form-control selectpicker" id="select">
							<option>美超微1U-SYS-5019S-L</option>
							<option>美超微1U-SYS-5018D-MF</option>
							<option>美超微1U-SYS-5018D-MTF</option>
							<option>美超微1U-5019S-M</option>
							<option>美超微2U-6028R-T</option>
							<option selected="selected">美超微2U-2028R-C1R</option>
							<option>美超微3U-5038ML-H12TRF</option>
							<option>美超微3U-5038ML-H24TRF</option>
						</select>
					</li>
				</ul>
				
				<ul class="U_control">
					<li>
						<ul class="P_box0">
							<li>
								<span class="P_m">主板 :</span>
								<select class="form-control selectpicker" >
									<option selected value="12000" id="474">X10DRH-C</option>
								</select>
							</li>
							 <li>
								<span class="P_m">处理器 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="1200" id="463">Intel® Xeon® Processor E5-2603 v3 (15M Cache, 1.60 GHz)X2[RMB1200.00]</option>
									<option value="1800" id="464">Intel® Xeon® Processor E5-2609 v3 (15M Cache, 1.90 GHz)X2[RMB1800.00]</option>
									<option value="2500" id="465">Intel® Xeon® Processor E5-2620 v3 (15M Cache, 2.40 GHz)X2[RMB2500.00]</option>
									<option value="2600" id="466">Intel® Xeon® Processor E5-2623 v3 (10M Cache, 3.00 GHz)X2[RMB2600.00]</option>
									<option value="3500" id="467">Intel® Xeon® Processor E5-2630 v3 (20M Cache, 2.40 GHz)X2[RMB3500.00]</option>
								</select>	
							</li>
							
							<li>
								<span class="P_m">芯片组 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="475">英特尔®C612服务器芯片组</option>
								</select>
							</li>
							
						   <li>
								<span class="P_m">内存 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="600" id="429">8GB8GB DDR4 ECC 2133Mhz[RMB600.00] </option>
									<option value="1200" id="430">16GB DDR4 ECC 2133Mhz[RMB1200.00] </option>
									<option value="2400" id="431">32GB DDR4 ECC 2133Mhz [RMB2400.00]</option>
									<option value="4800" id="432">64GB DDR4 ECC 2133Mhz [RMB4800.00]</option>
									<option value="9600" id="469">128GB DDR4 ECC 2133Mhz （16个插槽，最高1T）[RMB9600.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">硬盘 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="3500" id="476">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x1块[RMB3500.00]</option>
									<option value="7000" id="477">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x2块[RMB7000.00]</option>
									<option value="10500" id="478">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x3块[RMB10500.00]</option>
									<option value="14000" id="479">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x4块[RMB14000.00]</option>
									<option value="17500" id="480">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x5块[RMB17500.00]</option>
									<option value="21000" id="483">1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x6块（最高12块2.5寸）[RMB21000.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">网卡 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="481">英特尔®i350千兆以太网控制器（内置）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">RAID配置 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="440">RAID 0、1、5、10可选</option>
								</select>
							</li>
							 <li>
								<span class="P_m">PCIe插槽 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="488">PCI-E 3.0 x8 插槽 x6个</option>
									<option value="0" id="489">PCI-E 3.0 x16 插槽 x1个</option>
								</select>
							</li>
							  <li>
								<span class="P_m">电源 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="482">920W 直流交流高功率冗余电源持续供电</option>
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
<div class="box_center">
    <div class="L_box bac_f ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 " style="margin-top:-60px">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">SuperServerSYS-2028R-C1R</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1">SYS-2028R-C1R凭借出众的存储密度、高度灵活的设计和超可靠的性能，跨越多个行业支持广泛的工作负载，而高度集成化的设计让SYS-2028R-C1R在性能和扩展能力方面都有着不错的表现。服务器具有比上一代产品更多的处理器内核、更大的内存和更高的I/O带宽，可为中小企业用户、大型企业和组织的部门和远程办公室提供更高的性能，让服务器发挥出更出色成效。
                        </span>
                    </li>

                </ul>
            </div>
                <div class="M_box_L_2  R730_2 ">
                    <ul class="R930_2">
                        <li class="R730_w_1 R230_1"><img src="${IncPath}/images/Sup_2028r_1.png" height="317" width="416" alt="" /></li>
                         <li class="R730_w_1 R230_1"  style="padding-left:5px;"><img src="${IncPath}/images/Sup_2028r_2.png" height="317" width="416" alt="" /></li>
                          <li class="R730_w_1 R230_1" style="margin-left:10px"><img src="${IncPath}/images/Sup_2028r_3.png" height="317" width="416" alt="" /></li>
                            <li class="R730_w_1 R230_1"><img src="${IncPath}/images/Sup_2028r_4.png" height="317" width="416" alt="" /></li>
                    </ul>
                          <a href="javascript:;" class="R730_btn1"><img src="${IncPath}/images/R730_btn1.png" alt="" /></a> <a href="javascript:;" class="R730_btn2"><img src="${IncPath}/images/R730_btn2.png" alt="" /></a>
                </div>

        </div>
    </div>
    <div class="tedian_box">
        <div class="R730_xian">
            <span class="fon_24 fon_w hui_f bac_3 R730_sp">SuperServerSYS-2028R-C1R特点</span>
        </div>
         <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">出众散热性能 白金级电源支持</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1">采用英特尔®Xeon®处理器 E5-2600 v3 系列，CPU满负荷运行时散热量可达145W，通过920W白金级冗余电源供电，通过80PLUS白金级认证(转化率>94%），在保证供电稳定性的同时，极大的降低了电力消耗，节省了服务器运营的总成本。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_3"><img src="${IncPath}/images/su_h12_4.png" height="286" width="482" alt="" /></div>
        </div>
    </div>

     <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/su_5019s_2.png" height="286" width="482" alt="" /></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">强劲扩展 为云服务而生</span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">服务器拥有8个2.5"硬盘位，支持SATA3接口的热插拔硬盘，最高容量为6TB，为云数据提供了充足的存储空间。另外服务器还提供1个PCI-E 3.0 x16扩展插槽和6个PCI-E 3.0x8扩展插槽，方便外接其他存储设备，为您构建毫无存储压力的云系统。</span>
            </li>                
        </ul>
       
    </div>
</div>


             <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">体积小巧、节能环保</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1"> 服务器的设计非常紧凑，方便地集成进深度只有27"的紧凑型2U机箱中，可有效节省空间，大大降低托管的费用。同时服务器使用先进的冷却区域控制、通过巧妙合理的风道设计给系统降温，具有绿色环保的能耗特性。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_4"><img src="${IncPath}/images/su_h12_1.png" height="286" width="482" alt="" /></div>
        </div>
    </div>
         <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/su_5019s_3.png" height="286" width="482" alt="" /></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">易于维护、省时省力 </span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">服务器的每个节点都集成了IPMI管理模组和显示芯片，可通过KVM接口扩展出USB接口，连接显示器和鼠标键盘，方便管理人员的维护。通过一个单独的备用网口来连接英特网，使管理人员可以在任何地点远程维护服务器，节省后期维护的人力物力和时间。 </span>
            </li>                
        </ul>
       
    </div>
</div>
    </div>

   <!--  配置参数 -->
   <div class="R730_pz_t fon_24 bac_3 hui_f fon_w">配置参数</div>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">基本资料</dt>
       <dd >产品型号：SYS-2028R-C1R<br />
             产品类型：2U机架式服务器<br />
             产品尺寸：高度：89mm（3.5英寸）x宽度：490mm（19英寸）x深度：680mm（27英寸） <br />


        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">处理器</dt>
       <dd > 处理器型号：Intel® Xeon® Processor E5-2603 v3 (15M Cache, 1.60 GHz)X2<br />
            标配数量/最大支持数量： 2颗<br />
               处理器主频/缓存： 1.60Ghz/15M<br />
            插槽数量：4个 <br />



        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">芯片组</dt>
       <dd > 芯片组：英特尔®C612服务器芯片组
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">内存</dt>
       <dd >标配容量/最大支持： 8GB/1TB  <br />
        内存类型/工作频率： ECC自动纠错/2133Mhz<br />
        内存插槽数量：支持DDR4 <br />



        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">硬盘</dt>
       <dd > 标配容量/最大支持：1TB 7.2K RPM SATA 6Gbps 2.5英寸(企业级)硬盘x1块/12块
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">RAID控制器</dt>
       <dd > RAID 0、1、5、10可选
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">PCIe插槽</dt>
       <dd >PCI-E 3.0 x8 插槽 x6个 <br />
             PCI-E 3.0 x16 插槽 x1个

        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">网卡</dt>
       <dd >  网卡控制器：英特尔®i350千兆以太网控制器（内置）
        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">IPMI</dt>
       <dd > 支持IPMI 2.0智能平台管理接口  <br />
               IPMI 2.0虚拟媒体支持；KVM Over Lan / KVM Over IP支持<br />
                IPMI组件：Aspeed AST2400 BMC  <br />

        </dd>
   </dl>

   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">光驱装置</dt>
       <dd >类型：DVD-ROM
        </dd>
   </dl>
         <dl class="R730_dl bd_last">
       <dt class="red fon_16 fon_w">电源</dt>
       <dd >类型：920W 直流交流高功率冗余电源持续供电
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
         <dl class="R730_dl no_bdc">
     <dt class="red fon_16 fon_w fuwu_zixun10 fuwu_zixun2">增值运维服务</dt>
       <dd>  九河互联拥有一支专业的技术工程师团队，可以为客户提供数据中心级运维增值服务，如日常服务器代维、服务器集群、负载均衡、内网组建等，客户仅需支付较少的费用，即可实现业务技术上的突飞猛进，详情请咨询客服人员）。
        </dd>
   </dl>
</div>

<#include "../footer.ftl" >

</body>
<script src="${BasePath}/scripts/custom/ex.js"></script>
</html>
