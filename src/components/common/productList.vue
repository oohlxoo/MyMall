<template>
	<div>
		<div class="productlist">
			<ul class="list" v-if="!(productlist.length==0)">
				<li v-for="(item,index) in productlist" :key="index">
					<!--<router-link to="/details/10">-->
					<a>
						<img :src="item.name" @click="jump(item.id)"/>
						<div class="detals">
							<p class="titt" @click="jump(item.id)">{{item.describe }}</p>
							<p class="explain" @click="jump(item.id)">{{item.coverImg}}</p>
							<p class="price"><i>￥</i>{{item.price}}<del>￥{{item.originalCost}}</del></p>
							<p class="button"><button @click="buypro(item.id, item.price)" >立即购买</button></p>
						</div>
					</a>
					<!--</router-link>-->
				</li>
			</ul>

			<p v-if="(productlist.length==0)" class="none" >暂无数据</p>
		</div>
	</div>
</template>
<script>
	export default{
		data(){
			return {
				iscollect:false,
				indpic:0
			}
		},
		props:{
			productlist:{
				type:Array,
				default:null
			}
		},
		methods:{
			jump (value) {
				this.$router.push('/details/' +  value);
			},
			buypro(id, data){
				console.log(id);
				// this.$router.push('/commitorder/' + id);
				this.$router.push({path: '/commitorder/' + id+"/1", query: {price: data}});
			}
		},
		mounted () {
		console.log(this.productlist)			
		}	
	}
</script>

<style scoped lang="less">
	.productlist{
		margin:5px auto;
		width: 98%;
		padding: 2px 5px;
		
		.list{
			li{
  			    margin-top: 10px;
  			    a{
  			    	display: -webkit-box;
  			    	display:flex;/*设为伸缩容器*/  
  			   		 flex-flow:row;
  			    }
	  			p{
	  			   line-height: 25px;
	  			}
				img{
					width:120px;
					height: 120px;
				}
				.detals{
					flex:1;
					padding: 5px 10px;	
					border: 1px solid rgba(230, 230, 230, 0.8);
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
						font-size: 10px;
					}
					del{
						color: #ababab;
						font-size: 12px;
						padding-left:20px
					}
				}
				.button{
					button{
						background: #fff;
					    border: 1px solid #ff4b6d;
					    padding: 4px 10px;
					    border-radius: 4px;
					    color: #ff4b6d;
					    float: right;
					}
				}
				
			}
			
		}
		.none{
			text-align: center;
		}
	}
</style>