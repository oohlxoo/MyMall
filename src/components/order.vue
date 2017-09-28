<template>
	<div class="mainindex">
		<!--<h2 class="h2">我的订单</h2>-->
		<myheader :title="title" :showback="showback"></myheader>
		<div class="order_div">
			<ul class="nav clearfix">
				<li class="current">全部</li>
				<li>待付款</li>
				<li>待发货</li>
				<li>待收货</li>
				<li>待评价</li>
			</ul>
			<div class="order_list">
				<ul class>
					<li>
						<img src="../../static/u1.png"/>
						<div class="detals">
							<p class="titt">神马</p>
							<p class="explain">最后化作流星</p>
							<p class="price">￥11</p>
							<p class="button"><button>立即购买</button></p>
						</div>
					</li>
				</ul>
			</div>
		</div>
			
	</div>
</template>

<script>
	import header from "./common/header"
	export default{
		data(){
			return {
				title:"我的订单",
				showback:false
			}
		},
		components:{
			myheader:header
		}
	}
</script>

<style lang="less">
	.mainindex{
		.h2{
			text-align: center;
		}
		.order_div{
			.nav{
				li{
					float: left;
					width: 20%;
					height: 25px;
					line-height: 25px;
					font-size: 14px;
					&.current{
						color:#ff4b6d;
					}
				}
			}
		}
		.order_list{
			li{
				display:flex;
  			    margin-top: 10px;
  			    a{
  			    	display: -webkit-box;
  			    	display:flex;/*设为伸缩容器*/  
  			   		 flex-flow:row;
  			    }
	  			p{
	  			   line-height: 25px;
	  			}
				img{
					width:120px;
					height: 120px;
				}
				.detals{
					flex:1;
					padding: 5px 10px;	
					border: 1px solid rgba(230, 230, 230, 0.8);
				}
				.explain{
					line-height: 15px;
					color: #b3b3b3;
					font-size: 12px;
				}
				.titt{
					font-size: 14px;
    				font-weight: bold;
				}
				.price{
					color: #ff4b6d;
					font-size: 20px;
					
				}
				
				button{
					background: #fff;
				    border: 1px solid #4d00ff;
				    padding: 4px 10px;
				    border-radius: 4px;
				    color: #4d00ff;
				}
			}
		}		
	}
</style>