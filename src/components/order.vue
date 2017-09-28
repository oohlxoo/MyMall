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
				<ul class="list">
					<li>
						<img src="../../static/c3.png"/>
						<div class="detals">
							<p class="titt">夹克<span class="orderstatu">卖家已发货</span></p>
							<p class="explain">哈哈哈哈</p>
							<p class="price">￥22<i>x 1</i></p>
						</div>
						<p class="comfirm"><button>确认收货</button> </p>
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
			.list{
				li{
	  			    margin-top: 10px;
			    	display: -webkit-box;
			    	display:flex;/*设为伸缩容器*/  
			   		/*flex-flow:row;*/
			   		flex-wrap:wrap;/*让弹性盒子元素在必要的时候拆行*/
	  			    background: #f5f5f5;
		  			p{
		  			   line-height: 25px;
		  			}
					img{
						width:80px;
						height:80px;
					}
					.detals{
						flex:1;
						padding: 5px 10px;	
						/*border: 1px solid rgba(230, 230, 230, 0.8);*/
						.orderstatu{
							float: right;
							font-size: 10px;
						    font-weight: initial;
						    color: #ff6804;
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
							i{
								float: right;
								color: #b3b3b3;
								font-size: 12px;
								padding-left:20px;
								font-size: 14px;
							}
						}
					}
					.comfirm{
						width: 100%;
						height: 45px;
						line-height: 45px;
						background: #f5f5f5;
	    				padding-left: 10px;
	    				border-top: 1px solid rgba(230, 230, 230, 0.8);
	    				button{
    					    float: right;
						    background: #f5f5f5;
						    height: 32px;
						    width: 94px;
						    border-radius: 8px;
						    border: 1px solid #ff6804;
						    color: #ff6804;
						    margin: 5px 10px;
	    					
	    				}
					}
				}
			}
		}		
	}
</style>