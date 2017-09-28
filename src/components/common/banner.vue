<template>
	<div>
		<!--<img src="../../assets/img/b1.png" alt="">--><!-- 第二种方法 -->
		<div class="bannerlist">
			<ul>
				<li>
					<img :src="bannerlists[newindex].srco" />
				</li>
			</ul>
			<div class="button_info">
				<p>{{bannerlists[newindex].title}}
					<span class="circle">
						<i></i>
						<i></i>
						<i></i>
						<i></i>
					</span>
				</p>
			</div>
		</div>
	</div>
</template>

<script type="text/javascript">
	export default { 
		data () {
			return {
				isshow: null,
				newindex:0,
				len: 0
			}
		},
		props:{},
		computed:{
			nextindex:function(){
				var len=this.bannerlists.length-1;
				if(this.newindex==len){
					return 0;
				} else {
					return this.newindex+1
				}
			},
			bannerlists:{
				get(){
					return this.$store.state.bannerList
				},
				set(){}
			}
			
		},
		methods: {
			gotoo (index) {   
		        this.newindex = index
			},
			runInv () {
			 	setInterval(() => { // 相当于 this.invId=setInterval(function(){
			 		this.gotoo(this.nextindex)
		        },1000)
		     },
		},
		mounted () {	
			this.$http.get('api/bannerlists').then((res) => {
				this.$store.dispatch('fetchBannerList', res.data)
				           
			}).catch((err) => {
				console.log(err)
			})
	 		this.runInv()	 
		}
	}
</script>

<style scoped lang="less">
	.bannerlist{
		position: relative;
		height:120px;
		width: 100%;
		position: relative;
		overflow: hidden;
		.button_info{
			height: 20px;
			width: 100%;
			background: #dcdcdc;
			opacity: 0.7;
			position:absolute;
			bottom: 0;
			color: #011fff;
			font-size: 10px;
			text-align: left;
			.circle{
				opacity: 1;
				width: 60px;
				float:right;
				display: inline-block;
				padding: 0 5px;
				i{
					width:6px;
					height: 6px;
					display: inline-block;
					border-radius: 3px;
					background: #011fff;
					margin: 0 1px;				
				}		
			}		
		}
	}
</style>

		