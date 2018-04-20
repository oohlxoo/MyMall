<template>
		<div class="contents">
			<ibanner></ibanner><!--先不调用接口 -->
			<!--商品类型推荐 （4条数据）-->
			<ul class="new-product">
				<li v-for="(item,index) in popTypelist" @click="jumpProType(item.gt_id,item.gt_name)">
					<img :src="item.gt_icon">{{item.gt_name}}
				</li>
			</ul>
			<p class="jptitle">精品推荐</p>
			<!--精品推荐列表：获取4件最主流的商品-->
			<prodect-list :productlist="productList"></prodect-list>
		</div>		
</template>

<script>
import ibanner from '../components/common/banner'
import prodectList from '../components/common/productList'
	export default{
		data(){
			return {
				popTypelist:null,
			}
		},
        components:{
            ibanner,
            prodectList
        },
        computed:{
			productList(){
				return this.$store.state.productList;	
			}
		},
        methods:{
        	jumpProType(gt_id,gt_name){
        		this.$router.push("/productType/" + gt_id+"/"+gt_name);
        	},
        	getPopType(){
        		this.$http.get(this.resource + "/getPopType",{
        			params:{/*account:this.$store.userinfo.account,
        					token:this.$store.userinfo.token*/}
        		}).then((res)=>{
        			this.popTypelist=res.data;
        		}).catch((err)=>{

        		});
        	},
        	getProListDta(){
        		this.$http.get(this.resource + "/productList").then((res) => {
        			
					this.$store.dispatch("fetchProductList",res.data)
				}).catch((err)=>{
					console.log(err)
				})
        	}

        },
          mounted(){
        	this.getPopType();
        	this.getProListDta();
        }
	}
</script>

<style lang="less">
	.new-product{
		height: 110px;
		width: 98%;
		margin: 0 auto;
		box-shadow: 1px -1px 4px #888888;
		li{
			text-align: center;
			width: 25%;
			float: left;
			color: #343437;
			img{
				width: 60px;
				height: 60px;
				border-radius: 30px;
				display: block;
				margin:10px auto ;
			}		
		}
		
	}
	.jptitle{
			height: 20px;
			line-height: 20px;
			font-size: 10px;
			color: #969696;
			&:before{
				content: "";
				width: 5px;
				height: 10px;
				background:salmon;
				display: inline-block;
				margin:0 5px;
			}
		}

</style>