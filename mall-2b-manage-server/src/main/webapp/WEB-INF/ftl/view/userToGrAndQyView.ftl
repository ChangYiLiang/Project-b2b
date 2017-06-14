<#include "../view.ftl">
<@layout title="用户统计">
<br>
<br>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() { 
  var grData = [];
  var qyData = [];
  $.ajax({  
          type : "post",  
          url : "userToGrAndQyViewData.do",   
          async : false,  
          dataType: "json",
          success : function(userData){  
            	grData.push('个人用户');
            	grData.push(userData.gr);    	
            	qyData.push('企业用户');
            	qyData.push(userData.qy);
          } 

     }); 
 
   var chart = {
       plotBackgroundColor: null,
       plotBorderWidth: null,
       plotShadow: false
   };
   var title = {
      text: '<b>用户对比</b>'   
   };      
   var tooltip = {
      pointFormat: '<b>{point.y}人</b>'
   };
   var plotOptions = {
      pie: {
         allowPointSelect: true,
         cursor: 'pointer',
         dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f}%',
            style: {
               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
         }
      }
   };
   var series= [{
      type: 'pie',
      name: 'Browser share',
      data: [
         grData,
         qyData
      ]
   }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;     
   json.tooltip = tooltip;  
   json.series = series;
   json.plotOptions = plotOptions;
   $('#container').highcharts(json);  
});
</script>