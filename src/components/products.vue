<template>
	<div class="mainindex">
		<myheader :title="title" :showback="showback"></myheader>
		<!--<h2>全部分类</h2>-->
		<div class="search_div">
			<input placeholder="请输入关键字" @click="jumpsearch"/>
		</div>
		<div class="typeList">
			<div class="bigType">
				<ul >
					<li v-for="(obj,index) in allProType.parent" :class="{current:number==index}" :key="obj.id"
					 @click="showDetails(obj.id,index)">{{obj.name}}</li>
				</ul>
			</div>
			<div class="smallType">
				<ul>
					<li v-for="(obj,ind) in allProType.childlist" @click="jumpProduct(obj.id,obj.name)"  :key="obj.id" >
						<img :src="obj.coverImg" />
						<span>{{obj.name}}</span>
					</li>		
				</ul>
			</div>
		</div>
		
	</div>
</template>

<script>
	import myheader from "./common/header.vue"
	export default{
		data(){
			return {
				number:0,
				title:"全部分类",
				showback:false,
				allProType:{
					parent:[],
					childlist:[]
				},
				childlist:null


			}
		},
      	components:{
      		myheader,
      	},
      	methods:{
      		
      		//跳转页面
      		jumpProduct(gt_id,gt_name){
      			this.$router.push('/productType/'+ gt_id +'/'+ gt_name);
      			//this.$router.push('/details/' +  value)

      		},
      		//搜索页面
      		jumpsearch(){
      			this.$router.push('/search');
      		},
      		getAllProType(){
				  this.$http.get(this.resource + "/appkey/list").
				  then((res)=>{
						  this.allProType.parent = res.data;
						  //渲染二级菜单
						  this.showDetails(this.allProType.parent[0].id,0);
						  
      			}).catch((err)=>{
					  console.log(err);
      			});
			  },
			  //切换一级菜单
      		showDetails(id,index){
      			this.number=index;
      			//获取的子级的类型
      			this.$http.get(this.resource + "/goodstype/list",{params:{
      				id:id
      			}}).then((res)=>{
      				console.log(res.data);
      				this.allProType.childlist=res.data;
      			}).catch((err)=>{
					  console.log(err)
      			});
      		}
      	},
      	mounted(){
			this.getAllProType();
      	}
	}

</script>

<style lang="less">
	.mainindex{
		h2{
			text-align: center;
			color: #929292;
			border-bottom: 1px solid #ececec;
			height: 45px;
			line-height: 45px;		
		}
		.search_div{
			width:100%;
			background: #f5f5f5;
			margin: 0 auto;
			height: 45px;
			line-height: 45px;
			text-align: center;
			input{
				height: 30px;
				width: 94%;
				line-height: 30px;
				text-align: left;
				padding-left: 20px;
				& :before{
					content:"";
					display: inline-block;
					width: 16px;
					height: 16px;
					background-image: url(../assets/img/icon_search.png);
					background-size: 100%;
				}
			}
		}
		.typeList{
			display:flex;    
			flex-direction: row;
			.bigType{
				width: 80px;
    			overflow-y: scroll;
				li{
					line-height: 40px;
					height: 40px;
					text-align: center;
					border-bottom: 1px solid #ececec;
					background:#f5f5f5 ;
					color:#191919;
					&.current{
						color: #ff4b6d ;
						background: #fff;
						border-left: 4px solid #ff4b6d;
					}
				}
			}
			.smallType{
				flex: 1;
				li{
					width: 33%;
					float: left;
					padding: 5px;
					span{
						display: block;
						color: #b7b7b7;
						text-align: center;
					}
				}
			}			
		}					
	}
</style>