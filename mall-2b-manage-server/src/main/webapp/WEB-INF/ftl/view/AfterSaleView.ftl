<#include "../view.ftl">
<@layout title="售后统计">
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() {  
	var goodsName = [];
    var goodsNumber =[];
    var number = [];
    $.ajax({  
          type : "post",  
          url : "afterSaleViewData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            	    goodsNumber.push(data[i].goodsNumber);
            		goodsName.push(data[i].goodsName);
            		
            	}
            	for(var i = 0;i<goodsNumber.length;i++){
            		number.push(parseInt(goodsNumber[i]));
            	}
          } 

     }); 	
     console.log(number)
   var chart = {
      type: 'column'
   };
   var title = {
      text: '平台退换货维修数据'   
   };
   var xAxis = {
      categories: goodsName,
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
        name: '售后记录',
            data: number
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