<template>
	<div>
		<span class= "star">
			<img v-for="n in num" class="img1" src="../../assets/img/star.png"/>	
		</span>		
	</div>
</template>

<script>
	export default{
		props:{
			num:{
				type:Number,
				default:0
			}
		},
		created(){
			//console.log(this.num);
		}
		
	}
</script>

<style lang="less">
	.star{
		float: right;
	    display: inline-block;
	    padding-top: 20px;
	}
</style>