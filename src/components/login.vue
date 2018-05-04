<template>
	<div class="login" >
	    <img src="../assets/img/icon-myiocn.png">
		<p class="line input-phone">
			<input ref="userName" id="account" placeholder="请输入手机号"  @input="addFormat" maxlength="13" />
			<span v-if="showClear" class="content-clear" @click="clearUserName"></span>
		</p>
		<p class="line input-password">
			<input id="password" placeholder="请输入密码"  v-model="passWord"  :type="isPassWord?'text':'password'">
			<span  v-show="eyeIsShow" class='but-nosee' :class="{'see':isPassWord}" @click="changePassShow()"></span>
		</p>
		<p class="line">
			<button class="but-login"  @click="butLogin">登录</button>
		</p>
		<p class="line register-p">
			<span class="span1">还没有账号？<i> <router-link to="/register">注册一个</router-link></i></span>	
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
				myTipText:"",
				isPassWord:false,
				eyeIsShow:false
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
		watch: {
			passWord : {
				handler(newval){
					if(newval ==null || newval ==""){
						this.eyeIsShow = false
					}else{
						this.eyeIsShow = true
					}                                                                                                                                                                                                                                                                                             
				}
			}
		},
		methods:{
			//点击登录按钮
			butLogin(){
				 this.userName = this.$refs.userName.value.replace(/\s+/g,"");
				if(!this.userName){
					this.myTipText="账号不能为空";
					this.mytipShow=true;
					return;
					
				}else if(!(/^1[3|4|5|7|8][0-9]{9}$/).test(this.userName)){
					this.myTipText="用户名或密码错误，请重新输入";
					this.mytipShow=true;
					return;
				}

				//6-12位数字或者字母组合
				var reg = /^[a-zA-Z0-9]{6,12}$/
				if(!this.passWord){
					this.myTipText="密码不能为空";
					this.mytipShow=true;
					return;
				}
					
				
				this.$http.get(this.resource + "/user/login",{params: {
						phone:this.userName,
						password:this.passWord,
						role: 0 //(角色0或1)(0代表普通用户)
					}
				
				}).then((res)=>{
					console.log(res);
					if(res.status==200){
						this.myTipText="登录成功";
						this.mytipShow=true;
						localStorage.setItem("userId",res.data.id);
						localStorage.setItem("userName",this.userName);
						this.$router.push("/index");
						//this.$store.dispatch("fetchUsernfo",{userName:this.userName,passWord:this.passWord})
					}
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
			},
			changePassShow (){
				this.isPassWord = !this.isPassWord;
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
			&.input-password{
				position: relative;
				.but-nosee{
					display: inline-block;
					position: absolute;
					right: 11%;
					top: 9px;
					height: 11px;
					width: 16px;
					background: url(../assets/img/icon-nosee.png) no-repeat;
					background-size:16px 11px;
					z-index: 10;
					&.see{
						background: url(../assets/img/icon-see.png) no-repeat;
						background-size:16px 11px;

					}
				}
			}
			&.register-p{
				width: 80%;
				border: none;
				margin: 35px 10% 0;
				.span1{
					display: inline-block;
					color: #999999;
					a,i{
						color: #333;
						padding: 0.1rem 2px
					}
				}
				
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