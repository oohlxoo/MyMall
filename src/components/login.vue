<template>
	<div class="login" >
	    <img src="../assets/img/icon-myiocn.png">
		<p class="line input-phone">
			<input ref="userName" id="account" placeholder="请输入手机号"  @input="addFormat" maxlength="13" />
			<span v-if="showClear" class="content-clear" @click="clearUserName"></span>
		</p>
		<p class="line">
			<input id="password" placeholder="请输入密码"  v-model="passWord"  type="password">
		</p>
		<p class="line">
			<button class="but-login"  @click="butLogin">登录</button>
		</p>
		<myTip :isShow="mytipShow"  :text="myTipText" @closeModal="mytipShow = !mytipShow"></myTip>
	</div>
</template>

<script>
	import tip from './common/tiptip'
	export  default{
		http:{
			emulateJSON:true
		},
		data(){
			return {
				userName:"",
				passWord:""	,
				showClear:false,
				mytipShow:false,
				myTipText:""
			}
		},
		components:{
			myTip:tip
		},
		computed:{
			userinfo(){
				return this.$store.state.userInfo;
			}
		},
		methods:{
			//点击登录按钮
			butLogin(){
				this.userName=this.$refs.userName.value.trim();
				if(!this.userName){
					this.myTipText="账号不能为空";
					this.mytipShow=true;
				}else if(this.userName.length<11){
					this.userNameErr="账号格式不正确"
				}else{
					this.userNameErr="";
					
				}

				this.passwordPass = false
				//6-12位数字或者字母组合
				var reg = /^[a-zA-Z0-9]{6,12}$/
				if(!this.passWord){
					this.passwordErr="密码不能为空"
				}else if(!reg.test(this.passWord)){
					this.passwordErr="密码格式不正确"
				}else{
					this.passwordErr="";
					this.passwordPass=true;
				}


				this.$http.post("/wapServer/ajaxLogin",{
					userName:this.userName,
					passWord:this.passWord
				}).then((res)=>{
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
			},
			clearUserName(){
				this.$refs.userName.value='';
				this.showClear = false
			},

			//账号输入框 3 4 4的格式
			addFormat(e){
				var val = e.target.value
		        var arr = val.split(' ');
		        var Arr = [];
		        var Str = '';
		        for(var i = 0 ; i < arr.length ; i ++){
		            var arr1 = arr[i].split('');
		            for(var j = 0 ; j < arr1.length ; j ++){
		                Arr.push(arr1[j]);
		            }
		        }
		        // console.log(Arr);
		        if(Arr.length > 3 && Arr.length <=7){
		            Arr.splice(3,0,' ');
		        }else if(Arr.length > 7){
		            Arr.splice(7,0,' ');
		            Arr.splice(3,0,' ');
		        }
		        Arr.forEach(function(ele,index){
		            Str += ele;
		        })
		        // this.value = Str
		        e.target.value = Str
		        if (Str.length != 0) {
		        	this.showClear = true
		        } else {
		        	this.showClear = false
		        }
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
	    background: #fff; 
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
			margin-top: 35px
		}
		.line{
			text-align: center;
			input{
				width: 80%;
				margin: 0 10%;
				line-height: 30px;
				height: 30px;
				border: none;
				border-bottom: 1px solid #ccc;
				padding-left: 5px;
				background:none;

			}
			//选中时去边框
			input{
				outline:none;
			}
			.tip{
				width: 80%;
				margin: 0 10%;
				color: red;
				font-size: 10px;
				text-align: left;
				display: block;
			}
			.but-login{
				margin: 20px 10% 0;
				width: 80%;
				height: 40px;
  			    border-radius: 8px;
  			    background-color:  #ff4b6d;
  			    color: #fff;
  			    opacity: 0.7;
  			    
			}
			&.input-phone{
				position: relative;
				.content-clear{
					position: absolute;
					right: 11%;
					top: 9px;
					width: 11px;
					height: 11px;
					background: url(../assets/img/icon-clear.png) no-repeat;
					background-size: 11px 11px;
				}
			}
		}
	}
</style>