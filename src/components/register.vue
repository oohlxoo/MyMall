<template>
	<div>
		<myheader :title="title"></myheader>
		<div class="part_form">
			<p class="input-phone">
				<input placeholder="手机号"  ref="phone"  maxlength="13"   @input="addFormat"/>
				<span v-if="showClear" class="content-clear" @click="clearUserName"></span>
			</p>
			<p>
				<input class="checknum" v-model="checkNum" placeholder="验证码" />
				<img class="checkNumimg"  @click="getCheckNum"  src="../assets/img/rrr.png" />
			</p>
			<p class="input-password">
				<input :type="isPassWord ? 'text' :'password'" v-model="password" placeholder="密码（6-12位的数字及密码组合）" />
				<span  v-show="eyeIsShow" class='but-nosee' :class="{'see':isPassWord}" @click="changePassShow()"></span>
			</p>
			<button class="button" @click="register">立即注册</button>
		</div>
	<myTip :isShow="mytipShow"  :text="myTipText" @closeModal="mytipShow = !mytipShow"></myTip>
	</div>
</template>

<script>
	import header from './common/header'
	import tip from './common/tiptip'
	export default{
		data () {
			return {
				title:"注册",
				phone:null,
				checkNum:null,
				password:null,
				checkNumberss:null,//后台获取的验证码	
				showClear:false,
				mytipShow : false,
				myTipText : "",
				eyeIsShow : true,
				isPassWord : false

			}
		},
		computed:{
			userinfo () {
				return this.$store.state.userinfo
			}
		},
		components:{
			myheader:header,
			myTip:tip
		},
		methods:{
			
			//获取验证码
			getCheckNum(){
				this.$http.get("/api/getCheckNum").then((res)=>{
					console.log(res.data.checkNumber);
					this.checkNumberss=res.data.checkNumber;
				}).catch((err)=>{
					console.log(err);
				});
			},
			
			//提交注册请求
			register(){
				//检测账号
				var regAccount =/^1[3|4|5|7|8][0-9]{9}$/; //验证规则
				if(!regAccount.test(this.phone)){
					this.mytipShow=true;
					this.myTipText="请输入正确的手机号码";
					return;
				}
				this.$http.get("/user/checkAccount",{params:
					{phone:this.$refs.phone.value}  }
				).then((res)=>{
					console.log(res.data.isExist);
					if(res.data.isExist){
						this.mytipShow=true;
						this.myTipText="该账号已注册";
						return;
					}
				}).catch((err)=>{
					console.log(err);
				});

				//检验验证码
				if(this.checkNum==null || this.checkNum==""){
					this.mytipShow=true;
					this.myTipText="验证码不能为空";
					return;
				}else if(this.checkNum.length != 4){
					this.mytipShow=true;
					this.myTipText="验证码格式为空";
					return;
				}
				if(this.checkNum !== this.checkNumberss){
					this.mytipShow=true;
					this.myTipText="验证码不正确，请重新填写";
					return;
				}
				
				//检验密码
				if(!this.password){
					this.mytipShow=true;
					this.myTipText="密码不能为空";
				    return;
				}
				var respassword =/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
				if(!respassword.test(this.password)){
				    this.mytipShow=true;
					this.myTipText="密码格式不正确";
				    return;
				}
				this.$http.post("/user/add",{
						phone:this.phone,
						password:this.checkNum,
						role:0 //(角色0或1)(0代表普通用户)	
				}).then((res)=>{
					//保存账号和token
					console.log(res);
				}).catch((err)=>{
					console.log(err);
				});
				
			},
			clearUserName () {
				this.$refs.phone.value = "";
				this.showClear = false;
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
			changePassShow () {
				this.isPassWord = !this.isPassWord;
			}
		},
		mounted(){
			this.getCheckNum();
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
		padding: 0 10%;
		p {
			&.input-phone{
				position: relative;
				.content-clear{
					margin: 5px;
					position: absolute;
					right: 1%;
					top: 6px;
					width: 11px;
					height: 11px;
					background: url(../assets/img/icon-clear.png) no-repeat;
					background-size: 11px 11px;
				}
			}
			input{
				display: inline-block;
				width: 100%;
				padding-left: 5px;
			}
			margin-top: 35px;
			width: 100%;
			display: block;
			line-height: 30px;
			height: 30px;
			border-bottom: 1px solid #ececec;
			.checknum{
				width: 60%;
			}
			&.input-password{
				position: relative;
				.but-nosee{
					display: inline-block;
					position: absolute;
					top: 4px;
					right: 1%;
    				margin: 5px;
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
			
		}
		
		.checkNumimg{
			width: 80px;
			height: 30px;
			float: right;
			margin-top: -5px;
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
				background: #ff4b6d;
				opacity: .7;
				color: #ffffff;
			    width: 100%;
				height: 100%;
				border-radius: 8px;
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