<template>
	<div class="manage-address">
		<myheader :title="title"></myheader>
		<div class="add-ressList">
			<ul class="list">
				<li v-for="(item,index) in myaddressList">
					<p><span class="username">{{item.a_name}}</span>
						<span class="phone">{{item.a_phone}}</span>
					</p>
					<p>{{item.a_tity}} </p>
					<p>{{item.a_detailsAddress}} </p>
					<p class="option">
						<span class="detault" @click="chooseDetault" :class="{ed:isDefault}">设为默认</span>
						<span class="edit">编辑</span>
						<span class="del">删除</span> 
					</p>
				</li>	
				
				
				
				
			</ul>
		</div>
		<div class="add-address">
			<button @click="manageaddress(0)">添加新地址</button>
		</div>
	</div>
</template>

<script>
	import header from "../common/header"
	export default{
		data(){
			return {
				title:"收货地址管理",
				isDefault:false,
				myaddressList:null
			}
		},
		components:{
			myheader:header
		},
		watch:{
		
		},
		methods:{
			chooseDetault(){
				this.isDefault=!this.isDefault;
			},
			manageaddress(data){
				console.log(data);
				this.$router.push("/manageaddress");
			},
			getAddressListData(){
				this.$http.get("api/getMyaddressList"/*,{params:{
				account:this.$store.userinfo.account,
				token:this.$store.userinfo.token
			}}*/).then((res)=>{
					console.log(res.data)
					this.myaddressList=res.data;
				}).catch((err)=>{
					console.log(err)
				});
			}			
		},
		mounted(){
			this.getAddressListData();
		}
		
	}
</script>

<style lang="less">
	.manage-address{
		display: flex;
		flex-direction:column;
		height: 100%;
		.add-ressList{
			flex: 1;
			overflow-y: scroll;
			background-color: #f5f5f5;
			.list{
				li{
					box-sizing: content-box;
					background-color: #fff;
					margin-bottom: 10px;
					p{
						padding: 6px 10px;
						span{
							display: inline-block;
							&.phone{
								float: right;
							}
						}
						&.option{
							border-top: 1px solid #ececec;
							padding: 0;
							height: 40px;
							line-height: 40px;
							text-indent: 10px;
							text-align: right;
							span{
								background-size: 25px !important;
								margin-right: 10px;
							}
							.detault{
								background: url(../../assets/img/icon-choose.png) no-repeat 10px center;
								background-size: 25px;
								float: left;
								width: 90px;
							
								&.ed{
									background: url(../../assets/img/icon-choose1.png) no-repeat 10px  center ;
								}
								
							}
							.edit{
								width: 50px;
								background: url(../../assets/img/icon-edit.png) no-repeat left center;
								
							}
							.del{
								width: 50px;
								background: url(../../assets/img/icon-del.png) no-repeat left center;
							}
						}
					}
				}
			}
		}
		.add-address{
			height: 45px;
			line-height: 45px;
			width: 100%;
			z-index: 9;
			text-align: right;
			button{
			    background: linear-gradient(to right, #ffa100, #ff6804);
			    width: 100%;
			    height: 100%;
			    color: floralwhite;
			    text-align: center;
			    display: inline-block;
			    line-height: 45px;
			}
		}
	}
</style>