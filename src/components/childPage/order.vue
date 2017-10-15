<template>
	<div class="mainindex">
		<!--<h2 class="h2">我的订单</h2>-->
		<myheader :title="title"></myheader>
		<div class="order_div">
			<ul class="nav clearfix">
				<li v-for="tab in tabArr" @click="changetab(tab.num)" :class="(checkTab == tab.num)?'current':''">{{tab.text}}</li>
			</ul>
			<div class="order_list">
				<ul class="list">
					<li>
						<img src="../../../static/c3.png"/>
						<div class="detals">
							<p class="titt">夹克<span class="orderstatu">卖家已发货</span></p>
							<p class="explain">哈哈哈哈</p>
							<p class="price">￥22<i>x 1</i></p>
						</div>
						<p class="comfirm">共1件商品&nbsp;合计 ￥<i>22</i>.0 </p>
						<p class="comfirm"><button @click="appraise">立即评价</button> </p>
					</li>

					<li>
						<img src="../../../static/c3.png"/>
						<div class="detals">
							<p class="titt">夹克<span class="orderstatu">卖家已发货</span></p>
							<p class="explain">哈哈哈哈</p>
							<p class="price">￥22<i>x 1</i></p>
						</div>
						<p class="comfirm">共1件商品&nbsp;合计 ￥<i>22</i>.0 </p>
						<p class="comfirm"><button>确认收货</button> </p>
					</li>

					<li>
						<img src="../../../static/c3.png"/>
						<div class="detals">
							<p class="titt">夹克<span class="orderstatu">卖家已发货</span></p>
							<p class="explain">哈哈哈哈</p>
							<p class="price">￥22<i>x 1</i></p>
						</div>
						<p class="comfirm">共1件商品&nbsp;合计 ￥<i>22</i>.0 </p>
						<p class="comfirm"><button>确认收货</button> </p>
					</li>
				</ul>
			</div>
		</div>
			
	</div>
</template>

<script>
	import header from "../common/header"
	export default{
		data(){
			return {
				title:"我的订单",
				iscurrent:false,
				tabArr: [
					{num: '0', text: '全部'},
					{num: '1', text: '待付款'},
					{num: '2', text: '待发货'},
					{num: '3', text: '待收货'},
					{num: '4', text: '待评价'}
				],
				checkTab: '0',
			}
		},
		components:{
			myheader:header
		},
		methods:{
			changetab(num){
				this.checkTab = num
			},
			appraise(){
				this.$router.push("/appraise");
			}
		}
	}
</script>

<style lang="less">
	.mainindex{
		.h2{
			text-align: center;
		}
		.order_div{
			display:flex;
			flex-direction:column;
			.nav{
				flex-basis:25px;
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
			flex-grow:1;
			 overflow-y: scroll;

			.list{
				li{
	  			    margin-bottom: 10px;
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
						background: #f5f5f5;
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
						height: 30px;
						line-height: 30px;
	    				padding-left: 10px;
	    				padding-right: 20px;
	    				text-align:right;
	    				&:last-child{
	    					border-top: 1px solid rgba(230, 230, 230, 0.8);
	    					height:40px;
	    				}
	    				i{
	    					font-size:14px;
	    				}
	    				button{
    					    float: right;
    					    background: #f5f5f5;
						    height: 30px;
						    width: 94px;
						    border-radius: 8px;
						    border: 1px solid #ff6804;
						    color: #ff6804;
						    margin: 5px 0;
	    					
	    				}
					}
				}
			}
		}		
	}
</style>