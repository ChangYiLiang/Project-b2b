<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <title>${SeoInfo.title}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <#include '../_inc_head.ftl'>
        <#include "../2buser/userheader.ftl">
    </head>
<style>
.tips{font-size:40px;color:#1B9D97}
.img{width:40px;height:40px;margin-bottom:20px;margin-right:10px}
</style>    
<body>
    <br><br><br>
    <div class="text-center">
        <span><img class="img" src="${BasePath}/images/2buser/u140true.png"></span>
        <span class="tips">恭喜您,您的Email验证成功!</span>
    </div>
    <#include "../2bmain/footer2b.ftl">
</body>
</html>