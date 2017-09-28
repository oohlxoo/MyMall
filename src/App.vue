<template>
  <div id="app" class="mainindex">
    <router-view></router-view>
    <mynav v-show="isShowo"></mynav>
  </div>
</template>

<script>
import mynav from './components/common/nav'
export default {
  name: 'app',
  components:{
		mynav
  },
  data(){
  	return{
  		
  	}
  },
  computed: {
  	isShowo () {
  		if (this.$route.path == '/' || this.$route.path == '/index' || this.$route.path == '/products' || this.$route.path == '/order' || this.$route.path == '/setting') {
  			return true
  		} else {
  			return false
  		}
  	}
  }
}
</script>


<style lang="less">
	#app{
		height: 100%;
	}
	.mainindex{
   /*flex-flow: row wrap;flex-direction flex-wrap的简写*/
    display: flex;
    flex-direction: column;
    height: 100%;
 	.contents{    
        flex:  1;
        overflow-y: scroll;
       /* background: cornflowerblue;  */  
    }   
}
</style>
