<template>
	<div>
		<nav class="nav">
			<ul class="clearfix">
                <li class="ind"><router-link to="/index"><i></i>首页</router-link></li>
                <li class="pro"><router-link to="/products"><i></i>产品</router-link></li>
                <li class="ord"><router-link to="/order"><i></i>订单</router-link></li>
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
		color: royalblue !important;
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
        			background: url(../../assets/img/icon_index.png);
        		}
        		.active i{
        			background: url(../../assets/img/icon_index1.png);
        		}
        	}
        	&.pro{
        		i{
        			background: url(../../assets/img/icon_pro.png);
        		}	
        		.active i{
        			background: url(../../assets/img/icon_pro1.png);
        		}
        	}
        	&.ord{
        		i{
        			background: url(../../assets/img/icon_order.png);
        		}	
        		.active i{
        			background: url(../../assets/img/icon_order1.png);
        		}
        	}
        	&.set{
        		i{
        			background: url(../../assets/img/icon_setting.png);
        		}
        		.active i{
        			background: url(../../assets/img/icon_setting1.png);
        		}
        	}
        	
        	
        	
        }
    }
</style>