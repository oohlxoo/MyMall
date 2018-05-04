<template>
	<div>
		<myheader :title="title"></myheader>
		<div class="collectlist">
			<ul class="list">
				<li v-for="(item,index) in collectList" :key="index" @click="jumpDetails(item.good_id)">
					<img :src="item.name"/>
					<div class="detals">
						<p class="titt">{{item.describe}}<span class="collecttime">收藏于：{{item.date}}</span></p>
						<p class="explain">{{item.coverImg}}</p>
						<p class="price">￥{{item.price}}
							<!-- <span class="collect" :class="{'collected':item.c_iscollect}" @click="iscollectfunction"></span>
						 -->
						</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
</template>

<script>
	import header from "../common/header"
	export  default{
		// http:{
		// 	emulateJSON:true
		// },
		data(){
			return {
				title:"我的收藏",
				iscollect:false,
				collectList:null,
				userId:""
			}
		},
		components:{
			myheader:header
		},
		methods:{
			iscollectfunction(){
				this.iscollect=!this.iscollect;
				// this.$http.delete(
				// 	this.resource + "/collect/remove"
				// );
				
			},
			getCollectList(){
				this.$http.get(this.resource + "/collect/list",{params:{
					u_id:this.userId
					/*account:this.$store.userinfo.account,
					token:this.$store.userinfo.token,*/
					//c_iscollect:true
				}}).then((res)=>{
					console.log(res.data);
					this.collectList=res.data;
				}).catch((err)=>{
					console.log(err);
				});
			},
			jumpDetails(id){
				console.log("即将跳转");
				this.$router.push("/details/" + id);
			}
		},
		mounted(){
			this.userId = localStorage.getItem("userId");
			this.getCollectList();	
		}
	}
</script>
<style lang="less">
	.collectlist{
		.list{
			padding:0 10px;
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
	    				.collecttime{
	    					font-size: 12px;
	    					font-weight: initial;
	    					float: right;
	    				}
					}
					.price{
						color: #ff4b6d;
						font-size: 18px;
						
					}
					.collect{
						display: inline-block;
						width:25px;
						height: 25px;
						margin-left: 10px;
						float: right;
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
	}
</style>