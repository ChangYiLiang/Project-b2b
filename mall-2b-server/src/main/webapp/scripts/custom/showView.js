function view(){
		var img = $("#viewStr").val();
		alert(img)
		if(img!=""){
			var imgStr = img.split(",");
			for(var i =0;i<imgStr.length;i++){
				$(".contract").appendTo("<img src='data:image/jpeg;base64,"+imgStr[i]+"'/>")
			}
		}
	}