<template>
	<div>
		<myheader :title="title"></myheader>
		<div class="part_form">
			<p>
				<input placeholder="手机号" v-model="account" @mouseleave="checkAccount" />
				<!--<button class="getCheckNum">获取验证码</button>-->
			</p>
			
			<p>
				<input class="checknum" placeholder="验证码" />
				<img class="rrr"  @click="getCheckNum"  src="../assets/img/rrr.png" />
				<img class="furbish" src="../assets/img/icon-refurbish.png" />
			</p>
			<p>
			<input type="password" placeholder="密码" />
			</p>
			<button class="button" @click="register">立即注册</button>
		</div>
	</div>
</template>

<script>
	import header from './common/header'
	export default{
		data(){
			return{
				title:"注册新账号",
				account:null
			}
		},
		components:{
			myheader:header
		},
		methods:{
			//检验账号
			checkAccount(){
				var regAccount = /^1\d{1}$/;
				if(!regAccount.test(this.account)){
					alert("请输入正确的手机号码");
					this.account="";
					return
				}
				this.$http.get("/api/checkAccount",
				{params:{account:this.account}}).then((res)=>{
					console.log(res.data.data.isExist);
					if(!res.data.data.isExist){
						alert("该账号已注册");
					}
				}).catch((err)=>{
					console.log(err);
				});
			},
			//获取验证码
			getCheckNum(){
				this.$http.get("/api/checkAccount").then((res)=>{
					console.log(res.data.data.checkNum);
				}).catch((err)=>{
					console.log(err);
				});
			},
			//提交注册请求
			register(){
				//检验账号 
				//检验验证码
				//检验密码
				this.$http.get("/api/checkAccount",{
					params:{
						account:this.account,
						checkNum:this.checkNum,
						password:this.password
					}
				}).then((res)=>{
					console.log(res.data.data.checkNum);
				}).catch((err)=>{
					console.log(err);
				});
				
			}
			
		}
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