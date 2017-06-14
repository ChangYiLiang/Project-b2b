<#include "layout.ftl">

<@layout title="主页">
<#if hours?? && (hours < 12 && hours >= 5 ) >
	上午好！
<#elseif hours?? && (hours >= 12 && hours < 18 )>
	下午好！
<#else>
	晚上好！
</#if>
${(user.fullname)!''}
</@layout>