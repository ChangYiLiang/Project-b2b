<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<#include "../keyword.ftl" >
<link rel="stylesheet" type="text/css" href="${BasePath}/css/head.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/about.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/caigou.css" />
<link rel="stylesheet" type="text/css" href="${BasePath}/css/shouye.css" />
<link rel="shortcut icon" href="favicon.ico"/>
<script type="text/javascript" src="${BasePath}/scripts/custom/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/jqslide.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop2.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop3.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop4.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop5.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop6.js"></script>
<script type="text/javascript" src="${BasePath}/scripts/custom/2bjs/breathLoop7.js"></script>
<script type="text/javascript">
    $(function(){
      $('.if_c_r a,.now_jo').hover(function(){
        $(this).siblings('.tanchu').show();
        $(this).siblings('.tanchu1').show();
      },function(){
         $(this).siblings('.tanchu').hide();
         $(this).siblings('.tanchu1').hide();
      })
    })
</script>
</head>
<!--[if IE 7]><body class="ie7 page-header-fixed"><![endif]-->
<!--[if IE 8]><body class="ie8 page-header-fixed"><![endif]-->
<!--[if IE 9]><body class="ie9 page-header-fixed"><![endif]-->
<!--[if !IE]>-->
<body class="page-header-fixed">
<!--<![endif]-->

<#include "../2bmain/header2b.ftl" >

 <div class="about_nav">
            <div class="nav_center">
            <ul>
                <li><a href="${BasePath}/about/company.do" >
                    公司简介
                </a></li>
                <li><a href="${BasePath}/about/events.do">
                    九河网大事记
                </a></li>
                <li><a href="${BasePath}/about/contact.do">
                    联系我们
                </a></li>
                <li><a href="${BasePath}/about/join.do" class="nav_current">
                    加入我们
                </a></li>
            </ul>
        </div>
    </div>
    <!-- banner部分 -->
    <div class="ab_banner3"></div>
   <!--  点滴时光 -->
   <div class="lx_time">
         <div class="ab_title">
            <span class="ab_spw"> <span class="line_l"></span><span class="line_w">九河大家庭点滴时光</span><span class="line_r"></span></span>
       </div>
       <div class="lx_zhaopian">
            <ul>
                <li><img src="${BasePath}/images/2babout/tuandui5.png" height="150" width="150" alt="" /></li>
                <li>周五下午茶</li>
                <li><img src="${BasePath}/images/2babout/tuandui3.png" height="150" width="150" alt="" /></li>
                <li>集体聚餐</li>
                <li><img src="${BasePath}/images/2babout/tuandui4.png" height="150" width="150" alt="" /></li>
                <li>一起奋斗的时光</li>
                <li><img src="${BasePath}/images/2babout/tuandui2.png" height="150" width="150" alt="" /></li>
                <li>公司CEO</li>
                <li><img src="${BasePath}/images/2babout/tuandui1.png" height="150" width="150" alt="" /></li>
                <li>公司团建</li>
            </ul>
       </div>
   </div>
   <!-- 招聘要求 -->
   <div class="lx_if">
         <div class="ab_title">
            <span class="ab_spw"> <span class="line_l"></span><span class="line_w">如果你是这样的</span><span class="line_r"></span></span>
       </div>
       <div class="if_con">
           <div class="if_c_l">
               <img src="${BasePath}/images/2babout/if_1.png" height="366" width="253" alt="" />
           </div>
           <div class="if_c_r">
               <dl>
                   <dt>销售精英  </dt>
                   <dd>1、热爱销售，有一年以上的销售工作经验，有遭遇拒绝的勇气与坚持不懈的毅力； <br />
                        2、有强烈的学习、成功、事业、赚钱欲望，乐于从事销售工作，对生活充满激情与希望；<br />
                        3、学习领悟能力强，快速入手，勇于挑战困难，面对压力，能够沉得住气； <br />
                        4、对自己的发展规划有清晰的目标，知道自己想要什么，而不是只希望稳定安逸的工作； <br />
                        5、具备空杯归零的学习心态，善于聆听他人意见，不断修身齐家，谦卑不傲； <br />
                        6、有计算机网络相关专业、IDC行业经验者优先，上进心强； <br />
                        7、具有良好的沟通能力及客户维护能力，促成客户成交。 <br />
                        <br />
                         来这里，九河销售团队正在等你加入！
                    </dd>
               </dl>
                <a href="javascript:;">点击申请</a>
                <div class="tanchu">请发送您的简历至HR邮箱：hr@9he.com</div>
           </div>
       </div>
       <div class="if_con">
           <div class="if_c_l">
               <img src="${BasePath}/images/2babout/if_2.png" height="366" width="253" alt="" />
           </div>
           <div class="if_c_r ">
               <dl>
                   <dt>电商客服 </dt>
                   <dd class="kefudidi">1、IDC行业从业者优先，计算机及电子数码行业优先，熟悉网络推广；<br />
                        2、熟悉淘宝客服流程，有工作经验；<br />
                        3、1年以上销售或客服工作经验；<br />

                        能够做到：<br />

                        1、了解客户服务需求信息，进行有效跟踪，做好售前、售后指导和服务工作；<br />
                        2、熟练运用公司产品，解答客户提问并落实问题；<br />
                        3、与相关部门紧密配合，协调沟通；<br />
                        4、维护客户关系，并开发新客户 。<br />
                                                        <br />
                        来这里，九河客服团队正在等你加入！<br />
                    </dd>
               </dl>
                <a href="javascript:;">点击申请</a>
                 <div class="tanchu">请发送您的简历至HR邮箱：hr@9he.com</div>
           </div>
       </div>
       <div class="if_con">
           <div class="if_c_l">
               <img src="${BasePath}/images/2babout/if_3.png" height="366" width="253" alt="" />
           </div>
           <div class="if_c_r ">
               <dl>
                   <dt>市场推广 </dt>
                   <dd >1.负责开拓客户群，维护客户关系； <br />
                        2.负责在目标区域开展产品的推广销售工作，完成销售目标，实现产品的销售增长及市场占有率的提高；<br />
                        3.与其他部门紧密配合落实完成公司的销售目标；<br />
                        4.良好的学习和培训能力；<br />
                        5.优秀的沟通谈判能力和良好的客户关系；<br />
                                                                <br />
                        来这里，九河客服团队正在等你加入！ <br />
                    </dd>
               </dl>
                <a href="javascript:;">点击申请</a>
                 <div class="tanchu">请发送您的简历至HR邮箱：hr@9he.com</div>
           </div>
       </div>

   </div>
   <!-- 你将获得 -->
   <div class="nijianghuode">
         <div class="ab_title">
            <span class="ab_spw"> <span class="line_l"></span><span class="line_w">你将获得</span><span class="line_r"></span></span>
       </div>
       <div class="huode_con">
            <ul>
                <li>
                    <div><img src="${BasePath}/images/2babout/fuli.jpg" height="161" width="162" alt="" /></div>
                    <div class="huode_tit">丰厚薪资待遇</div>
                    <div class="huode_con1">具有竞争力的薪酬福利体系，部门奖励、年度奖金、节日礼金、月度分红，足够优秀的人才还能获得期权奖励</div>
                </li>
                <li>
                    <div><img src="${BasePath}/images/2babout/fuli2.jpg" height="161" width="162" alt="" /></div>
                    <div class="huode_tit">良好的晋升空间</div>
                    <div class="huode_con1">遵从“人人平等”的原则，为每位员
                        工提供岗位晋升的机会，同时，也为
                        员工准备了专业的技能培训与团队拓
                        展，保证了员工的专业技能提升与职
                        业更好的发展。</div>
                </li>
                <li>
                    <div><img src="${BasePath}/images/2babout/fuli1.jpg" height="161" width="162" alt="" /></div>
                    <div class="huode_tit">各种节日福利</div>
                    <div class="huode_con1">在九河，五险一金、年底双薪、带薪
                    年假、节日大礼只是标配，更有弹性
                    工作时间，员工年度旅游、定期团队
                    聚餐，优秀人才期权奖励，更尽力打
                    造舒适的办公环境与融洽的共事氛围，
                    让员工感受到九河大家庭的温暖。</div>
                </li>
            </ul>
            <a href="javascript:;" class="now_jo">现在就加入我们</a>
             <div class="tanchu1">请发送您的简历至HR邮箱：hr@9he.com</div>
       </div>
   </div>

<#include "../2bmain/footer2b.ftl" >

</body>
</html>