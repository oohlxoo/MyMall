<template>
	<div class="allcontent">
		<myheaders :title="detailslist.describe"></myheaders>
		<div class="details">
			<div class="typeshow">
				<!-- <ul>
					<li v-for="(item,index) in detailslist.g_img" v-touch:touchend="onTouchEnd" :key="index">
					 -->
					 <ul>
					<li  v-touch:touchend="onTouchEnd" >
						<img :src="detailslist.name">	
					</li>
				
				</ul>
				<div class="length">
					<p><span v-for="(o,i) in detailslist.g_img" :class="{current:(i===nowindex)}" :key="i"></span></p>
				</div>	
			</div>
			<div class="priceinfo">
				<p class="pri">￥{{detailslist.price}}</p>
				<p class="others"><span>月销量：1000</span><span>产地：{{detailslist.address}}</span>
					<!--<span class="collect"></span>  未收藏的样式-->
					<span class="collect" :class="{'collected':iscollect}"  @click="collect(detailslist.gt_id)"></span>
							
				</p>
			</div>
			<!-- <div class="appraise">
				<p class="count">商品评价({{detailslist.t_comment.length}})</p>
				<ul>
					<li class="clearfix" v-for="(item,index) in detailslist.t_comment" :key="index" :class="{hideBorderBottom:item.islast}">
						<p class="clearfix">
							<img class="img" :src="item.u_icon">
							<span class="username">{{item.u_nickname}}</span>
							<mystar :num="item.com_star"></mystar></p>
						<p class= "text">{{item.com_content}}
						</p>
						<p class="date"><span>{{item.com_date}}</span></p>
					</li>
				</ul>
			</div> -->
			<div class="button_div">
			    <button @click="addShopping(detailslist.id)">加入购物车</button>
				<button @click="buynow(detailslist.g_id,detailslist.g_price)">立即购买</button>
			</div>
		</div>
		<mytip  :isShow="mytipShow" :text="tiptext" @closeModal="mytipShow = !mytipShow"></mytip>
	</div>
</template>

<script>	
	import header from "./../common/header"	
	import star from "./../common/star"	
	import tip from '../common/tiptip'
		
	export default {
		data(){
			return {
				nowindex:0,
				iscollect:false,
				mytipShow:false,
				tiptext:"",
				detailslist:[],
				c_id:""
			}
		},
		components:{
			myheaders:header,
			mystar:star,
			mytip:tip
		},
		methods:{
			//点击屏幕，切换图片
			 onTouchEnd(){
			// 	var count=this.detailslist.g_img.length-1;
			// 	if(this.nowindex<count){
			// 		this.nowindex++;
			// 	}else{
			// 		this.nowindex=0
			// 	}
			 },
			//收藏与取消收藏
			collect(id){
				console.log(this.c_id, 'c_id')
				console.log(id)
				var myDate = new Date();//获取系统当前时间
				var mytime = myDate.toLocaleString();
				var u_id = parseInt(localStorage.getItem("userId"));
				console.log(mytime);
				console.log(this.c_id);
				//this.iscollect= !this.iscollect;
				if(this.iscollect){
					this.$http.delete( this.resource + "/collect/remove",{params:{
						id :this.c_id 
					}})
					.then((res)=>{
						if(res.status==200){
							this.iscollect= !this.iscollect;
							this.mytipShow=true;
							this.tiptext="已取消收藏该商品"
						}

					}).catch(()=>{

					});
				}else{
					this.$http.post( this.resource + "/collect/add",{
						"u_id":u_id,
						"good_id":id,
						"date": mytime
					})
					.then((res)=>{
						if(res.status==200){
							this.iscollect= !this.iscollect;
							this.getCid();
							this.mytipShow=true;
							this.tiptext="已收藏该商品"
						}

					}).catch(()=>{

					});
				}
			
			},
			//加入购物车
			addShopping(id){
				if(this.userId == "" && this.userId == null){
					this.$router.push("/login");
				}
				 
				this.$http.put( this.resource + "/shop/edit",{
					good_id:id,
					action:'add',
					u_id:this.userId
				})
				.then((res)=>{
					console.log(res.data);
					this.mytipShow=true;
					this.tiptext="添加购物车成功"
				}).catch(()=>{

				});
			},
			//立即购买
			buynow(g_id, g_price){
				//this.$router.push('/commitorder/'+ g_id);
				this.$router.push({path: '/commitorder/' + id, query: {price: g_price}});
			},
			getCid() {
				this.$http.get(this.resource + '/collect/isCollect',{params:{
						good_id:this.id,
						u_id: this.userId
					}}
				).then((res)=>{
					this.iscollect = res.data.isCollect;
					console.log(res.data.isCollect,'flag')
					if(res.data.isCollect){
						this.c_id = res.data.c_id;
						console.log(this.c_id);
					}

					
				}).catch((err)=>{
					console.log(err);
				});
			},
		},
		computed:{
			id(){
				return  this.$route.params.id
			},
			// detailslist:{
			// 	get(){
			// 		return this.$store.state.getdetails				
			// 	},
			// 	set(){
			// 	}
			// }
		},
		created(){	
			this.$http.get( this.resource + '/goods/detail',{params: {id: this.id}}
			).then((res) => {
				console.log(res);
				this.detailslist = res.data;
				//this.$store.dispatch('getProListById', res.data)			
			}).catch((err) => {
				console.log(err)
			});
			

		},
		mounted(){
			//异步请求需要时间加载，此处模拟接口是，执行速度太快，拿不到数据，可写个定时器~~~
			//console.log(this.detailslist);

			//查询该商品，当前登录用户是否收藏
			this.userId = localStorage.getItem("userId");
			console.log(this.userId);
			if(this.userId== "" || this.userId == null){
				return;
			}else{
				this.getCid()
			}
		}
	}
</script>

<style lang="less">
.allcontent{
	display: flex;
	flex-direction: column;
	
	.details{
		flex:  1;
	
		.typeshow{
			position: relative;
			ul{
				width: 100%;
				height: 320px;
				overflow: hidden;
			
			}
			.length{
				position: absolute;
				bottom: 0;
				height: 20px;
				width: 100%;
				background: #888888;
				opacity: 0.5;
				text-align: center;
				span{
					width:6px;
					height: 6px;
					border-radius:3px;
					margin: 0 5px;
					background: white;
					display: inline-block;	
					&.current{
						background: red;
					}
				}				
			}
		}
		.priceinfo{
			   box-shadow: 1px -1px 4px #888888;
			   
			   p{
			   		padding: 0 10px;
				   	line-height: 30px;
				   	&.pri{
			   			color: red;
			   			font-weight: bold;
			   			font-size: 18px;
			   		}
			   		&.others{
			   			span{
			   				width: 33%;
							display: inline-block;
							color:#9c9c9c;
			   			}
			   			.collect{
			   			text-align: right;
						display: inline-block;
						width:25px;
						height: 25px;
						margin-left: 10px;
						background: url(../../assets/img/icon-collect.png) no-repeat right bottom;
						background-size: 80% 80%;
						&.collected{
							background: url(../../assets/img/icon-collect1.png) no-repeat right bottom;
							background-size: 80% 80%;
						}
					
					}
			   		}
			   }
			
		}
		.appraise{
			margin: 10px;
		    .count{
		    	height:30px;
		    	line-height: 30px;
			   	font-size: 16px;
			   	color: #9c9c9c;
		    	
		    }
		    ul{
		    	li{
		    		margin:5px 0;
		    		border-bottom: 1px solid #ececec;
		    		padding-bottom: 15px;
		    		&.hideBorderBottom
		    		{
		    			border-bottom:none !important;
		    		}
		    		.img{
		    			width: 50px;
					    height: 50px;
					    border-radius: 25px;
					    float: left;
		    		}
		    		
		    		.img1{
		    			width: 20px;
					    height: 20px;
					    border-radius: 10px;
					   float: left;
		    		}
		    		
		    		.username{
		    			    float: left;
						    display: inline-block;
						    margin: 25px 5px 0;
						    font-size: 14px;
						    color: #9c9c9c;
		    		}
		    		
		    		.text{
		    			padding: 5px 0;
		    			text-indent:2em;
		    			line-height: 20px;
		    		}
		    		.date{
		    			float: right;
		    			padding-right: 10px;
		    		}
		    	}
		    }
		}
		}
	}
	.button_div{
		margin-top: 10px;
		height: 50px;
		position: absolute;
		width: 100%;
		bottom: 0;
		button{
	   	    background: #ff8302;
			width: 50%;
			height: 100%;
		    color: floralwhite;
		    text-align: center;
		    display: block;
		    line-height: 50px;
		    font-size: 16px;
		    float: left;
		    &:last-child{
		    	 background: #ff4b6d;
		    }
		    
		}
	}
</style>