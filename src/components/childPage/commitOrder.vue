<template>
	<div class="commitorder">
		<myheader :title="title"></myheader>
		<div class="content">
			<div class="address">
				<button class="choose_add">请选择地址</button>
				<div class="show_add">
					<p><span>收件人：路小雨</span>
						<span class="phonenumber">187****1234</span>
					</p>
					<p>收货地址：上海市徐汇区xxx路xxxx号xxx楼</p>
				</div>
			</div>
			<div class="shoppinglist">
				<ul class="list">
					<li>
						<img src="../../../static/c3.png"/>
						<div class="detals">
							<p class="titt">夹克</p>
							<p class="explain">哈哈哈哈</p>
							<p class="price">￥{{price}}<i>x {{buynum}}</i></p>
						</div>
						<p class="num">购买数量  <mybuynumber @changenum="changenumoo"></mybuynumber></p>
					</li>	
				</ul>
			</div>
		</div>
		<div class="total_div">
			<p>合计：￥{{total}}<button>提交订单</button></p>
		</div>
	</div>
</template>

<script>
	import header from "../common/header"
	import buynumber from "../common/buynumber"
	export default{
		props:{
			
		},
		components:{
			myheader:header,
			mybuynumber:buynumber
		},
		data(){
			return{
				title:"确认订单",
				buynum:1,
				price:20,
				total:20
			}
		},
		computed:{},
		watch:{
			
		},
		methods:{
			changenumoo(num){
				this.buynum=num;
				this.total=num*this.price
			
			}
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
		    background: url(../../assets/img/icon-add.png) no-repeat 20px;  
		}
		.show_add{
			background: url(../../assets/img/icon-address.png) no-repeat left center;
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
		margin:5px auto;
		width: 98%;
		padding: 2px 5px;
		
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
				.num{
					width: 100%;
					line-height: 45px;
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