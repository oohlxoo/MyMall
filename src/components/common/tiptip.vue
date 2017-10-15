<template>
	<div class="tiptip" v-show="isShow">
		<transition name="slide-trans">
			<p>{{text}}</p>	
		</transition>
			
	</div>
	
</template>

<script>
	export default{
		data(){
			return{
				text:"请先登录",
				isShow:true
			}
		},
		props:{
			
		},
		computed:{
			
		},
		watch:{},
		methods:{
			hidetip(){
				setTimeout(function(){
					this.isShow=false;
				},3000)
			}
		},
		mounted(){
			this.hidetip();
		}
	}
</script>

<style lang="less" scoped>
	.tiptip{
		position: fixed;
		height: 40px;
		width: 100%;
		text-align: center;
		bottom: 50px;
		p{
			background: #9e9e9e;
			opacity: 0.5;
			width: 60%;
			margin: 0 auto;
			height: 35px;
			line-height: 35px;
			border-radius: 10px;
			color: #fff;
		}
	}
/*	.slide-trans-enter-active {
	  transition: all .5s;
	}
	.slide-trans-enter {
	  transform: translateY(900px);
	}
	.slide-trans-old-leave-active {
	  transition: all .5s;
	  transform: translateY(-900px);
	}*/
</style>