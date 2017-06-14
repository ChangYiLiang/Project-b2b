define(function(){
	
	function initApplyForm() {
		require(['common'], function() {
			var refunedReasons = ["损毁严重", "其他"];
			var reasons = ["产品与描述不符", "产品损坏", "拍错", "不想买了", "发错/漏货", "其他"];
			
			var hidePanels = {
					define: $("#refundMoneyPanel, #descriptionPanel, #refundGoodsQtyPanel, #exchangeGoodsQtyPanel, #companyAddress, #refundMoneyPanel, #refundDesc, #refundFiles, #refundMoneyPanel2"),
					"1": $("#descriptionPanel, #refundGoodsQtyPanel, #exchangeGoodsQtyPanel, #refundMoneyPanel2"),
					"0": $("#exchangeGoodsQtyPanel, #companyAddress, #refundMoneyPanel, #refundDesc, #refundFiles"),
					"2": $("#refundMoneyPanel, #refundGoodsQtyPanel, #refundMoneyPanel2"),
			}

			
			$("#selectType").change(function(){
				var val = $(this).val();
				var data = reasons;
				if (val === "0") {
					data = refunedReasons;
				}
				hidePanels.define.removeClass("hidden").find(":input").prop("disabled", false);
				console.info(hidePanels[val])
				if (hidePanels[val]) {
					hidePanels[val].addClass("hidden").find(":input").prop("disabled", true);;
				}
				$("#selectReason").createOptions(data).change();
			}).change();
			
			$("#selectReason").change(function(){
				var $selected = $("#selectReason :selected"),
					$other = $("#selectReason option:last")
				if($selected.is($other)) {
					$(this).attr("name", "");
					$("#inputReason").removeClass("hidden").prop("disabled", false);
				} else {
					$(this).attr("name", $("#inputReason").attr("name"));
					$("#inputReason").addClass("hidden").prop("disabled", true);;
				}
			});
		});
		
		require(['common'], function() {
			$('.apply-form').each(function(){
				$(this).i9heValidate();
			});
		});
		
		
	}
	
	
	
	return {
		initApplyForm: initApplyForm
	}
	
});