<#include "../view.ftl">
<@layout title="产品销量统计">
<br>
<br>
<br>
<div id="container1" style="width: 750px; height: 500px; margin: 0 auto"></div>
<br>
<br>
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
<br>
<br>
<div id="container2" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() { 
	
   var name = [];
   var count =[];
   var count1 = [];
    $.ajax({  
          type : "post",  
          url : "goodsRankByQ.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		name.push(data[i].goods_name);
            		count.push(data[i].goodsCount);
            		
            	}
            	for(var i = 0;i<count.length;i++){
            		count1.push(parseInt(count[i]));
            	}
          } 

     }); 	
   var chart = {
      type: 'column'
   };
   var title = {
      text: '平台季度产品销量'   
   };
   var xAxis = {
      categories: name,
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
        name: '月度销量',
            data: count1
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

<script language="JavaScript">
$(document).ready(function() { 
	
   var name = [];
   var count =[];
   var count1 = [];
    $.ajax({  
          type : "post",  
          url : "goodsRankByM.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		name.push(data[i].goods_name);
            		count.push(data[i].goodsCount);
            		
            	}
            	for(var i = 0;i<count.length;i++){
            		count1.push(parseInt(count[i]));
            	}
          } 

     }); 	
   var chart = {
      type: 'column'
   };
   var title = {
      text: '平台月度产品销量'   
   };
   var xAxis = {
      categories: name,
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
        name: '季度销量',
            data: count1
        }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container1').highcharts(json);
  
});
</script>

<script language="JavaScript">
$(document).ready(function() { 
	
   var name = [];
   var count =[];
   var count1 = [];
    $.ajax({  
          type : "post",  
          url : "goodsRankByY.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		name.push(data[i].goods_name);
            		count.push(data[i].goodsCount);
            		
            	}
            	for(var i = 0;i<count.length;i++){
            		count1.push(parseInt(count[i]));
            	}
          } 

     }); 	
   var chart = {
      type: 'column'
   };
   var title = {
      text: '平台年度产品排名'   
   };
   var xAxis = {
      categories: name,
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
        name: '年度销量',
            data: count1
        }];     
      
   var json = {};   
   json.chart = chart; 
   json.title = title;   
   json.xAxis = xAxis;
   json.yAxis = yAxis;  
   json.series = series;
   json.plotOptions = plotOptions;  
   json.credits = credits;
   $('#container2').highcharts(json);
  
});
</script>