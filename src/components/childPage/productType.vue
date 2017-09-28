<template>
	<div class="mainindex">
		<myheaders></myheaders>
		<!--<div class="search_div">
			<input placeholder="请输入关键字"/>
		</div>-->
		<div class="list_div">
			<ul class="nav clearfix">
				<li class="current">综合</li>
				<li>销量</li>
				<li>价格</li>
			</ul>		
			<prodect-list></prodect-list>
		
		</div>
	</div>
</template>

<script>
	import header from "../common/header"
	import prodectList from '../common/productList'
	export default{
		data(){
			return{
				title:"秋衣"
			}
		},
        components:{
    		myheaders:header,
    		prodectList
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