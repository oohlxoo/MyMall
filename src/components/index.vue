<template>
		<div class="contents">
			<ibanner></ibanner>
			<ul class="new-product">
				<li class="new1"><i></i>早秋新品</li>
				<li class="new2"><i></i>心机显瘦</li>
				<li class="new3"><i></i>气质女神</li>
				<li class="new4"><i></i>轻装复古</li>
			</ul>
			<p class="jptitle">精品推荐</p>
			<prodect-list></prodect-list>
		</div>		
</template>

<script>
import ibanner from '../components/common/banner'
import prodectList from '../components/common/productList'
	export default{
        components:{
            ibanner,
            prodectList
        },
        mouneted(){
        	console.log(this.$route);
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
			color: #4d00ff;
			i{
				width: 60px;
				height: 60px;
				border-radius: 30px;
				display: block;
				background: red;
				margin:10px auto ;
				background-size: 100% 100% !important;
			}
			&.new1{
				i{
					background:url(../assets/img/c1.png) no-repeat ;
				}
			}
			&.new2{
				i{
					background:url(../assets/img/c2.png) no-repeat ;
				}
			}
			&.new3{
				i{
					background:url(../assets/img/c3.png) no-repeat ;
				}
			}
			&.new4{
				i{
					background:url(../assets/img/c4.png) no-repeat ;
				}
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