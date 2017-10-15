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
					<li :class="{current:number==0}" @click="showDetails(0)">上衣</li>
					<li :class="{current:number==1}" @click="showDetails(1)">裙子</li>
					<li :class="{current:number==2}" @click="showDetails(2)">外套</li>
					<li :class="{current:number==3}" @click="showDetails(3)">女鞋</li>
					<li :class="{current:number==4}" @click="showDetails(4)">男友</li>
					<li :class="{current:number==5}" @click="showDetails(5)">包包</li>
					<li :class="{current:number==6}" @click="showDetails(6)">外套</li>
					<li :class="{current:number==7}" @click="showDetails(7)">女鞋</li>
					<li :class="{current:number==8}" @click="showDetails(8)">男友</li>
					<li :class="{current:number==9}" @click="showDetails(9)">包包</li>	
					<li :class="{current:number==6}" @click="showDetails(6)">外套</li>
					<li :class="{current:number==7}" @click="showDetails(7)">女鞋</li>
					<li :class="{current:number==8}" @click="showDetails(8)">男友</li>
					<li :class="{current:number==9}" @click="showDetails(9)">包包</li>
				</ul>
			</div>
			<div class="smallType">
				<ul>
					<li @click="jump()">
						<img src="../assets/img/t1.png" />
						<span>秋上新</span>
					</li>
					<li>
						<img src="../assets/img/t1.png" />
						<span>秋上新</span>
					<li>
						<img src="../assets/img/t1.png" />
						<span>卫衣</span>
					</li>
					<li>
						<img src="../assets/img/t1.png" />
						<span>秋上新</span>
					
					<li>
						<img src="../assets/img/t1.png" />
						<span>秋上新</span>
					<li>
						<img src="../assets/img/t1.png" />
						<span>卫衣</span>
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
				showback:false
			}
		},
      	components:{
      		myheader,
      	},
      	methods:{
      		//切换
      		showDetails(num){
      			this.number=num;
      		},
      		//跳转页面
      		jump(){
      			this.$router.push('/productType/');
      			//this.$router.push('/details/' +  value)
      		},
      		//搜索页面
      		jumpsearch(){
      			this.$router.push('/search');
      		}
      		
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
					color:#82779c;
					&.current{
						color: #011FFF;
						background: #fff;
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