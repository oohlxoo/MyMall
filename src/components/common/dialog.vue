<template>
	<div class="mydialog" v-show="isshowdialog">
		<div class="mengceng"></div>
		<div class="dialogoo">
			<p class="dec">确认购买? </p>
			<p class="butt">
				<button class="confirmed" @click="confirmed()">确认</button>
				<button @click="cancel()">取消</button>
			</p>
		</div>
	</div>
</template>

<script>
	export default{
		props:{},
		
		data(){
			return{
				isshowdialog:false
			}
		},
		methods:{
			confirmed(){
				this.isshowdialog=false;
				this.$emit("confirmModel");
			},
			cancel(){
				this.isshowdialog=false;
				this.$emit("cancelModel");
			}
		}
		
	}
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
		margin: 100px auto;
		background: #fff;
		z-index: 11;
		border-radius: 10px;
		.dec{
			flex: 1;
			text-align:center;
			padding: 20px 0;
			
		}
		.butt{
			border-top: 1px solid #ececec;
			height: 45px;
			line-height: 45px;
			button{
				width: 50%;
				height: 100%;
				float: left;
				background: none;
				&.confirmed{
					color: #ff4b6d;
				}
				&:first-child{
					border-right: 1px solid #ececec;
				}
			}
		}
	}
}
</style>