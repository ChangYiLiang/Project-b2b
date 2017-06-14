(function(){
	function breathLoop(speed){
		$('.bannerLoop ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop ul li').eq(num).stop().fadeIn();
			$('.bannerLoop ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop ul li').eq(num).stop().fadeIn();
			$('.bannerLoop ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop ol li').click(function(){
			$('.bannerLoop ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop ul li').eq(num).stop().fadeIn();
			$('.bannerLoop ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop = breathLoop;
})();

(function(){
	function breathLoop2(speed){
		$('.bannerLoop2 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop2 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop2 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop2 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop2 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop2 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop2 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop2 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop2 ol li').click(function(){
			$('.bannerLoop2 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop2 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop2 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop2').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop2 = breathLoop2;
})();

(function(){
	function breathLoop3(speed){
		$('.bannerLoop3 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop3 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop3 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop3 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop3 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop3 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop3 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop3 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop3 ol li').click(function(){
			$('.bannerLoop3 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop3 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop3 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop3').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop3 = breathLoop3;
})();

(function(){
	function breathLoop4(speed){
		$('.bannerLoop4 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop4 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop4 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop4 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop4 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop4 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop4 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop4 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop4 ol li').click(function(){
			$('.bannerLoop4 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop4 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop4 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop4').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop4 = breathLoop4;
})();

(function(){
	function breathLoop5(speed){
		$('.bannerLoop5 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop5 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop5 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop5 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop5 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop5 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop5 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop5 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop5 ol li').click(function(){
			$('.bannerLoop5 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop5 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop5 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop5').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop5 = breathLoop5;
})();

(function(){
	function breathLoop6(speed){
		$('.bannerLoop6 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop6 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop6 ul li').eq(num).stop().fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop6 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop6 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop6 ul li').eq(num).stop().fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop6 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop6 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop6 ol li').click(function(){
			$('.bannerLoop6 ul li').eq(num).stop().fadeOut();
			num = $(this).index();
			$('.bannerLoop6 ul li').eq(num).stop().fadeIn();
			$('.bannerLoop6 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop6').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop6 = breathLoop6;
})();

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

$(function(){
    breathLoop(5000);
    breathLoop2(5000);
    breathLoop3(5000);
    breathLoop4(5000);
    breathLoop5(5000);
    breathLoop6(5000);
    $('.nav_daohang ul li a').click(function(){
        $(this).addClass('a_current');
        $(this).parent('li').siblings().children('a').removeClass('a_current');
        $(this).parent('li').addClass('li_current');
        $(this).parent('li').siblings().removeClass('li_current');
    });
    $('.nav_right ul>li,.he_fam').hover(function(){
        $(this).find('ul').show();
        $(this).find('em').rotate({
            angle:0,
            animateTo:180
        });
    },function(){
        $(this).find('ul').hide();
        $(this).find('em').rotate({animateTo:0});

    });
    $('.shop_wap').hover(function(){
        $(this).find('em').rotate({
            angle:0,
            animateTo:180
        });
        $('#gouwu').removeClass('shopcar').addClass('shopcar2');
        $('#gouwu2').removeClass('shopwen').addClass('shopwen2');
        if($('.shopnum').html() == 0){
            $('.shop_con1').show();
        }else{
            $('.shop_con2').show();
        }
    },function(){
        $(this).find('em').rotate({animateTo:0});
        $('#gouwu').removeClass('shopcar2').addClass('shopcar');
        $('#gouwu2').removeClass('shopwen2').addClass('shopwen');
        $('.shop_con1,.shop_con2').hide();
    });
    $('.quanbugood').hover(function(){
        $(this).find('em').rotate({
            angle:0,
            animateTo:180
        });
        $('.dakuang').show();
    },function(){
        $(this).find('em').rotate({animateTo:0});
        $('.dakuang').hide();
    });
    $('.fon_14').hover(function(){
        $(this).children('.xiangqing1').show();
    },function(){
        $(this).children('.xiangqing1').hide();
    })
    $('.fanganxiangmu1').mouseenter(function(){
        $(this).children('.fanganxiangmu').show();
    }).mouseleave(function(){
         $(this).children('.fanganxiangmu').hide();
    })
	
})

$(function(){
             breathLoop6(5000);
            $('.fon_14').hover(function(){
				<!--$('.fon_14g').addClass('current');-->
                $(this).children('.xiangqing1').show();
            },function(){
				<!--$('.fon_14g').removeClass('current');-->
                $(this).children('.xiangqing1').hide();
            })
            $('.fanganxiangmu1').mouseenter(function(){
                $(this).children('.fanganxiangmu').show();
            }).mouseleave(function(){
                 $(this).children('.fanganxiangmu').hide();
            })
			      $('.caigou_dany ul li').hover(function(){
              $(this).children('.csp_1').css("color","#1b9d97");
            },function(){
                $(this).children('.csp_1').css("color","#333");
            })
			 $('.fon_14b').hover(function(){
			 	$(this).addClass('current');
			 	$(this).children(".fon_14g").css("color", "#1b9d97");
            },function(){
				$(this).removeClass('current');
				$(this).children(".fon_14g").css("color", "white");
            })
        })
        

$(function(){
	function breathLoop8(speed){
		$('.bannerLoop8 ul li').eq(0).show();
		//右箭头
		var num = 0;
		var imgMax = $('.bannerLoop8 ul li').length-1;
		var timer = null;
		
		function myFn(){
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeOut();
			num++;
			if(num > imgMax){
				num = 0;
			}
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeIn();
			$('.bannerLoop8 ol li').eq(num).addClass('current').siblings().removeClass('current');
		}
		//右箭头
		$('.rightBtn').click(function(){
			myFn();
		})
		//左箭头
		$('.leftBtn').click(function(){
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeOut();
			num--;
			if(num < 0){
				num = imgMax;
			}
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeIn();
			$('.bannerLoop8 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
		})
		//点击下面按钮，实现切换
		$('.bannerLoop8 ol li').click(function(){
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeOut();
			num = $(this).index();
			$('.bannerLoop8 ul li').eq(num).stop(true,true).fadeIn();
			$('.bannerLoop8 ol li').eq(num).addClass('current')
               .siblings().removeClass('current');
			 
		})
		//定时器
		timer = setInterval(function(){
			myFn();
		},speed)
		/*鼠标移到div:左右箭头显示,清除定时器
		离开:左右箭头消失，重新开启定时器*/
		$('.bannerLoop8').hover(function(){
			$('.leftBtn,.rightBtn').show();
			clearInterval(timer);
		},function(){
			$('.leftBtn,.rightBtn').hide();
			timer = setInterval(function(){
				myFn();
			},speed)
		})
	}
	window.breathLoop8 = breathLoop8;
});