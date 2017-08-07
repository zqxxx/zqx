$(function(){
			var wh=$(window).height();
			setInterval(function(){
				var f=$(document).width();
				var e=Math.random()*f-100;//雪花的定位left值
				var o=0.3+Math.random();//雪花的透明度
				var fon=10+Math.random()*30;//雪花大小
				var l = e - 100 + 200 * Math.random();//雪花的横向位移
				var k=2000 + 5000 * Math.random();
				var html;
				switch(Math.floor(Math.random()*3+1)){
					case 1:
						html = "<div class='snow'>a<div>";
						break;
					case 2:
						html = "<div class='snow'>b<div>";
						break;
					case 3:
						html = "<div class='snow'>❅<div>";
						break;
				}
				$(html).clone().appendTo("body").css({
					left:e+"px",
					opacity:o,
					"font-size":fon,
				}).animate({
					top:(wh*2)+"px",
					left:l+"px",
					opacity:0.1,
				},k,"linear",function(){$(this).remove()})
			},100)
		})