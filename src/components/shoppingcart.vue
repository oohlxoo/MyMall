<template>
	<div class="commitorder">
		<myheader :title="title" :showback="showback"></myheader>
		<div class="content">
			<div class="shoppinglist">
				<ul class="list">
					<li v-for="(item,index) in shoppingListData">
						<div class="left-choose">
							<span class="ed"></span>
						</div>
						<div class="right-content">
							<img :src="item.g_img[0]"/>
							<div class="detals">
								<p class="titt">{{item.g_title}}</p>
								<p class="explain">{{item.g_describe}}</p>
								<p class="price">￥{{item.g_price}}<i>x {{item.sc_num}}</i></p>
							</div>
							<p class="num clearfix">购买数量  <mybuynumber :buynum="item.sc_num" @changenum="changenumoo"></mybuynumber></p>
						</div>	
					</li>
					
					
				</ul>
			</div>
		</div>
		<div class="total_div">
			<p>
				<span class="choose" @click="">全选</span>
				合计：<i>￥{{total}}</i>
				<button>提交订单</button></p>
		</div>
		<!--弹窗-->
		<!--<mydialog></mydialog>-->
	</div>
</template>

<script>
	import header from "./common/header"
	import buynumber from "./common/buynumber"
	import dialog from "./common/dialog.vue"
	export default{
		props:{
			
		},
		components:{
			myheader:header,
			mybuynumber:buynumber,
			mydialog:dialog
		},
		data(){
			return{
				title:"购物车(6)",
				buynum:1,
				price:20,
				total:20,
				showback:false,
				shoppingListData:null
			}
		},
		computed:{},
		watch:{
			
		},
		methods:{
			changenumoo(num){
				this.buynum=num;
				this.total=num*this.price
			
			},
			//切换地址
			changeAddress(){
				this.$router.push('myaddress' );
				
			},
			getShoppingListData(){
				this.$http.get("api/shoppingCarList"/*,{
					params:{
					account:this.$store.userinfo.account,
					token:this.$store.userinfo.token
				}}*/).then((res)=>{
					this.shoppingListData=res.data;
					console.log(res.data)
				}).catch((err)=>{
					console.log(err)
				});
			}
		},
		mounted(){
			this.getShoppingListData();
		}
		
	}
</script>

<style lang="less">
	.commitorder{
		display:flex;
		flex-direction: column;
		height: 100%;
		.content{
			flex: 1;
			overflow-y: scroll;
		}
	}
	
	.address{
		margin: 0 auto;
		text-align: center;
		width: 90%;
		.choose_add{
			display: none;
		    border: 1px solid #ff6804;
		    padding: 10px 0;
		    width: 85%;
		    border-radius: 4px;
		    color: #ff6804;
		    margin: 15px 0;
		    background: url(../assets/img/icon-add.png) no-repeat 20px;  
		}
		.show_add{
			background: url(../assets/img/icon-address.png) no-repeat left center;
			padding-left: 45px;
			text-align: left;
			margin: 14px 0;
			.phonenumber{
		    	float: right !important;
		    	padding-right: 20px;
		    	display: inline-block;
		    }
		}
	}
	.shoppinglist{
		margin:0 auto;
		width: 98%;
		padding: 0 5px;
		
		.list{
			li{
  			    margin-top: 10px;
		    	display: -webkit-box;
		    	display:flex;/*设为伸缩容器*/  
		   		flex-flow:row;
		   		flex-wrap:wrap;/*让弹性盒子元素在必要的时候拆行*/
  			    background: #f5f5f5;
  			    .left-choose{
  			    	width: 25px;
  			    	margin:0 5px ;
  			    	span{
						background: url(../assets/img/icon-choose.png) no-repeat 10% center;
						background-size: 80% !important;
						width: 25px !important;
						height: 100%;
						display: inline-block;
						float: left;
						&.ed{
							background: url(../assets/img/icon-choose1.png) no-repeat 10% center ;
						}
						
					}
  			    }
  			    .right-content{
  			    	flex:1;
		  			p{
		  			   line-height: 25px;
		  			  
		  			}
					img{
						width:80px;
						height:80px;
						 float: left;
					}
					.detals{
						float: left;
						padding: 5px 10px;	
						/*border: 1px solid rgba(230, 230, 230, 0.8);*/
					
						.explain{
							line-height: 15px;
							color: #b3b3b3;
							font-size: 12px;
							overflow: hidden;
						    text-overflow: ellipsis;
						    white-space: nowrap;
						    width: 160px;
						}
						.titt{
							font-size: 14px;
		    				font-weight: bold;
						}
						.price{
							color:#ff6804;
							font-size: 16px;
							i{
								float: right;
								color: #b3b3b3;
								font-size: 12px;
								padding-left:20px;
								font-size: 14px;
							}
						}
					}
				}
				.num{
					width: 100%;
					line-height: 45px !important;
					background: #f5f5f5;
    				padding-left: 10px;
    				border-top: 1px solid rgba(230, 230, 230, 0.8);
    				
				}
			}
		}	
	}
	.total_div{
		height: 45px;
		line-height: 45px;
		width: 100%;
		z-index: 9;
		text-align: right;
		background-color: #f5f5f5;
		.choose{
			background: url(../assets/img/icon-choose.png) no-repeat 10px center;
			background-size: 20px 20px;
			float: left;
			width: 64px;
			display: inline-block;
			height: 47px;
			line-height: 47px;
			&.ed{
				background: url(../assets/img/icon-choose1.png) no-repeat 10px  center ;
			}
			
		}
		i{
			color: #ff6804;
			font-size: 16px;
		}
		button{
			margin-left: 40px;
		    background: linear-gradient(to right, #ffa100, #ff6804);
		    width: 100px;
		    height: 100%;
		    color: floralwhite;
		    text-align: center;
		    display: inline-block;
		    line-height: 45px;
		    float: right;
		}
	}
</style>