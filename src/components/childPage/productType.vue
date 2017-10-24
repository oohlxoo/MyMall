<template>
	<div class="mainindex">
		<myheaders :title="title"></myheaders>
		<!--<div class="search_div">
			<input placeholder="请输入关键字"/>
		</div>-->
		<div class="list_div">
			<ul class="nav clearfix">
				<li v-for="(obj,index) in navList" :class="{'current':(index==currentindex)}"  @click="getProListById(index)">{{obj}}</li>
			</ul>		
			<prodect-list :productlist="prodectListData"></prodect-list>
		

		
		</div>
	</div>
</template>

<script>
	import header from "../common/header"
	import prodectList from '../common/productList'

	export default{
		data(){
			return{
				title:"秋衣",
				prodectListData: [],
				navList:["综合","销量","价格"],
				currentindex:0
			}
		},
        components:{
    		myheaders:header,
    		prodectList
    		
        },
        created(){
        	this.title=this.$route.params.gt_name;
        	this.gt_id=this.$route.params.gt_id;
        },
        methods:{
        	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~注意，是否加分页~~~~~~~~~~~~~~~~~~~~~~~
        	getProListById(index){
        		//0 代表综合 1销量 2价格
        		this.currentindex=index;
        		this.$http.get("/api/getProductListById",{params:{
        			gt_id:this.gt_id,
        			order:this.index
        		}}).then((res)=>{
        			this.prodectListData=res.data;
        		}).catch((err)=>{
        			console.log(err);
        		});
        	}
        },
        mounted(){
        	this.getProListById("");
        }
	}
</script>

<style lang="less">
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
				
					background-size: 100%;
				}
			}
		}
		.list_div{
			.nav{
				li{
					float: left;
					width: 33.3%;
					height: 20px;
					line-height: 20px;
					font-size: 16px;
					&.current{
						color:#ff4b6d;
						font-size: 16px;
					}
				}
			}
		}
</style>