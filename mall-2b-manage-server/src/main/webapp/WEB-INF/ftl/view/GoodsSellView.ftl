<#include "../view.ftl">
<@layout title="产品统计">
<br>
<br>
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
<br>
<br>
<div id="container1" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() { 
	  var goodsMoney = new Array() ;
	  $.ajax({  
	          type : "post",  
	          url : "goodsSellViewData.do",   
	          async : false,  
	          dataType: "json",
	          success : function(goodsData){ 
	            	for(var i =0;i<goodsData.length;i++){
	            	    goodsMoney[i] = new Array();
	            		goodsMoney[i][0]=goodsData[i].name;
	            		goodsMoney[i][1]=goodsData[i].orderMoney;
	            	}
	          } 
	
	     }); 
	
   console.log(goodsMoney);
   var chart = {
       plotBackgroundColor: null,
       plotBorderWidth: null,
       plotShadow: false
   };
   var title = {
      text: '产品类别销售额百分比'   
   };      
   var tooltip = {
      pointFormat: '{series.name}: <b>{point.y} 元</b>'
   };
   var plotOptions = {
      pie: {
         allowPointSelect: true,
         cursor: 'pointer',
         dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.2f} %',
            style: {
               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
         }
      }
   };
   var series= [{
      type: 'pie',
      name: '销售金额',
      data: goodsMoney
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

<script language="JavaScript">
$(document).ready(function() { 
	  var goodsNumber= new Array() ;
	  $.ajax({  
	          type : "post",  
	          url : "goodsSellViewData.do",   
	          async : false,  
	          dataType: "json",
	          success : function(goodsData){ 
	            	for(var i =0;i<goodsData.length;i++){
	            		goodsNumber[i] =new Array();
	            		goodsNumber[i][0]=goodsData[i].name;
	            		goodsNumber[i][1]=goodsData[i].orderNunber;
	            		
	            	}
	          } 
	
	     }); 
	     console.log(goodsNumber);
   var chart = {
       plotBackgroundColor: null,
       plotBorderWidth: null,
       plotShadow: false
   };
   var title = {
      text: '产品类别订单量百分比'   
   };      
   var tooltip = {
      pointFormat: '{series.name}: <b>{point.y} 个</b>'
   };
   var plotOptions = {
      pie: {
         allowPointSelect: true,
         cursor: 'pointer',
         dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.2f} %',
            style: {
               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
         }
      }
   };
   var series= [{
      type: 'pie',
      name: '订单量',
      data: goodsNumber
   }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;     
   json.tooltip = tooltip;  
   json.series = series;
   json.plotOptions = plotOptions;
   $('#container1').highcharts(json);  
});
</script>