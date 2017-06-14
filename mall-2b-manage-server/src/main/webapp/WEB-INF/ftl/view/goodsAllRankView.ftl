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
	
	var name = [];
	var number = [];
	$.ajax({  
          type : "post",  
          url : "goodsAllRankViewData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		name.push(data[i].goodsName);
            		number.push(data[i].number);
            	}
            	
          } 

     }); 						
   var chart = {
      type: 'column'
   };
   var title = {
      text: null   
   };
   var subtitle = {
      text: null  
   };
   var xAxis = {
      categories: name,
      crosshair: true
   };
   var yAxis = {
      min: 0,
      title: {
         text: null         
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
        name: '产品销售量',
            data: number
        }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.subtitle = subtitle; 
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container').highcharts(json);
  
});
</script>


<script language="JavaScript">
$(document).ready(function() {  
	
	var name = [];
	var money = [];
	$.ajax({  
          type : "post",  
          url : "goodsAllRankViewData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		name.push(data[i].goodsName);
            		money.push(data[i].money);
            	}
            	
          } 

     }); 						
   var chart = {
      type: 'column'
   };
   var title = {
      text: null   
   };
   var subtitle = {
      text: null  
   };
   var xAxis = {
      categories: name,
      crosshair: true
   };
   var yAxis = {
      min: 0,
      title: {
         text: null         
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
        name: '产品销售额',
            data: money
        }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.subtitle = subtitle; 
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container1').highcharts(json);
  
});
</script>