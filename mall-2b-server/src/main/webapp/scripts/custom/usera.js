function preview(file) {
	var prevDiv = document.getElementById('preview');
	var cardp1 = document.getElementById('cardp1');
	var cardp2 = document.getElementById('cardp2');
	var cardp = document.getElementById('notea').value;
	
	if(cardp=='cardp3'){
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt) {
				prevDiv.innerHTML = '<img class="img2" src="' + evt.target.result
						+ '" />';
			}
			reader.readAsDataURL(file.files[0]);
		} else {
			prevDiv.innerHTML = '<div class="img1" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''
					+ file.value + '\'"></div>';
		}
	}else if(cardp=='cardp1'){
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt) {
				cardp1.innerHTML = '<img class="cdp" src="' + evt.target.result
						+ '" />';
			}
			reader.readAsDataURL(file.files[0]);
		} else {
			cardp1.innerHTML = '<div class="cdp" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''
					+ file.value + '\'"></div>';
		}
	}else if(cardp=='cardp2'){
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt) {
				cardp2.innerHTML = '<img class="cdp" src="' + evt.target.result
						+ '" />';
			}
			reader.readAsDataURL(file.files[0]);
		} else {
			cardp2.innerHTML = '<div class="cdp" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\''
					+ file.value + '\'"></div>';
		}
	}
	
	$("#uploadform").submit();
}
function opendialog(){
	$("#submitFm").modal();
}
