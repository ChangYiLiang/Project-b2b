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
<script type="text/javascript" src="${IncPath}/js/SYS-5018D-MF.js"></script>
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
		
		<input type="hidden" name="goodsId" value="29">
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
							<option selected="selected">美超微1U-SYS-5018D-MF</option>
							<option>美超微1U-SYS-5018D-MTF</option>
							<option>美超微1U-5019S-M</option>
							<option>美超微2U-6028R-T</option>
							<option>美超微2U-2028R-C1R</option>
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
									<option selected value="2800" id="443">X11SSL-F</option>
								</select>
							</li>
							 <li>
								<span class="P_m">处理器 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="2400" id="444">Intel® Xeon® Processor E3-1265L v4 (6M Cache, 2.30 GHz)[RMB2400.00]</option>
									<option value="3000" id="445">Intel® Xeon® Processor E3-1285 v4 (6M Cache, 3.50 GHz)[RMB3000.00]</option>
									<option value="2800" id="446">Intel® Xeon® Processor E3-1285L v4 (6M Cache, 3.40 GHz)[RMB2800.00]</option>
								</select>	
							</li>
							
							<li>
								<span class="P_m">芯片组 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="458">英特尔®C222服务器芯片组</option>
								</select>
							</li>
							
						   <li>
								<span class="P_m">内存 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="250" id="447">4GB DDR3 ECC 1600MHz[RMB250.00]</option>
									<option value="450" id="448">8GB DDR3 ECC 1600MHz[RMB450.00] </option>
									<option value="950" id="449">16GB DDR3 ECC 1600MHz[RMB950.00] </option>
									<option value="1800" id="450">32GB DDR3 ECC 1600MHz[RMB1800.00] </option>
								</select>
							</li>
							 <li>
								<span class="P_m">硬盘 :</span>
								<select class="form-control selectpicker">
									<option selected="selected" value="550" id="433">500GB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块[RMB550.00]</option>
									<option value="700" id="434">1TB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块[RMB700.00]</option>
									<option value="1000" id="435">2TB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块[RMB1000.00]</option>
									<option value="1200" id="436">3TB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块[RMB1200.00]</option>
									<option value="1300" id="437">4TB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块[RMB1300.00]</option>
									<option value="2400" id="506">6TB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块（2块3.5可选）[RMB2400.00]</option>
								</select>
							</li>
							 <li>
								<span class="P_m">网卡 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="451">英特尔®i217LM+英特尔®i210AT以太网控制器（内置）</option>
								</select>
							</li>
							 <li>
								<span class="P_m">RAID配置 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="452">RAID 0、1可选</option>
								</select>
							</li>
							 <li>
								<span class="P_m">PCIe插槽 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="453">PCI-E 3.0 x8 （in x16）全高插槽x1个</option>
								</select>
							</li>
							  <li>
								<span class="P_m">电源 :</span>
								<select class="form-control selectpicker" >
									<option selected="selected" value="0" id="454">350W 低噪交流电源持续供电</option>
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
                        <span class="tit_1 fon_24 hui_3 ">SuperServerSYS-5018D-MF</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1">SYS-5018D-MF是1U的单路机架式服务器，结构紧凑，节省空间，更适合成长型企业。适合中小企业的服务器不仅需要满足其性能、扩展性、管理性方面的要求，更需要这些特性与成本间取得一个平衡。5018D-MF舍弃了非关键特性，将企业所需的全部关键特性，融入到5018D-MF紧凑的1U机身之中，实现了性能与成本的完美平衡。
                        </span>
                    </li>

                </ul>
            </div>
                <div class="M_box_L_2  R730_2 ">
                    <ul class="R930_2">
                        <li class="R730_w_1 R230_1"><img src="${IncPath}/images/Sup_5018dmf_2.png" height="317" width="416" alt="" /></li>
                         <li class="R730_w_1 R230_1"  style="padding-left:5px;"><img src="${IncPath}/images/Sup_5018dmf_1.png" height="317" width="416" alt="" /></li>
                          <li class="R730_w_1 R230_1" style="margin-left:10px"><img src="${IncPath}/images/Sup_5018dmf_2.png" height="317" width="416" alt="" /></li>
                            <li class="R730_w_1 R230_1"><img src="${IncPath}/images/Sup_5018dmf_3.png" height="317" width="416" alt="" /></li>
                    </ul>
                          <a href="javascript:;" class="R730_btn1"><img src="${IncPath}/images/R730_btn1.png" alt="" /></a> <a href="javascript:;" class="R730_btn2"><img src="${IncPath}/images/R730_btn2.png" alt="" /></a>
                </div>

        </div>
    </div>
    <div class="tedian_box">
        <div class="R730_xian">
            <span class="fon_24 fon_w hui_f bac_3 R730_sp">SuperServerSYS-5018D-MF 特点</span>
        </div>
         <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">均衡性能 最佳组合</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1">基于英特尔至强E2 1265 v4处理器，支持最高达32GB 的ECC内存，用户还可随需选配最高容量达6TB的SATA硬盘并支持双端口千兆网卡。为数据中心解决方案提供了最佳的性能和效率组合，完美解决数据中心能耗危机。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_3"><img src="${IncPath}/images/su_5019s_1.png" height="286" width="482" alt="" /></div>
        </div>
    </div>

     <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/su_5019s_3.png" height="286" width="482" alt="" /></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">性能优化 适配主流处理器</span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">支持英特尔®Xeon®处理器e3-1200 3代和4代，第四代酷睿i3，奔腾，赛扬处理器。搭配350W黄金级电源供电，将提供更高的效率，更低的功耗，呈现超强竞争力的性能功耗比和性能价格比。</span>
            </li>                
        </ul>
       
    </div>
</div>


             <div class="L_box  ">
        <div class="M_box">
        
            <div class="M_box_R tiyan_3 R730_1 ">
                <ul class="M_box_R ">
                    <li class="H_t">
                        <span class="tit_1 fon_24 hui_3 ">自动化监控 易于管理</span>
                        <div class="tit_xian"></div>
                    </li>
                    <li class="H_wen">
                        <span class="w_1"> IPMI 2.0支持，用户可以利用IPMI监视服务器的物理健康特征，如温度、电压、风扇工作状态、电源状态等。通过检查系统事件日志 (SEL)，可以更轻松的预先判定故障组件，是管理多地点数据中心和分支办公室的理想技术。</span>
                    </li>

                </ul>
            </div>

                         <div class="M_box_L_2 R730_4"><img src="${IncPath}/images/su_h12_5.png" height="286" width="482" alt=""  /></div>
        </div>
    </div>
         <div class="L_box ">
    <div class="M_box">
     <div class="M_box_L_2 tiyan_6" style="margin-top:36px;"><img src="${IncPath}/images/su_h12_4.png" height="286" width="482" alt=""  /></div>
      <ul class="M_box_R">
            <li class="H_t">
                <span class="tit_1 fon_24 hui_3 ">苛求质量与高品质</span>
                <div class="tit_xian"></div>
            </li>
            <li class="H_wen">
                <span class="w_1">遵照严格的设计、实施、制造标准和ISO 标准，为确保即使在极端的工作条件下仍能达到出色性能，服务器都会接受高强度计算测试。这些质保措施不仅优化了系统性能，还尽可能降低了系统的宕机概率。 </span>
            </li>                
        </ul>
       
    </div>
</div>
    </div>

   <!--  配置参数 -->
   <div class="R730_pz_t fon_24 bac_3 hui_f fon_w">配置参数</div>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">基本资料</dt>
       <dd >产品型号：SYS-5018D-MF<br />
              产品类型：1 U机架式服务器<br />
            产品尺寸：高度：43mm（1.7英寸）x宽度：437mm（17.2英寸）x深度：369mm（14.5英寸） <br />


        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">处理器</dt>
       <dd >   处理器型号：Intel® Xeon® Processor E3-1265L v4 (6M Cache, 2.30 GHz)<br />
            标配数量/最大支持数量： 1颗<br />
               处理器主频/缓存： 2.30Ghz/6M<br />
            插槽数量：4个 <br />



        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">芯片组</dt>
       <dd > 芯片组：   英特尔®C222服务器芯片组
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">内存</dt>
       <dd > 标配容量/最大支持： 4GB/32GB  <br />
        内存类型/工作频率： ECC自动纠错/1600Mhz<br />
         内存插槽数量：支持DDR3<br />



        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">硬盘</dt>
       <dd >   标配容量/最大支持：500GB 7.2K RPM SATA 6Gbps 3.5英寸(企业级)硬盘x1块
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">RAID控制器</dt>
       <dd > RAID 0、1可选
        </dd>
   </dl>
   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">PCIe插槽</dt>
       <dd >M.2 接口x1个 <br />
             PCI-E 3.0 x8 AOC插槽x1个
        </dd>
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">网卡</dt>
       <dd >  网卡控制器：英特尔®i217LM+英特尔®i210AT以太网控制器（内置）
   </dl>
         <dl class="R730_dl">
       <dt class="red fon_16 fon_w">IPMI</dt>
       <dd > 支持IPMI 2.0智能平台管理接口  <br />
              PMI 2.0虚拟媒体支持；KVM Over Lan / KVM Over IP支持<br />
                IPMI组件：Aspeed AST2400 10/100/1000M bps  <br />

        </dd>
   </dl>

   <dl class="R730_dl">
       <dt class="red fon_16 fon_w">光驱装置</dt>
       <dd >类型：DVD-ROM
        </dd>
   </dl>
         <dl class="R730_dl bd_last">
       <dt class="red fon_16 fon_w">电源</dt>
       <dd >类型：350W 低噪交流电源持续供电
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
