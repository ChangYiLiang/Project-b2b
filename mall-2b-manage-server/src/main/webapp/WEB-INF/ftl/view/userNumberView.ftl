<#include "../view.ftl">
<@layout title="用户统计">
<div id="container" style="width: 750px; height: 500px; margin: 0 auto"></div>
</@layout>
<script language="JavaScript">
$(document).ready(function() {
  
   var strDate =[];
   var userNumber = [];
   $.ajax({  
          type : "post",  
          url : "userNumberData.do",   
          async : false,  
          dataType: "json",
          success : function(userData){  
            	for(var i =userData.length-1;i>=0;i--){
		  			strDate.push(userData[i].createDateStr)
		  			userNumber.push(userData[i].userSum)
		  		}
		  		this.strDate = strDate;
		  		this.userNumber = userNumber;
          } 

     }); 
   var title = {
       text: '用户增长趋势'   
   };
   var xAxis = {
          categories :strDate 
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

   var tooltip = {
      valueSuffix: '人'
   }

   var legend = {
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'middle',
      borderWidth: 0
   };

   var series =  [
      {
         name: '用户总数',
         data:  userNumber
      }     
   ];

   var json = {};

   json.title = title;
   
   json.xAxis = xAxis;
   json.yAxis = yAxis;
   json.tooltip = tooltip;
   json.legend = legend;
   json.series = series;
	
   $('#container').highcharts(json);
});
</script>