<template>
	<div class="bodyoo">
		<myheader :title="title" :showbuttonvalue="showbuttonvalue"></myheader>
		<form>
			<p>
				<label>收货人</label><input  />
			</p>
			<p>
				<label>联系电话</label><input type="number" />
			</p>
			<p>
				<label>所在地区</label>
				<select>
					<option>上海</option>	
				</select>
				<select>
					<option>徐汇</option>	
					<option>宝山</option>	
					<option>浦东</option>	
				</select>
				<select>
					<option>徐家汇</option>	
				</select>
			</p>
			<p>
				<label>街道</label><input  />
			</p>
			<textarea name="" rows="" cols="3" placeholder="请填写详细地址，不少于5个字"></textarea>
			<p>
				<label>设为默认</label><span :class="{'canceldefault':isdefault}" @click="settingdefault"></span>
			</p>
		
		</form>
	</div>
</template>

<script type="text/javascript">
	import myheader from '../common/header'
	export default{
		data(){
			return {
				title:"添加新地址",
				isdefault:false,
				showbuttonvalue:true
				
			}
		},
		components:{
			myheader
		},
		methods:{
			settingdefault(){
				this.isdefault=!this.isdefault;
			}
		}
	}
</script>

<style lang="less" scoped>
	select {
		appearance:none;
		-moz-appearance:none;
		-webkit-appearance:none; 
	}

	.bodyoo{
		display: flex;
		flex-direction: column;
		height: 100%;
	}
	form{
		background: #f5f5f5;
		flex-grow: 1;
		p{
			background: #fff;
			border-bottom: 1px solid #f5f5f5;
			height: 40px;
			line-height: 40px;
			label{
				display: inline-block;
    			width: 60px;
				margin:0 10px;
			}
			&:last-child{
				margin-top: 10px;
				span {
					margin-top: 4px;
					display: inline-block;
					float: right;
					width: 32px;
					height: 32px;
					margin-right: 20px;
					background:url(../../assets/img/icon-ooclose.png) no-repeat;
					&.canceldefault{
						background:url(../../assets/img/icon-ooopen.png) no-repeat;
					}
				}
			}
			select{
				width: 60px;
			}
		}
		textarea{
			padding: 10px;
			width: 100%;
			resize: none;
			overflow: hidden;
			height: 70px;
		}
		
		
	}
</style>
