<template>
	<div class="mainindex">
		<div class="contents">
			<div class="userico" >
				<router-link to="/login"><img src="../../static/u2.png" /></router-link>
				<p>路小雨</p>
				<p>好好学习，天天向上</p>
			</div>
			<ul class="functionlist">
				<router-link to="/mycollect">
					<li>我的收藏<span></span></li>
				</router-link>
				<router-link to="/order">
					<li>我的订单<span></span></li>
				</router-link>
				<router-link to="/myaddress">
					<li>收货地址<span></span></li>
				</router-link>
				<li>服务中心</li>
				<li><a href="tel:10086">联系我们</a></li>
				<li>清除缓存</li>
				<li>退出</li>
			</ul>
			
			
		</div>
	</div>
</template>

<script>
	export default{
        components:{
     
        }
	}
</script>

<style lang="less">
	.userico{
		padding-top: 10px;
		text-align: center;
	    background: linear-gradient(30deg, #fda1ff, #6a7cff);
		img{
			margin: 0px auto;
			height: 70px;
			width: 70px;
			border-radius: 35px;text-align: center;
		}
		p{
			width: 100%;
			line-height: 30px;
			color: #fff;
		}
	}
	.functionlist{
			margin:2px 0;
			li{
				line-height: 45px;
				height: 45px;
				border-bottom: 1px solid  #ececec;
				padding-left: 15px;
				span{
					display: inline-block;
					width: 32px;
					height: 32px;
					margin-top: 3px;
					float: right;
					background: url(../assets/img/icon-go.png) no-repeat center center;
					background-size: 50%;
					
				}
			}
	}
</style>