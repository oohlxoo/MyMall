<template>
	<div class="bodyoo">
		<div class="body">
			<myheader :title="title" :showbuttonvalue="showbuttonvalue" :buttonvalue="buttonvalue"></myheader>
			<div class="grade clearfix">
				<img class="producepic"  src="../../../static/c1.png"/>
				<div id="">
					<span class="dec gray">描述相符</span>
					<span class= "star">
	<img v-for="(o,i) in (currentStarNum)" class="img1" @click="choosestart(i)" src="../../assets/img/star.png"/>	
	<img v-for="(o,i) in (5-currentStarNum)" class="img1" @click="choosestart(i+currentStarNum)" src="../../assets/img/star1.png"/>	
					
					
							
					</span>	
					<span class="grade_text">{{appraGradeText[currentStarNum-1]}}</span>
				</div>
			</div>
			<textarea class="appraisetext" placeholder="宝贝满足你的期待吗？说说你的使用心得，分享给想买的小伙伴吧"></textarea>
			<p class="anonymous no">
				<span class="radio" :class="{'no':isAnonymous}" @click="changestatus()">匿名</span> 
				<span class="tip">{{tip[currentnum]}}</span></p>
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
				title:"发表评价",
				showbuttonvalue:true,
				buttonvalue:"发表",
				isAnonymous:false,
				tip:['你写的评价会以匿名的形式展现','你的评价能帮助其他小伙呦'],
				currentnum:0,
				appraGradeText:['非常差','差','一般','好','非常好'],
				currentStarNum:5,
				
				
			}
		},
		methods:{
			//匿名的切换
			changestatus(){
				this.isAnonymous=!this.isAnonymous;
				if(this.isAnonymous){
					this.currentnum=1
				}else{
					this.currentnum=0
				}
			},
			//星星打分
			choosestart(index){
				if(index==0){
					return;
				}
				console.log(index);
				this.currentStarNum=index;
			}
			
		},
		computed:{
			
		}
	}
</script>

<style scoped lang="less">
	.bodyoo{
		background: #f5f5f5;;
		height: 100%;
	}
	.body{
		background: #fff;
	}
	.grade{
		
		height: 70px;
		border-bottom: 1px solid #ececec;
		.producepic{
			height: 50px;
			width: 50px;
			margin: 10px;
			float: left;
		}
		.dec,.grade_text{
			&.gray{
				color: #000;
				font-size: 12px;
			}
			float: left;
			display: inline-block;
			line-height: 70px;
			font-size: 14px;
			color: #82779c;
		}
		.star{
			float: left;
		    display: inline-block;
		    width: 130px;
		    margin-left: 20px;
		    img{
		    	width: 20px;
			    float: left;
			    margin: 25px 2px;
		    }
		}
	
		
	}
	.appraisetext{
		width: 100%;
		padding: 10px;
		height: 100px;
		border-bottom: 1px solid #ececec;
	}
	.anonymous{
		height: 40px;
		line-height: 40px;
		.radio{
			background: url(../../assets/img/icon-choose1.png) no-repeat 5px 8px;
			background-size: 24px !important;
			padding-left: 40px;
			display: inline-block;
			&.no{
				background: url(../../assets/img/icon-choose2.png) no-repeat 5px 8px;
			}
		}
		.tip{
			float: right;
			color: #82779c;
			padding-right: 6px;
		}
		
	}
</style>