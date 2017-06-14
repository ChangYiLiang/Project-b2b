<script type="text/javascript">
     $(function(){
        breathLoop7(5000);
        $('.de_mous').hover(function(){
           $(this).stop().animate({width:"290px"}).siblings().stop().animate({width:"220px"});
           $(this).children('.de_dians1').show();
        },function(){
            $('.de_mous').stop().animate({width:"238px"});
            $(this).children('.de_dians1').hide();
        })
        var num = 0;
        $('.dey_leftbtn').click(function(){
                num++;
                if(num>1){
                    num = 0;
                }
                var move = num*-959;
                $('.dey_good ul').animate({left:move+'px'});
        })
        $('.dey_rightbtn').click(function(){
                num--;
                if(num<0){
                    num=1;
                }
                var move = num*-959;
                $('.dey_good ul').animate({left:move+'px'});
        })
     })
</script>

<div class="de_banner">
    	<div class="de_center">
         <div class="deb_t">当前位置：服务器采购</div>   
         <div class="deb_b clearfix">
             <div class="deb_l"><img src="${BasePath}/images/2bcatmain/banner2.jpg" height="500" width="400" alt="" / class="banner2_img1">
             <div class="deb_l_btn">限时促销</div>
             </div>
             <div class="deb_r">
                 <div class="banner_lunbo">
                    
                    <div class="bannerLoop bannerLoop7 ">
                        <ul>
                            <li><a href="specials/guoqing.shtml"><img src="${BasePath}/images/2bcatmain/banner_lunbo.png" height="300" width="790" alt="" /></a></li>
                            <li><a href="specials/guoqing.shtml"><img src="${BasePath}/images/2bcatmain/banner_lunbo.png" height="300" width="790" alt="" /></a></li>
                            <li><a href="specials/guoqing.shtml"><img src="${BasePath}/images/2bcatmain/banner_lunbo.png" height="300" width="790" alt="" /></a></li>

                        </ul>
                        <ol>
                            <li class="current"></li>
                            <li></li>
                            <li></li>

                        </ol>
                    </div>
                 </div>
                 <div class="banner_rb">
                     <div class="rb_l">
                            <div class="rb_l_c1">九河服务器采购</div>
                            <div class="rb_l_c2">
                                <div class="c2_lin1"></div>
                                <div class="c2_lin3">会员专享售后特权</div>
                                <div class="c2_lin2"></div>
                            </div>
                     </div>
                     <div class="rb_r">
                         <div class="rb_r1">企业大宗采购、定制</div>
                         <div class="rb_r2"><a href="../caigou/index.shtml">发布采购需求>></a></div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
    </div>
<div class="de_center">
    <!-- 服务 -->
    <div class="de_fuwu">
        <div class="def_l">
            <dl>
                <dt><img src="${BasePath}/images/2bcatmain/fu5.png" height="50" width="50" alt="" /></dt>
                <dd class="defd_1">生态采购</dd>
                <dd class="defd_2">免费数据中心托管</dd>
            </dl>
            <dl>
                <dt><img src="${BasePath}/images/2bcatmain/fu4.png" height="50" width="50" alt="" /></dt>
                <dd class="defd_1">金融服务</dd>
                <dd class="defd_2">分期免息，融资租赁</dd>
            </dl>
            <dl>
                <dt><img src="${BasePath}/images/2bcatmain/fu3.png" height="50" width="50" alt="" /></dt>
                <dd class="defd_1">高端定制</dd>
                <dd class="defd_2">用心创造您的专属</dd>
            </dl>
            <dl>
                <dt><img src="${BasePath}/images/2bcatmain/fu2.png" height="50" width="50" alt="" /></dt>
                <dd class="defd_1">预约上门</dd>
                <dd class="defd_2">服务到家，使用无忧</dd>
            </dl>
            <dl class="def_dl_l">
                <dt><img src="${BasePath}/images/2bcatmain/fu1.png" height="50" width="50" alt="" /></dt>
                <dd class="defd_1">7天价保</dd>
                <dd class="defd_2">完善健壮的价保机制</dd>
            </dl>
        </div>
        <div class="def_r">
            <div class="def_r_z">客服工作台</div>
            <div class="def_r_t">8:00 ~ 19:00</div>
            <div class="def_r_g">400-119-3389</div>
            <a href="javascript;;" class="def_r_zx">在线咨询</a>
        </div>
    </div>
    <!-- 硬件+生态 -->
    <div class="de_yingjian">
        <div class="dey_l">
            <div class="lin_on">
                <div class="lino_1">硬件+生态</div>
                <div class="lino_2">颠覆传统采购模式</div>
            </div>
            <ul class="de_zhinan">
                <li>采购指南</li>
                <li>· 什么是硬件生态？</li>
                <li>· 采购服务器如何分期？</li>
                <li>· 怎样租服务器？如何计费？</li>
                <li><a href="javascript:;">more></a></li>
            </ul>
        </div>
        <div class="dey_r">
        <div class="dey_good_wrp">
            <div class="dey_good">
                <ul>
                    <li>
                         <div class="dey_ico">热销：50台</div>
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li>
                         <div class="dey_ico2">热销<br />50台</div>
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li>
                        
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li class="dey_last">
                         
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li>
                         <div class="dey_ico">热销：50台</div>
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li>
                         <div class="dey_ico2">热销<br />50台</div>
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li>
                        
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                    <li class="dey_last">
                         
                        <span><img src="${BasePath}/images/2bcatmain/good1.png" height="31" width="171" alt="" /></span>
                        <span class="dey_sp1">Dell  PowerEdge  R230</span>
                        <span class="dey_sp2">单路1U入门机架 较高性能I/O 非热插拔</span>
                        <span class="dey_sp3">免费托管 分期免息</span>
                        <span class="dey_sp4">商城价：￥7150.00元</span>
                        <div class="dey_pinc">
                            <a href="javascript:;">选配</a>
                            <a href="javascript:;">评测</a>
                            <a href="javascript:;">对比</a>
                        </div>
                    </li>
                </ul>
                <a href="javascript:;" class="dey_leftbtn"></a>
                <a href="javascript:;" class="dey_rightbtn"></a>
            </div>
        </div>
           
           <div class="dey_tubiao">
               <ul>
                   <li class="dey_tubiao1"></li>
                   <li class="dey_tubiao2"></li>
                   <li class="dey_tubiao3"></li>
                   <li class="dey_tubiao4"></li>
               </ul>
           </div> 
        </div>
    </div>
    <!-- 行业生态 -->
    <div class="de_hangyeshengtai">
        <div class="dey_l dey_l2">
            <div class="lin_on">
                <div class="lino_1">行业生态方案</div>
                <div class="lino_2">专家推荐，一站式服务</div>
            </div>
            <div class="lin_onzx">方案咨询</div>
            <ul class="de_zhinan de_zhinan2">
                <li>采购指南</li>
                <li>· 什么是硬件生态？</li>
                <li>· 采购服务器如何分期？</li>
                <li>· 怎样租服务器？如何计费？</li>
                <li><a href="javascript:;">more></a></li>
            </ul>
        </div>
        <div class="de_shengt_r">
            <div class="de_shent1 de_mous">
                <div class="de_shengtait">跨境电商</div>
                <div class="de_dians1">
                    <ul>
                        <li>硬件采购：</li>
                        <li>Dell PowerEdge R230</li>
                        <li>最新价格：7150元 </li>
                        <li>优势一：：</li>
                        <li>优势二：</li>
                         <li>优势三：</li>
                         <li><a href="javascript:;" class="de_xiangxi">【查看详细介绍】</a></li>
                    </ul>
                    <a href="javascript:;" class="de_xiangxi2">我要询价</a><a href="javascript;;" class="de_xiangxi2">定制选配</a>
                 <div class="de_dians2">
                    <dl>
                        <dt>项目生态：</dt>
                        <dd>免费IT架构方案咨询</dd>
                        <dd> 1个月免费数据中心服务</dd>
                        <dd>亚太CDN加速服务</dd>
                    </dl>
                    <a href="javascript:;" class="de_xiangxi">咨询电商生态</a>
                </div>
                </div>

            </div>
            <div class="de_shent2 de_mous">
                <div class="de_shengtait">流媒体应用</div>
                <div class="de_dians1">
                    <ul>
                        <li>硬件采购：</li>
                        <li>Dell PowerEdge R230</li>
                        <li>最新价格：7150元 </li>
                        <li>优势一：：</li>
                        <li>优势二：</li>
                         <li>优势三：</li>
                         <li><a href="javascript:;" class="de_xiangxi">【查看详细介绍】</a></li>
                    </ul>
                    <a href="javascript:;" class="de_xiangxi2">我要询价</a><a href="javascript;;" class="de_xiangxi2">定制选配</a>
                 <div class="de_dians2">
                    <dl>
                        <dt>项目生态：</dt>
                        <dd>免费IT架构方案咨询</dd>
                        <dd> 1个月免费数据中心服务</dd>
                        <dd>亚太CDN加速服务</dd>
                    </dl>
                    <a href="javascript:;" class="de_xiangxi">咨询电商生态</a>
                </div>
                </div>
            </div>
            <div class="de_shent3 de_mous">
                <div class="de_shengtait">金融支付</div>
                <div class="de_dians1">
                    <ul>
                        <li>硬件采购：</li>
                        <li>Dell PowerEdge R230</li>
                        <li>最新价格：7150元 </li>
                        <li>优势一：：</li>
                        <li>优势二：</li>
                         <li>优势三：</li>
                         <li><a href="javascript:;" class="de_xiangxi">【查看详细介绍】</a></li>
                    </ul>
                    <a href="javascript:;" class="de_xiangxi2">我要询价</a><a href="javascript;;" class="de_xiangxi2">定制选配</a>
                 <div class="de_dians2">
                    <dl>
                        <dt>项目生态：</dt>
                        <dd>免费IT架构方案咨询</dd>
                        <dd> 1个月免费数据中心服务</dd>
                        <dd>亚太CDN加速服务</dd>
                    </dl>
                    <a href="javascript:;" class="de_xiangxi">咨询电商生态</a>
                </div>
                </div>
            </div>
            <div class="de_shent4 de_mous">
                <div class="de_shengtait">数据中心</div>
                <div class="de_dians1">
                    <ul>
                        <li>硬件采购：</li>
                        <li>Dell PowerEdge R230</li>
                        <li>最新价格：7150元 </li>
                        <li>优势一：：</li>
                        <li>优势二：</li>
                         <li>优势三：</li>
                         <li><a href="javascript:;" class="de_xiangxi">【查看详细介绍】</a></li>
                    </ul>
                    <a href="javascript:;" class="de_xiangxi2">我要询价</a><a href="javascript;;" class="de_xiangxi2">定制选配</a>
                 <div class="de_dians2">
                    <dl>
                        <dt>项目生态：</dt>
                        <dd>免费IT架构方案咨询</dd>
                        <dd> 1个月免费数据中心服务</dd>
                        <dd>亚太CDN加速服务</dd>
                    </dl>
                    <a href="javascript:;" class="de_xiangxi">咨询电商生态</a>
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 服务 -->
    <div class="de_fuyou">
        <div class="dey_l de_fuyou3">
            <div class="lin_on">
                <div class="lino_1">服务</div>
                <div class="lino_2">专注于极致与创新</div>
            </div>
            <div class="fuwuxize">服务细则</div>
            <a href="javascript:;" class="fuwu_center">帮助中心>></a> <a href="javascript:;" class="fuwu_center">技术百科>></a>
            <div class="ganhuo">干货XXXXXXXXXXXXXXXXXX</div>
            <a href="javascript:;" class="more_btn">more></a>
                
        </div>
        <div class="fuyou_r">
            <div class="fuyour_top">
                <div class="fuyourt_l">
                    <div class="fuyourt_shangm">预约上门服务</div>
                    <div class="rb_l_c6">
                        <div class="c2_lin4"></div>
                        <div class="c2_lin6">20余位硬件工程师团队整装待命</div>
                        <div class="c2_lin5"></div>
                    </div>
                    <a href="javascript:;" class="fuyou_ryy">立即预约</a>
                </div>
                <div class="fuyourt_r">
                    <ul>
                        <li class="fuyour_l1">在线提交工单服务</li>
                        <li class="fuyour_l2">退换货查询服务</li>
                        <li class="fuyour_l3">故障检测维修服务</li>
                        <li class="fuyour_l4">服务建议与投诉</li>
                    </ul>
                </div>
            </div>
            <div class="fuyour_bot">
                <div class="fuyour_z">
                    <div class="shifu1"><img src="${BasePath}/images/2bcatmain/shifu1.png" height="80" width="80" alt="" /></div>
                    <div class="shifujs">
                        <dl>
                            <dt>王师傅</dt>
                            <dd>从业5年，擅长xxxxxx <a href="javascript:;">[详情]</a> </dd>
                            <dd>服务口碑：<span>技术大牛</span><span>有耐心</span></dd>
                            <dd><a href="javascript:;" class="lianxita">联系他</a></dd>
                        </dl>
                    </div>
                </div>
                <div class="fuyour_z fuyour_z1 ">
                    <div class="shifu1"><img src="${BasePath}/images/2bcatmain/shifu1.png" height="80" width="80" alt="" /></div>
                    <div class="shifujs">
                        <dl>
                            <dt>王师傅</dt>
                            <dd>从业5年，擅长xxxxxx <a href="javascript:;">[详情]</a> </dd>
                            <dd>服务口碑：<span>技术大牛</span><span>有耐心</span></dd>
                            <dd><a href="javascript:;" class="lianxita">联系他</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 社区 -->
    <div class="shequ">
        <div class="dey_l de_fuyou4">
            <div class="lin_on">
                <div class="lino_1">社区</div>
                <div class="lino_2">趣味干货，小白成长起点</div>
            </div>
            <a href="javascript:;" class="fuwuxize2">戴尔社区>></a>
            <a href="javascript:;" class="fuwu_centersq">IBM社区</a> <a href="javascript:;" class="fuwu_centersq">华为社区</a>
            <div class="ganhuosq">美超微社区</div>
            <a href="javascript:;" class="more_btn2">more></a>
                
        </div>
        <div class="shequ_r">
            <div class="shrqucon">
                <div class="shequ_tuwa">
                  <div class="shequ_tu1">
                    <div class="sheq_tu1w">华为四路服务器发货量位居全球第一</div>
                </div>
                </div>
                <dl>
                    <dt>最新资讯</dt>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">更多>></a></dd>
                </dl>
            </div>
            <div class="shrqucon">
                <div class="shequ_tuwa">
                  <div class="shequ_tu1">
                    <div class="sheq_tu1w">华为四路服务器发货量位居全球第一</div>
                </div>
                </div>
                <dl>
                    <dt>最新资讯</dt>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">更多>></a></dd>
                </dl>
            </div>
            <div class="shrqucon">
                <div class="shequ_tuwa">
                  <div class="shequ_tu1">
                    <div class="sheq_tu1w">华为四路服务器发货量位居全球第一</div>
                </div>
                </div>
                <dl>
                    <dt>最新资讯</dt>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">人民币拐点来临，你手里的钱怎么办？</a></dd>
                    <dd><a href="javascript:;">更多>></a></dd>
                </dl>
            </div>
        </div>
    </div>
</div>