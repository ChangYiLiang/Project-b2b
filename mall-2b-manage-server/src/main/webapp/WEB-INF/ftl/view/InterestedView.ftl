<#include "../view.ftl">
<@layout title="关注统计">
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() {
   var dataStr = [];
   var number = [];

   $.ajax({  
          type : "post",  
          url : "interestedViewData.do",   
          async : false,  
          dataType: "json",
          success : function(concernData){  
            	for(var i = concernData.length-1;i>=0;i--){
            		dataStr.push(concernData[i].dataStr);
            		number.push(concernData[i].interestedNumber)
            	}
            	console.log(dataStr);
            	console.log(number);
          } 
     }); 

   var title = {
      text: '商品累计关注'   
   };
  
   var xAxis = {
      categories: dataStr
   };
   var yAxis = {
      title: {
         text: ''
      },
      plotLines: [{
         value: 0,
         width: 1,
         color: '#808080'
      }]
   };   
   var legend = {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle',
      borderWidth: 0
   };

   var series =  [
      {
         name: '关注人数',
         data: number
      }
   ];
   var json = {};

   json.title = title;
   json.xAxis = xAxis;
   json.yAxis = yAxis;
   json.legend = legend;
   json.series = series;

   $('#container').highcharts(json);
});
</script>