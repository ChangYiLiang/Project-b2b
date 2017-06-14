<#include "../view.ftl">
<@layout title="订单统计">
<br>
<br>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
<br>
<div id="container1" style="width: 550px; height: 400px;margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() { 
   var numberArr = [];
   $.ajax({  
          type : "post",  
          url : "orderNumberData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		numberArr.push(data[i].number);
            	}
          } 
     }); 	
 
   var chart = {
      type: 'bar'
   };
   var title = {
      text: '平台月度季度年度销售量'   
   };
   var subtitle = {
      text: null
   };
   var xAxis = {
      categories: ['月度','季度','年度'],
      title: {
         text: null
      }
   };
   var yAxis = {
      min: 0,
      title: {
         text: null,
         align: 'high'
      },
      labels: {
         overflow: 'justify'
      }
   };
   var tooltip = {
      valueSuffix: ' 单'
   };
   var plotOptions = {
      bar: {
         dataLabels: {
            enabled: true
         }
      }
   };
   var legend = {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'top',
      x: -40,
      y: 100,
      floating: true,
      borderWidth: 1,
      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
      shadow: true
   };
   var credits = {
      enabled: false
   };
   
   var series= [{
            name: '订单销量',
            data: numberArr
        }
   ];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.subtitle = subtitle; 
   json.tooltip = tooltip;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;
   json.legend = legend;
   json.credits = credits;
   $('#container').highcharts(json);
  
});
</script>

<script language="JavaScript">
$(document).ready(function() { 
   var moneyArr = [];
   $.ajax({  
          type : "post",  
          url : "orderNumberData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		moneyArr.push(data[i].money);
            	}
          } 
     }); 	
 
   var chart = {
      type: 'bar'
   };
   var title = {
      text: '平台月度季度年度销售额'   
   };
   var subtitle = {
      text: null
   };
   var xAxis = {
      categories: ['月度','季度','年度'],
      title: {
         text: null
      }
   };
   var yAxis = {
      min: 0,
      title: {
         text: null,
         align: 'high'
      },
      labels: {
         overflow: 'justify'
      }
   };
   var tooltip = {
      valueSuffix: ' 元'
   };
   var plotOptions = {
      bar: {
         dataLabels: {
            enabled: true
         }
      }
   };
   var legend = {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'top',
      x: -40,
      y: 100,
      floating: true,
      borderWidth: 1,
      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
      shadow: true
   };
   var credits = {
      enabled: false
   };
   
   var series= [{
            name: '订单销售额',
            data: moneyArr
        }
   ];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.subtitle = subtitle; 
   json.tooltip = tooltip;
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;
   json.legend = legend;
   json.credits = credits;
   $('#container1').highcharts(json);
  
});
</script>