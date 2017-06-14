<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye2.css" />
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/bannerLoopAll.js"></script>
<script>
    $(function(){
		  breathLoop6(3000);
		  breathLoop7(3000);
		  breathLoop8(3000);
    });
</script>

<!--导航部分-->
<!--首页banner-->
<div class="shouye_banner2s">
      <div class="lunbo_ziying2s">
    <div class="bannerLoop bannerLoop8 ">
          <ul>
        <li><a href="http://www.9he.com/mall/81.html" target="_blank" ><img src="${BasePath}/images/2bmain/index_banner2.jpg"  alt=""/></a></li>
        <li><a href="http://www.9he.com/i9he/trust.do?goodsId=163" target="_blank"><img src="${BasePath}/images/2bmain/tu2_banner.jpg"  alt=""/></a></li>
                <li><a href="http://www.9he.com/jr/shezhang.html" target="_blank"><img src="${BasePath}/images/2bmain/index_bannner1.jpg"  alt=""/></a></li>
        
      </ul>
          <ol>
        <li class="current"></li>
        <li></li>
        <li></li>
      </ol>
        </div>
  </div>
   </div>
   <!--end首页bannner-->
   
   <!--在线需求提交-->
  <div class="xuqiu-online-warp clearfix">
      <div class="xunqiu-online clearfix">
          <div class="xq-online-l">
              <h3>在线提交需求</h3>
              <p>免费获取最佳解决方案</p>
          </div>
          <div class="xq-online-m">
              <p >花2分钟即可享受50名专业工程师免费为您定制业务解决方案</p>
              <iframe src="" class="hidden" frameborder="0" name="upload" style="display:none"></iframe>
			<form class="hidden" action="${FileStoreService}" id="uploadform" method="post" target="upload" enctype="multipart/form-data"  style="display:none">
				<input name="cburl" type="hidden" value="${BasePath}/uploadcallback.jsp"/>
				<input type="file" name="file" id="uploadfile" multiple onchange="document.getElementById('uploadform').submit()" />
			</form>
              <form method="post" action="${BasePath}/purchase/offer.do" id="requirementForm">
              	<input type="hidden" name="requirement.type" value="2" />
                  <div class="xq-m-l" style="margin-top:-17px">
                  	  <input type="hidden" name="redirect" value="${BasePath}"/> <br />
                      <input type="text" required data-error-container="#none" name="requirement.contact" id="contact" placeholder="您的称呼" class="xq-name"/> <br />
                      <textarea required data-error-container="#none" name="requirement.description" id="description" class="xq-xiangxi" placeholder="您可以在这里详细描述您的需求"></textarea>
                  </div>
                  <div class="xq-m-r">
                      <input type="text" required data-error-container="#none" name="requirement.phone" id="phone" placeholder="您的联系电话/邮箱" class="xq-tel"/> <br />
                      <input type="button" class="xq-m-sc" onclick="document.getElementById('uploadfile').click()" value="添加附件" />               
                      <span class="xq-m-gs">支持jpg、png、txt、doc、xls、pdf格式</span> <br />
                      
                      
                      <div class="form-group" id="filelist">
			
					 </div>
                      
                      <input type="submit" value="免费获取方案" class="btn"/>
                  </div>
              </form>
          </div>
          <div class="xq-online-r">
              <dl>
                  <dt><a href="javascript:;" onclick="ysf.open();"><img src="${BasePath}/images/2bmain/index_xq1.png" alt=""></a></dt>
                  <dd><a href="javascript:;" onclick="ysf.open();">方案咨询</a></dd>
              </dl>
              <dl>
                  <dt><a href="http://www.9he.com/mark/bespoke.do"><img src="${BasePath}/images/2bmain/index_xq1.png" alt=""></a></dt>
                  <dd><a href="http://www.9he.com/mark/bespoke.do">预约上门</a></dd>
              </dl>
              <dl>
                  <dt><a href="javascript:;"><img src="${BasePath}/images/2bmain/index_xq1.png" alt=""></a></dt>
                  <dd><a href="http://www.9he.com/about/jinrong.do">河马赊账</a></dd>
              </dl>
              <dl>
                  <dt><a href="javascript:;" onclick="ysf.open();"><img src="${BasePath}/images/2bmain/index_xq1.png" alt=""></a></dt>
                  <dd><a href="javascript:;" onclick="ysf.open();" >硬件租赁</a></dd>
              </dl>
          </div>
      </div>
  </div>
   <!--end在线需求提交-->
   
<!--一站式服务-->
<div class="yizhanshi clearfix">
      <div class="title1">企业一站式生态服务<span class="fugai">覆盖企业完整生命周期</span></div>
      <div class="zizhanz" style="margin-top:-20px">
    <div class="yizhanshiwen">
          <div class="yzsp1">方案设计咨询</div>
          <div class="yzsp2">覆盖企业项目初期：内部IT、数据中心需求方案咨询、建设...</div>
        </div>
  </div>
      <div class="yizhanr" style="margin-top:-20px">
    <div class="yzsyz" >
          <div class="yzss">
        <div class="yizhanshiwen2">
              <div class="yzsp12">企业金融、生态</div>
              <div class="yzsp2">面向企业采购提供信用分期支付、数据中心减免等一系列生态服务</div>
            </div>
      </div>
          <div class="yzsx">
        <div class="yzsx2l">
              <div class="yizhanshiwen3">
            <div class="yzsp12">IT硬件采购</div>
            <div class="yzsp2">自营正品、生态减免、租赁服务，让采购更轻松实惠...</div>
          </div>
            </div>
        <div class="yzsx2r">
              <div class="yizhanshiwen3">
            <div class="yzsp12">数据中心服务</div>
            <div class="yzsp2">私有云及亚太高标准数据中心网络、场地租赁、带宽...</div>
          </div>
            </div>
      </div>
        </div>
    <div class="yzsyy">
          <div class="yizhanshiwen4">
        <div class="yzsp12">专业技术运维</div>
        <div class="yzsp2">从项目筹划、实施到未来发展运营，<br>
              九河网提供全面专业的技术支持...</div>
      </div>
        </div>
  </div>
    </div>
<!--自营产品-->
<div class="ziying1 clearfix">
      <div class="title1">数据中心服务器采购</div>
      <div class="ziying1_1 clearfix">
    <div style="height:400px !important;margin-top:-20px" class="lunbo_ziying">
          <div  class="bannerLoop bannerLoop6">
        <ul>
              <li><a href="http://www.9he.com/mall/81.html"><img src="${BasePath}/images/2bmain/ziying1.png"  alt="" /></a></li>
              <li><a href="http://www.9he.com/mall/81.html"><img src="${BasePath}/images/2bmain/ziying1_1.png"  alt="" /></a></li>
            </ul>
        <ol>
              <li class="current"></li>
              <li></li>
            </ol>
      </div>
        </div>
    <div class="xuancuan clearfix" style="margin-top:-20px;height:75px"> 
    	<div class="xuancuan-left">
    		热门导购
    	</div>
    	<div class="xuancuan-right">
    		<a href="http://www.9he.com/mall/81.html">戴尔R230入门机架服务器 性价比超乎想象 <br /></a>
    		<a href="http://www.9he.com/mall/16.html">“芯”产品新选择！戴尔R730服务器狂降钜惠 <br /></a>
    		<a href="http://www.9he.com/mall/14.html">0元购机，免费托管！尽在九河网生态采购<br /></a>
    	</div>
    </div>
  </div>
      <div class="ziying_r clearfix" style="margin-top:-20px">
    <ul class="shouye_ziying_1 clearfix">
          <li> <a href="http://www.9he.com/mall/81.html" target="_blank">
            <div class="remai1">热卖</div>
            <img src="${BasePath}/images/2bmain/ziyingr230.png" alt="r230">
            <div class="ziying_jg">DELL R230单路1U入门机架 较高性能I/O <br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong"> ￥4300.00元起</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/14.html" target="_blank">
            <div class="remai2">新品</div>
              <img src="${BasePath}/images/2bmain/ziyingr530.png" alt="r530">
            <div class="ziying_jg">DELL R530 单路2U机架 静音设计<br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong"> ￥8500.00元起</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/16.html" target="_blank">
            <div class="remai3">口碑</div>
              <img src="${BasePath}/images/2bmain/ziyingr730.png" alt="r730">
            <div class="ziying_jg">DELL R730 单路2U机架 强悍性能 <br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong">  ￥9500.00元起</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/91.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_ibm.png" alt="">
            <div class="ziying_jg">IBM x3250 M5 5458i21  2U机架 可靠性强 <br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong">￥14300</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/100.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_rh2283.png"  alt="r230">
            <div class="ziying_jg">华为RH2288 V3 双路2U机架 高扩展性<br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong">￥9058.00元起</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/102.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_hw5288.png"  alt="r230">
            <div class="ziying_jg">华为5288 V3 双路4U机架 超大存储容量 <br />
            <span class="ziying_qs">免费托管  分期支付</span><br />
            <span class="jiage_hong">￥14948.00元起</span> </div>
            </a>
    </ul>
      <div class="ziying-situbiao clearfix">
  	<a href="http://www.9he.com/mall/81.html" class="ziying-xz1"></a>
  	<a href="http://www.9he.com/mall/81.html" class="ziying-xz2"></a>
  	<a href="http://www.9he.com/mall/99.html" class="ziying-xz3"></a>
  	<a href="http://www.9he.com/mall/106.html" class="ziying-xz4"></a>
  </div>
  </div>

  </div>
<!--数据中心网络设备/配件-->
<div class="ziying1 clearfix">
      <div class="title1">数据中心网络设备/配件</div>
      <div class="ziying1_1 clearfix">
    <div class="lunbo_ziying" style="height:400px !important;margin-top:-20px">
          <div class="bannerLoop bannerLoop7">
        <ul>
              <li><a href="http://www.9he.com/mall/81.html"><img src="${BasePath}/images/2bmain/ziying1.png"  alt="" /></a></li>
              <li><a href="http://www.9he.com/mall/81.html"><img src="${BasePath}/images/2bmain/ziying1_1.png"  alt="" /></a></li>
            </ul>
        <ol>
              <li class="current"></li>
              <li></li>
            </ol>
      </div>
        </div>
    <div class="xuancuan clearfix" style="padding-top:38px;">
    	<div class="xuancuan-top">
    		热搜产品
    	</div>
    	<div class="xuancuan-bottom">
    		<a href="http://www.9he.com/mall/123.html">网络存储</a>
    		<a href="http://www.9he.com/mall/145.html">交换机</a>
    		<a href="http://www.9he.com/mall/158.html">路由器</a>
    		<a href="http://www.9he.com/mall/141.html">线缆</a>
    	</div>
    </div>
  </div>
      <div class="ziying_r clearfix" style="margin-top:-20px">
    <ul class="shouye_ziying_1 clearfix">
          <li> <a href="http://www.9he.com/mall/126.html" target="_blank">
            <div class="remai1">热卖</div>
            <img src="${BasePath}/images/2bmain/index_zy_md3400.png" alt="r230">
            <div class="ziying_jg">戴尔MD3400直连式双控存储器 <br />
            <span class="ziying_qs">高性能磁盘  SAS双机热备</span><br />
            <span class="jiage_hong">￥25740.00元起 </span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/139.html" target="_blank">
            <div class="remai2">新品</div>
              <img src="${BasePath}/images/2bmain/index_zy_hw2100.png" alt="r530">
            <div class="ziying_jg">华为2100 G2/5100高性能存储<br />
            <span class="ziying_qs">负载均衡  冗余可靠</span><br />
            <span class="jiage_hong">联系客服人员询价 </span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/145.html" target="_blank">
            <div class="remai3">口碑</div>
              <img src="${BasePath}/images/2bmain/index_zy_ce5800.png" alt="r730">
            <div class="ziying_jg"> 华为CE5800千兆以太网接入交换机 <br />
            <span class="ziying_qs">灵活定制 支持40GE上行接口</span><br />
            <span class="jiage_hong">  联系客服人员询价</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/141.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_tiaoxian.png" alt="">
            <div class="ziying_jg">  九河网 数据中心专用六类跳线 <br />
            <span class="ziying_qs">250MHz传输频率 30μ镀金工艺</span><br />
            <span class="jiage_hong">￥6.00元/根</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/146.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_ce6800.png"  alt="ce6800">
            <div class="ziying_jg"> 华为CE6800万兆以太网接入交换机<br />
            <span class="ziying_qs"> 高性能、高密度、低时延</span><br />
            <span class="jiage_hong">联系客服人员询价</span> </div>
            </a> </li>
          <li> <a href="http://www.9he.com/mall/158.html" target="_blank"> <img src="${BasePath}/images/2bmain/index_zy_ne16ex.png"  alt="ne16ex">
            <div class="ziying_jg">华为NE16EX多业务企业路由器 <br />
            <span class="ziying_qs">简易部署 强大承载</span><br />
            <span class="jiage_hong">联系客服人员询价</span> </div>
            </a>
    </ul>
      <div class="gb-zx clearfix">
  		<div class="gb-zxl">
  			<h3 class="gb-zxl-h" style="position:relative;top:-30px">企业数据中心采购如何省钱又省心？问问靠谱的人</h3>
  			<span style="position:relative;top:-40px">20名硬件工程师、5年以上数据中心行业经验</span>
  			<a style="position:relative;top:-40px" href="javascript:;" onclick="ysf.open();">立即咨询</a>
  		</div>
  		<div class="gb-zxr" style="position:relative;top:-20px">
  			<h4 class="zxr-h">产品资讯</h4>
            <div class="zxr-jt">
                <a href="javascript:;" id="zxa1"><img src="${BasePath}/images/2bmain/index_jiantouz.png" alt=""></a>
                <span class="zxsz" id="zxsz">1/3</span>
                <a href="javascript:;" id="zxa2"><img src="${BasePath}/images/2bmain/index_jiantouy.png" alt=""></a>
            </div>
            <div class="ul-warp">
                <ul class="gb-zxu clearfix" id="uls">
                    <li>
                        <a href="http://www.9he.com/mall/146.html">· 华为CE6800万兆交换机性能全面详解<br></a>
                        <a href="http://www.9he.com/mall/158.html">· 企业级网络设备采购季：路由器如何选<br></a>
                        <a href="http://www.9he.com/mall/141.html">· 九河网数据中心跳线传输频率怎么样<br></a>
                    </li>
                    <li>
                        <a href="http://www.9he.com/mall/146.html">· 华为CE6800万兆交换机性能全面详解<br></a>
                        <a href="http://www.9he.com/mall/158.html">· 企业级网络设备采购季：路由器如何选<br></a>
                        <a href="http://www.9he.com/mall/141.html">· 九河网数据中心跳线传输频率怎么样<br></a>
                    </li>
                    <li>
                        <a href="http://www.9he.com/mall/146.html">· 华为CE6800万兆交换机性能全面详解<br></a>
                        <a href="http://www.9he.com/mall/158.html">· 企业级网络设备采购季：路由器如何选<br></a>
                        <a href="http://www.9he.com/mall/141.html">· 九河网数据中心跳线传输频率怎么样<br></a>
                    </li>
                </ul>
            </div>
  		</div>
  </div>
  </div>
  </div>
  <!--服务器托管-->
  <div id="sy-tg">
  	<div class="title1">数据中心服务器托管
  		<a href="javascript:;" class="more">更多>>></a>
  	</div>
  	<div class="sy-tg-top clearfix" style="margin-top:-20px">
  		<div class="sy-tg-tl" style="width:386px">
  			<h3>超大规模数据中心遍布全球</h3>
            <a href="http://www.9he.com/i9he/trust.do?goodsId=163" class="tl-yt">了解九河网亚太数据中心</a>
  		</div>
  		<div class="sy-tg-tr">
            <div class="ul-top clearfix">
                <ul>
                    <li class="tg-tr-li01">
                        香港服务器托管
                    </li>
                    <li class="tg-tr-li02">
                        托管规格：1U <br>
                        机柜功率：<=300W <br>
                        网络线路：国际多线BGP <br>
                        公网带宽：3M <br>
                        公网IP：1个
                    </li>
                    <li class="tg-tr-li03">
                        <span>8000元/年</span>（硬件费用最高全免）
                    </li>
                    <li class="tg-tr-li04">
                        <a href="javascript:;" onclick="ysf.open();">在线咨询</a><a href="http://www.9he.com/i9he/trust.do?goodsId=163" style="border-right: none;">了解详情</a>
                    </li>
                </ul>
                <ul>
                    <li class="tg-tr-li01">
                        深圳服务器托管
                    </li>
                    <li class="tg-tr-li02">
                        托管规格：1U <br>
                        机柜功率：<=300W <br>
                        网络线路：电信/移动单线 <br>
                        公网带宽：100M <br>
                        公网IP：1个
                    </li>
                    <li class="tg-tr-li03">
                        <span>售价：6400元/年</span>（2年送产权）
                    </li>
                    <li class="tg-tr-li04">
                        <a href="javascript:;" onclick="ysf.open();">在线咨询</a><a href="http://www.9he.com/i9he/trust.do?goodsId=165" style="border-right: none;">了解详情</a>
                    </li>
                </ul>
                <ul>
                    <li class="tg-tr-li01">
                        北京服务器托管
                    </li>
                    <li class="tg-tr-li02">
                        托管规格：1U <br>
                        机柜功率：<=300W <br>
                        网络线路：电信/移动单线 <br>
                        公网带宽：100M <br>
                        公网IP：1个
                    </li>
                    <li class="tg-tr-li03">
                        <span>售价：6900元/年</span>（2年送产权）
                    </li>
                    <li class="tg-tr-li04">
                        <a href="javascript:;" onclick="ysf.open();">在线咨询</a><a href="http://www.9he.com/i9he/trust.do?goodsId=167" style="border-right: none;">了解详情</a>
                    </li>
                </ul>
            </div>
            <div class="tg-tr-bottom" onclick="window.open('http://www.9he.com/i9he/trust.do?goodsId=163')">
                <h3 style="margin:0px">九河网IDC托管+硬件采购+河马金融 &nbsp;&nbsp;&nbsp;&nbsp;打通IDC生态服务</h3>
                <span style="margin:0px">◎ 0元采购品牌服务器</span> <span>◎ 免费数据中心托管</span> <span>◎ 先提货，后付款</span>
            </div>
        </div>
  	</div>
  	<div class="sy-tg-bottom clearfix">
            <div class="tg-bottom-l">
                <span>合作客户</span>
            </div>
            <div class="tg-bottom-r">
                <a  class="tg-bottom-a1"><img src="${BasePath}/images/2bmain/index-xg7.jpg" alt=""></a>
                <a  class="tg-bottom-a2"><img src="${BasePath}/images/2bmain/index-xg6.jpg" alt=""></a>
                <a class="tg-bottom-a3"><img src="${BasePath}/images/2bmain/index-xg5.jpg" alt=""></a>
                <a  class="tg-bottom-a4"><img src="${BasePath}/images/2bmain/index-xg4.jpg" alt=""></a>
                <a  class="tg-bottom-a4"><img src="${BasePath}/images/2bmain/index-xg3.jpg" alt=""></a>
            </div>
    </div>
  </div>
<!-- 社交互动 -->
<div class="shejiao">
      <div class="title1" style="border-bottom:none;">社交互动</div>
      <div>
    <ul>
          <li>
        <div class="luntantou"><a href="javascript:;">社区论坛>></a></div>
        <div><img src="${BasePath}/images/2bmain/hudong1.png" height="272" width="230" alt="" /></div>
      </li>
          <li class="shejiao-wx">
        <div class="luntantou"><a href="javascript:;">官方微信>></a></div>
        <div>
            <div class="shejiao-wx-erweima"></div>
            <img src="${BasePath}/images/2bmain/hudong2.png" height="272" width="230" alt="" /></div>
      </li>
          <li onclick ="window.open('https://user.qzone.qq.com/2153800852/main')">
        <div class="luntantou"><a href="javascript:;">QQ空间>></a></div>
        <div><img src="${BasePath}/images/2bmain/hudong3.png" height="272" width="230" alt="" /></div>
      </li>
          <li >
        <div class="luntantou"><a href="https://user.qzone.qq.com/2153800852/main">百度贴吧>></a></div>
        <div><img src="${BasePath}/images/2bmain/hudong4.png" height="272" width="230" alt="" /></div>
      </li>
          <li class="no_margin" onclick ="window.open('http://weibo.com/u/6085640309?topnav=1&wvr=6&topsug=1&is_hot=1')" >
        <div class="luntantou"><a href="http://weibo.com/u/6085640309?topnav=1&wvr=6&topsug=1&is_hot=1">官方微博>></a></div>
        <div><img src="${BasePath}/images/2bmain/hudong5.png" height="273" width="231" alt="" /></div>
      </li>
        </ul>
  </div>
    </div>
<!--友情链接-->
<div class="friendly-link">
    <div class="friendly-banxin">
        <div class="friendly-title">
            <a href="javascript:;" class="current a1"  >友情链接</a>
            <a href="javascript:;" class="a2">产品直达</a>
            <a onclick="window.open('tencent://message/?uin=2534709130&amp;Site=%E7%BE%8E%E5%9B%BD%E6%9C%8D%E5%8A%A1%E5%99%A8&amp;Menu=yes');" href="javascript:;" class="friendly-lian">友链合作</a>
        </div>
        <div>
            <div class="friendly-con1">
                <a href="http://www.9he.com/mall/81.html">戴尔服务器</a>
                <a href="http://www.9he.com/i9he/trust.do?goodsId=163">香港服务器托管</a>
            </div>
            <div class="friendly-con2">
                <a href="http://www.9he.com/mall/81.html">DELL R230</a>
                <a href="http://www.9he.com/mall/14.html">DELL R530</a>
                <a href="http://www.9he.com/mall/16.html">DELL R730</a>
                <a href="http://www.9he.com/mall/99.html">华为服务器</a>
                <a href="http://www.9he.com/mall/145.html">华为交换机</a>
                <a href="http://www.9he.com/mall/123.html">戴尔存储</a>
                <a href="http://www.9he.com/mall/158.html">华为路由器</a>
            </div>
        </div>
    </div>
</div>

<script type="text/html" id="requireAlert" data-icon="info">
	<div style="font-size: 20px;">* 号标记为必填内容</div>
	<br />
	<div style="font-size: 12px; color:#999">请填写必填内容再提交~</div>
</script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="${IncPath}/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script src="${BasePath}/scripts/custom/common.js"></script>
<script src="${BasePath}/scripts/custom/i9he.core.js"></script>
<script>
	$("#requirementForm").i9heValidate();
	$("#requirementForm :submit").click(function() {
		if(!$("#requirementForm").valid()) {
			$("#requireAlert").alert();
		}
	});
</script>
<script>
	function fileupload_callback(data) {
		layer.alertEx({content: "您的文件已上传!", time: 3000});
		data = eval(data)
		for(var i=0; i<data.length; i++) {
			var file = data[i];
			$('<input type="hidden" name="file" />').val(file).appendTo("#filelist")
		}
	}
</script>


<script>
    $(function(){
        $('.friendly-title .a1').click(function(){
            $(this).addClass('current').siblings().removeClass('current');
            $('.friendly-con1').show().siblings().hide();
        })
        $('.friendly-title .a2').click(function(){
            $(this).addClass('current').siblings().removeClass('current');
            $('.friendly-con2').show().siblings().hide();
        })
    })
</script>
<script>
    window.onload =function(){
        var a1 = document.getElementById('zxa1');
        var a2 = document.getElementById('zxa2');
        var cons = document.getElementById('zxsz');
        var uls = document.getElementById('uls');
        var n =0;

        a2.onclick = function () {
            n++;
            if(n == 3){
                n=2;
            }
            uls.style.left = -(n)*263 + 'px';
            cons.innerHTML=n+1+'/'+3;
        }
        a1.onclick = function () {
            n--;
            if(n <= 0){
                n=0;
            }
            uls.style.left = -(n)*263 + 'px';
            cons.innerHTML=n+1+'/'+3;
        }
    }
</script>


