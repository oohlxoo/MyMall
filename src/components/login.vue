<template>
	<div>
		<p class="part_head">
			<router-link to="/index">
				<span class="close">关闭</span>
			</router-link>
			<router-link to="/register">
				<span class="register">注册</span>
			</router-link>
		</p>
		<img class="part_myicon" src="../assets/img/icon-myiocn.png"/>
		<div class="part_form">
			<input placeholder="手机号" />
			<input type="password" placeholder="密码" />
			<button >登录</button>
		</div>
	</div>
</template>

<script>
	export default{
		components:{
			
		}
	}
</script>

<style lang="less">
	.part_head{
		height: 45px;
		line-height: 45px;
		padding: 0 15px;
		font-size: 14px;
		.close{
			float: left;
		}
		.register{
			float: right;
		}
	}
	.part_myicon{
		margin: 0 auto;
		width: 70px;
		height: 70px;
		border-radius: 35px;
	}
	.part_form{
		padding: 0 30px;
		input{
			width: 100%;
			display: block;
			line-height: 40px;
			height: 40px;
			border-bottom: 1px solid #ececec;
		}
		button{
			background: linear-gradient(to right, #ffa100, #ff6804);
		    width: 100%;
		    height: 100%;
		    margin: 0 auto;
		    color: floralwhite;
		    text-align: center;
		    display: block;
		    line-height: 40px;
		    font-size: 16px;
		    margin-top:40px
		}
	}
</style>