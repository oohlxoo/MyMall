<template>
	<div class="login" >
	    <img src="../assets/img/icon-myiocn.png">
		<p class="line">
			<input  id="account" placeholder="请输入手机号"  v-model="userName" type="text" @blur="checkAccount">
		</p>
		<p class="line">
			<span >&nbsp;{{userNameErr}}</span>
		</p>
		<p class="line">
			<input id="password" placeholder="请输入密码"  v-model="passWord"  type="password" @blur="checkPassword">
		</p>
		<p class="line">
			<span>&nbsp;{{passwordErr}}</span>
		</p>
		<p class="line">
			<button class="but-login " :class="{'disabledoo':butAble}" :disabled="!butAble" @click="butLogin">登录</button>
		</p>
	</div>
</template>

<script>
	export  default{
		http:{
			emulateJSON:true
		},
		data(){
			return {
				userName:"",
				passWord:""	,
				userNameErr:"",
				passwordErr:"",
				userNamePass:false,
				passwordPass:false

			}
		},
		computed:{
			userinfo(){
				return this.$store.state.userInfo;
			},
			butAble(){
				if(this.userNamePass && this.passwordPass && this.userName && this.passWord){ 
					return true;
				}
			}

		},
		watch:{},
		methods:{
			//鼠标离开时，验证手机号
			checkAccount(){
				this.userName=this.userName.trim();
				if(this.userName==null || this.userName==""){
					this.userNameErr="账号不能为空"
				}else if(this.userName.length<11){
					this.userNameErr="账号格式不正确"
				}else{
					this.userNameErr="";
					this.userNamePas=true;
				}
			},
			//鼠标离开时，验证手机号
			checkPassword(){
				//6-12位数字或者字母组合
			   var reg = /^[a-zA-Z0-9]{6,12}$/
				if(this.passWord==""){
					this.passwordErr="密码不能为空"
				}else if(!reg.test(this.passWord)){
					this.passwordErr="密码格式不正确"
				}else{
					this.passwordErr="";
					this.passwordPass=true;
				}
			},
			butLogin(){
				this.$http.post("/wapServer/ajaxLogin",{
					userName:this.userName,
					passWord:this.passWord
				}).then((res)=>{
					console.log(res.data);
					if(res.data.status==200){
						console.log(res.data.message);
						this.$store.dispatch("fetchUsernfo",{userName:this.userName,
					passWord:this.passWord})
					}
					//存储账号信息
					console.log(this.$store.state.userInfo.userName);
				},(err)=>{
					console.log("error");
				})
			}

		}
	}
</script>
	
<style lang="less">
.login{
		position: fixed;
		height: 100%;
		width: 100%;
		/* background: url(../../assets/images/login_bg.png) no-repeat; */
	    background: pink; 
		background-size: 100% 100%;
		img{
				display: block;
				width: 80px;
				height: 80px;
				border-radius: 40px;
				text-align: center;
				margin: 60px auto 30px;
			}
		p{
			margin-top: 10px
		}
		.line{
			text-align: center;
			input{
				width: 50%;
				margin: 0 25%;
				line-height: 30px;
				height: 30px;
				border: none;
				border-bottom: 1px solid #fff;
				padding-left: 5px;
				background:none;

			}
			//选中时去边框
			input{
				outline:none;
			}
			span{
				width: 50%;
				margin: 0 25%;
				color: red;
				font-size: 10px;
				text-align: left;
				display: block;
			}
			.but-login{
				margin-top: 20px;
				width: 100px;
				height: 40px;
  			    border-radius: 6px;
  			    background-color: #627cff;
  			    color: #fff;
  			    opacity: 0.7;
  			    &.disabledoo {
  			    	 background-color: #777;
  			    }
			}

		}
		
	}

</style>