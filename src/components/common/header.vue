<template>
	<div class="header">
		<i @click="back()" v-show="showback"></i>
		<p class="h1">{{this.title}}</p>	
		<span class="button" v-show="showbuttonvalue">{{buttonvalue}}</span>
	</div>
</template>

<script>
	export default{
		//props:["title"],
		data(){
			return{
				
			}
		},
		props:{
			title:{
				type:String,
				default:"请显示标题"
			},
			showback:{
				type:Boolean,
				default:true
			},
			buttonvalue:{
				type:String,
				default:"保存"
			},
			//是否显示保存按钮
			showbuttonvalue:{
				type:Boolean,
				default:false
			}
		},
		computed:{
		},
		methods:{
			back(){
				this.$router.go(-1);
			}
		},
		mouneted(){
			
		}
	}
</script>

<style lang="less">
	.header{
		
		height: 45px;
		line-height: 45px;
		width: 100%;
		background-color:  #f5f5f5;
		
		i{
			position: absolute;
			left: 0;
			display: inline-block;
			width: 32px;
			height: 32px;
			margin: 5px 10px;
			z-index: 9;
			background:url(../../assets/img/icon_back.png) no-repeat left center;
			background-size: 25px;
		}
		p{
		    position: relative;
		    top: 0;
		    text-align: center;
		    text-align: center;
		    font-size: 16px;
    		color:#929292;
		    
		}
		.button{
			position: absolute;
			right:0;
			top: 0;
			display: inline-block;
			width: 45px;
			height: 45px;
			line-height: 45px;
			z-index: 9;
			font-size: 16px;
    		color:#929292;
		}
	}
</style>