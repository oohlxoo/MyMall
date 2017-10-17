<template>
	<div>
		<div class="productlist">
			<ul class="list">
				<li v-for="(item,index) in productlist">
					<!--<router-link to="/details/10">-->
					<a>
						<img :src="item.g_img[0]" @click="jump(item.g_id)"/>
						<div class="detals">
							<p class="titt" @click="jump(item.g_id)">{{item.g_title }}</p>
							<p class="explain" @click="jump(item.g_id)">{{item.g_describe}}</p>
							<p class="price"><i>￥</i>{{item.g_price}}<del>￥{{item.g_originalCost}}</del></p>
							<p class="button"><button @click="buypro(item.g_id)" >立即购买</button></p>
						</div>
					</a>
					<!--</router-link>-->
				</li>				
			</ul>
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
			buypro(id){
				console.log(id);
				this.$router.push('/commitOrder/'+id);
			}
		},
		mounted () {			
		}	
	}
</script>

<style scoped lang="less">
	.productlist{
		margin:5px auto;
		width: 98%;
		padding: 2px 5px;
		box-shadow: 1px -1px 4px #888888;
		
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
					    border: 1px solid #4d00ff;
					    padding: 4px 10px;
					    border-radius: 4px;
					    color: #4d00ff;
					    float: right;
					}
				}
			}
		}
	}
</style>