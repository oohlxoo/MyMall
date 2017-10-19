<template>
	<div class="buynumber">
		<span class="dec" @click="dec()">-</span>
		<input :value="buynum" />
		<span class="add" @click="add()">＋</span>
	</div>
	
</template>

<script>
	export default{
		data(){
			return {
				
			}
		},
		props:{
			buynum:{
				type:Number,
				default:1
			}
		},
		computed:{
			
		},
		methods:{
			dec(){
				if(this.buynum<=1){
					return 1
				}else{
					return this.buynum--;
				}
			},
			add(){
				if(this.buynum>=10){
					return this.buynum;
				}else{
					return this.buynum++;
				}
				
			}
		},
		watch:{
			buynum(){
				this.$emit("changenum",this.buynum);
			}
		}
	}
</script>

<style lang="less">
	.buynumber{
		display:inline-block;
		float: right;
		padding-right: 10px;
		background: #f5f5f5;
		span,input{
			display: inline-block;
			text-align: center;
			float: left;
			width: 30px;
			line-height: 45px;
		}
		span{
			font-size: 20px;
			background: #fff;
			height: 30px;
			margin-top: 7px;
			line-height: 30px;
		}
		input{
			width: 40px;
			background: #f5f5f5;
		}
	}
</style>