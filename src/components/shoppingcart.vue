<template>
	<div class="commitorder">
		<myheader :title="title" :showback="showback"></myheader>
		<div class="content">
			<div class="shoppinglist">
				<ul class="list">
					<li v-for="(item,index) in shoppingListData" :key="index">
						<div class="left-choose" @click="chooseStore(item.good_id,item)">
							<span :class="{ed:item.isChoose}"></span>
						</div>
						<div class="right-content">
							<img :src="item.name"/>
							<div class="detals">
								<p class="titt">{{item.describe}}</p>
								<p class="explain">{{item.coverImg}}</p>
								<p class="price">￥{{item.price}}<i>x {{item.num}}</i></p>
							</div>
							<p class="num clearfix">购买数量  <mybuynumber :buynum="item.num" @decNum="decNum(item)" @addNum="addNum(item.num)" :price="item.price" :isCheck="item.isChoose"></mybuynumber></p>
						</div>	
					</li>										
				</ul>
			</div>
		</div>
		<div class="total_div">
			<p>
				<span :class="{ choose: true, ed: hasChooseAll }" @click="chooseAll">全选</span>
				合计：<i>￥{{choosetotal}}</i>
				<button>提交订单</button>
			</p>
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
			mydialog:dialog,
			userId:""
		},
		data(){
			return{
				title:"购物车(6)",
				buynum:1,
				price:20,
				 //choosetotal:0,
				showback:false,
				shoppingListData:null,
				hasChooseAll:false  //是否全选
			}
		},
		computed:{
			choosetotal () {
				return this.$store.state.choosetotal;
			}
			// choosetotal:{
			// 	get() {
			// 		return this.$store.state.choosetotal
			// 	},
			// 	set() {}
			// }
		},
		watch:{
			shoppingListData: {
				handler(newval) {
					var total = 0
					if (newval) {
						newval.map((item, index, array1)=>{
							if (item.isChoose) {
								total +=( item.price * item.num );
							}
						})
					}
					this.$store.dispatch('getChoosetotal', total)
				},
				deep: true
			}
		},
		methods:{
			getShoppingListData(){
				this.userId = localStorage.getItem("userId");

				this.$http.get(this.resource +"/shop/list",{params:{
					u_id:this.userId
				}}).then((res)=>{
					console.log(res.data)
					 this.shoppingListData=res.data;
					
					// this.$store.dispatch("getShoppingCarList",res.data);
					
				}).catch((err)=>{
					console.log(err)
				});
			},
			chooseStore(id,item){
				console.log("123");
				var isChoose= 0;
				if(item.isChoose){
					isChoose = 0;
				}else {
					isChoose = 1;
				}
				this.$http.put(this.resource + "/shop/edit",{
					isChoose:isChoose,
					u_id:this.u_id,
					good_id:id
				}).then((res)=>{
					console.log(res.data);
				}).catch((err)=>{
					console.log(err);
				});
				item.isChoose = !item.isChoose;
				var sum = 0;
				console.log();
		
				this.shoppingListData.map((obj, index, array1)=>{
					if(obj.isChoose==1){
						sum ++;
					}

				});
				console.log(sum);
				if(sum==this.shoppingListData.length){
					this.hasChooseAll= true;
				}else{
					this.hasChooseAll= false;
				}
				//进行数据请求
			},
			chooseAll () {
				if(this.hasChooseAll){
					this.shoppingListData.map((obj, index, array1)=>{
						obj.ischoose=0;
					});
					this.hasChooseAll= 0;
					this.$store.dispatch('getChoosetotal', 0)
				}else{
					this.shoppingListData.map((obj, index, array1)=>{
						obj.isChoose=1;
					});
					this.hasChooseAll= 1;
				}
				console.log(this.shoppingListData)
			},
			decNum (item) {
				item.num == item.num--;
				if (this.isCheck) {
					var choosetotal = Number(this.choosetotal) - Number(this.price)
					this.$store.dispatch('getChoosetotal', choosetotal)
				}
			},
			addNum () {
				console.log(123);
				if (this.isCheck) { 
						var choosetotal = Number(this.choosetotal) + Number(this.price)
						this.$store.dispatch('getChoosetotal', choosetotal)
					}
			}

		},
		mounted(){
			this.getShoppingListData();
			this.userId = localStorage.getItem("userId");

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
				background-size: 20px 20px;
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