<#include "../view.ftl">
<@layout title="用户统计">
<br>
<br>
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() { 
	
   var data = [];
    $.ajax({  
          type : "post",  
          url : "userRegisterNumberData.do",   
          async : false,  
          dataType: "json",
          success : function(userData){ 
            	data.push(userData.nowDay);
            	data.push(userData.nowMonth);
            	data.push(userData.nowCurdate);
          } 

     }); 	
	
 
   var chart = {
      type: 'column'
   };
   var title = {
      text: '新注册用户数'   
   };
   var xAxis = {
      categories: ['当日','当月','当季度'],
      crosshair: true
   };
   var yAxis = {
      min: 0,
      title: {
         text: ''         
      }      
   };
   var plotOptions = {
      column: {
         pointPadding: 0.2,
         borderWidth: 0
      }
   };  
   var credits = {
      enabled: false
   };
   
   var series= [{
        name: '人数',
            data: data
        }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   

   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container').highcharts(json);
  
});
</script>