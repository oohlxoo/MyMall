<template>
	<div>
		<!--<p class="part_head">
			<router-link to="/index">
				<span class="back">返回</span>
			</router-link>
		</p>-->
		<myheader :title="title"></myheader>
		<!--<img class="part_myicon" src="../assets/img/icon-myiocn.png"/>
		--><div class="part_form">
			
			<p>
				<input placeholder="手机号" />
				<!--<button class="getCheckNum">获取验证码</button>-->
			</p>
			
			<p>
				<input class="checknum" placeholder="验证码" />
				<img class="rrr"  src="../assets/img/rrr.png" />
				<img class="furbish" src="../assets/img/icon-refurbish.png" />
			</p>
			<p>
			<input type="password" placeholder="密码" />
			</p>
			<button class="button">立即注册</button>
		</div>
	</div>
</template>

<script>
	import header from './common/header'
	export default{
		data(){
			return{
				title:"注册新账号"
			}
		},
		components:{
			myheader:header
		},
	}
</script>

<style lang="less" scoped>
	.part_head{
		height: 45px;
		line-height: 45px;
		padding: 0 15px;
		font-size: 14px;
		.back{
			float: left;
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
		p {
			input{
				display: inline-block;
			}
			width: 100%;
			display: block;
			line-height: 40px;
			height: 40px;
			border-bottom: 1px solid #ececec;
			.checknum{
				width: 60%;
			}
			
		}
		.furbish{
			width: 20px;
			height: 20px;
			float: right;
			margin-top: 10px;
			margin-right: 2px;
		}
		.rrr{
			width: 80px;
			height: 30px;
			float: right;
			margin-top: 5px;
		}
		button{
			&.getCheckNum{
				width: 100px;
			    height: 40px;
			    float: right;
			    background: #fff;
			    color: #ff6804;
			    /* padding-left: 10px; */
			    border: 1px solid #ff6804;
			    height: 30px;
			    border-radius: 6px;
				
			}
			&.button{
				background: linear-gradient(to right, #ffa100, #ff6804);
				color: floralwhite;
			    width: 100%;
			    height: 100%;
			    margin: 0 auto;
			    text-align: center;
			    display: block;
			    line-height: 40px;
			    font-size: 16px;
			    margin-top:40px
			}
		}
	}
	.header{
		background:#fff !important;
	}
</style>