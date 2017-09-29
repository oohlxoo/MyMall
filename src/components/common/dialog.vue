<template>
	<div class="mydialog">
		<div class="mengceng"></div>
		<div class="dialogoo">
			<p class="close">确认购买 <span>x</span></p>
			
		</div>
	</div>
</template>

<script>
</script>

<style scoped="scoped" lang="less" >
.mydialog{
		position:fixed;
		top: 0;
		height:100%;
		width: 100%;
		z-index: 10;
	
	.mengceng{
		position: absolute;
		height:100%;
		width: 100%;
		background: #656565;
		opacity:.5;
	}
	.dialogoo{
		position: relative;	
		width: 80%;
		height: 70px;
		margin: 100px auto;
		background: #fff;
		z-index: 11;
		border-radius: 10px;
		.close{
			text-align:center;
			height:30px;
			line-height:30px;
			span{
				width: 10px;
				height: 10px;
				display: inline-block;
				float: right;
				font-size: 14px;
				padding-right: 10px;
			}
		}
	}
}
</style>