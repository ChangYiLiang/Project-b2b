(function(){
	function breathLoop7(speed){
		$('.bannerLoop7 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop7 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop7 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop7 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop7 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop7 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop7 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop7 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop7 ol li').click(function(){
			$('.bannerLoop7 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop7 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop7 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop7').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop7 = breathLoop7;
})();