<#include "../view.ftl">
<@layout title="好评统计">
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() {  
   var goodsName = [];
   var goodsNumber =[];
    $.ajax({  
          type : "post",  
          url : "commentViewData.do",   
          async : false,  
          dataType: "json",
          success : function(data){ 
            	for(var i =0;i<data.length;i++){
            		goodsName.push(data[i].name);
            		goodsNumber.push(data[i].goodsNumber);
            	}
            	
          } 

     }); 		
	

   var chart = {
      type: 'column'
   };
   var title = {
      text: '商品好评数据'   
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
        name: '好评数',
            data: goodsNumber
        }];     
      console.log(goodsNumber)
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