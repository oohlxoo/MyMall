<template>
	<div>
		<myheader :title="title"></myheader>
		<div>
			<!--<img src="../../../static/c1.png"/>-->
		</div>
	</div>
</template>

<script>
	import header from '../common/header'
	export default{
		components:{
			myheader:header
		},
		data(){
			return{
				title:"发表评价"
			}
		}
	}
</script>

<style scoped>
	
</style>