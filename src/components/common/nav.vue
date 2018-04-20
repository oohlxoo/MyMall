<template>
	<div>
		<nav class="nav">
			<ul class="clearfix">
                <li class="ind"><router-link to="/index"><i></i>首页</router-link></li>
                <li class="pro"><router-link to="/products"><i></i>分类</router-link></li>
                <li class="ord"><router-link to="shoppingcart"><i></i>购物车</router-link></li>
                <li class="set"><router-link to="/setting"><i></i>我的</router-link></li>
            </ul>			
		</nav>
	</div>
</template>

<script>
	export default{

	}
</script>

<style lang="less">
	.active{
		color: #ff4b6d  !important;
		font-weight: bold;
	}
    .nav{
    	border-top:1px solid #ececec;
    	background-color: #fff;
        padding: 3px 0;
        li{
        	float: left;
        	text-align: center;
        	width: 25%;
        	
        	a{
        		top: 20px;
        		color: #82779c;
        	}
        	i{
        		display: block;
        		width: 25px;
        		height:25px;
        		text-align: center;
        		margin: 0px auto;
        		background-size:100% !important;
        	}
        	&.ind{
        		i{
        			background: url(../../assets/img/icon-index.png);
        		}
        		.active i{
        			background: url(../../assets/img/icon-index.png);
        		}
        	}
        	&.pro{
        		i{
        			background: url(../../assets/img/icon-kind.png);
        		}	
        		.active i{
        			background: url(../../assets/img/icon-kind.png);
        		}
        	}
        	&.ord{
        		i{
        			background: url(../../assets/img/icon-shopping.png);
        		}	
        		.active i{
        			background: url(../../assets/img/icon-shopping.png);
        		}
        	}
        	&.set{
        		i{
        			background: url(../../assets/img/icon-mine.png);
        		}
        		.active i{
        			background: url(../../assets/img/icon-mine.png);
        		}
        	}
        	
        	
        	
        }
    }
</style>