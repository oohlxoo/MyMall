<template>
	<div class="allcontent">
		<myheaders :title="detailslist.title"></myheaders>
		<div class="details">
			<div class="typeshow">
				<ul>
					<li v-for="item in detailslist.img" v-touch:touchend="onTouchEnd">
						<img :src="detailslist.img[nowindex]">	
					</li>
				
				</ul>
				<div class="length">
					<p><span v-for="(o,i) in detailslist.img" :class="{current:(i===nowindex)}"></span></p>
				</div>	
			</div>
			<div class="priceinfo">
				<p class="pri">￥{{detailslist.price}}</p>
				<p class="others"><span>月销量：{{detailslist.salesvolume}}</span><span>产地：{{detailslist.address}}</span></p>
			</div>
			<div class="appraise">
				<p class="count">商品评价({{detailslist.assess.length}})</p>
				<ul>
					<li class="clearfix" v-for="(item,index) in detailslist.assess" :class="{hideBorderBottom:item.islast}">
						<p class="clearfix">
							<img class="img" :src="item.userpic">
							<span class="username">{{item.nikename}}</span>
							<mystar :num="item.start"></mystar></p>
						<p class= "text">{{item.content}}
						</p>
						<p class="date"><span>{{item.date}}</span></p>
					</li>
				</ul>
			</div>
			<div class="button_div">
				<button>立即购买</button>
			</div>
		</div>
	
	</div>
</template>

<script>	
	import header from "./header"	
	import star from "./star"	
	export default {
		data(){
			return {
				nowindex:0
			}
		},
		components:{
			myheaders:header,
			mystar:star
		},
		methods:{
			//点击屏幕，切换图片
			onTouchEnd(){
				var count=this.detailslist.img.length-1;
				if(this.nowindex<count){
					this.nowindex++;
				}else{
					this.nowindex=0
				}
			}			
		},
		computed:{
			id(){
				return  this.$route.params.id
			},
			detailslist:{
				get(){
					return this.$store.state.getdetails				
				},
				set(){
				}
			}
		},
		created(){
			this.$http.get('/api/getdetails',{params: {id: this.id}}
		).then((res) => {
			
				this.$store.dispatch('getProListById', res.data)			
			}).catch((err) => {
					console.log(err)
			});
		},
		mounted(){
			//异步请求需要时间加载，此处模拟接口是，执行速度太快，拿不到数据，可写个定时器~~~
			//console.log(this.detailslist);
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
			   				width: 50%;
							display: inline-block;
							color:#9c9c9c;
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
	.button_div{
		margin-top: 10px;
		height: 50px;
		button{
	   	    background: linear-gradient(to right, #ffa100,#ff6804);
			width: 100%;
			height: 100%;
		    color: floralwhite;
		    text-align: center;
		    display: block;
		    line-height: 50px;
		    font-size: 16px;
		    
		}
	}
}
</style>