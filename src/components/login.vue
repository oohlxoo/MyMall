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
			<input placeholder="手机号" v-model="account"/>
			<input type="password" placeholder="密码" v-model="password" />
			<button @click="userlogin">登录</button>
		</div>
		<!--<tiptip></tiptip>-->
	</div>
</template>

<script>
	import tiptip from "./common/tiptip"
	export default{
		components:{
			tiptip
		},
		data(){
			return{
				account:null,
				password:null,
				
			}
		},
		computed:{
			userinfo () {
				return this.$store.state.userinfo
			}
		},
		methods:{
			
			userlogin(){
				var regAccount = /^1\d{1}$/; //测试的时候，先写两位数字
				if(!regAccount.test(this.account)){
					alert("账号需为11位数字");
					return;
				}
				if(this.password.length<6 || this.password==null){
				    alert("密码至少大于等于6位");
				    return;
				}
				var respassword = /^[0-9a-zA-Z]+$/;
				if(!respassword.test(this.password)){
				    alert("密码只能由数字和字母组成");
				    return;
				}
				this.$http.get('/api/login',{params:{u_account:this.account,u_password:this.password}}
				).then((res)=>{
					this.$store.dispatch('fetchUserinfo', res.data);
				}).catch((err)=>{
					
				});
			}
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