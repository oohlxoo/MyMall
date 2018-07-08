// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import store from './store'
import vueTouch from "vue-plugin-touch"




Vue.config.productionTip = false
Vue.prototype.$http = axios //通过修改原型链，来更方便的使用
//  Vue.prototype.resource = "http://localhost:3000"
Vue.prototype.resource = "/api"

import "./assets/css/base.css"


Vue.use(vueTouch)
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  vueTouch,
  template: '<App/>',
  components: { App },
  mounted(){
  	  window.onload = function(){
        getRem(375,10)
    };
    window.onresize = function(){
        getRem(375,10)
    };
    function getRem(pwidth,prem){
        var html = document.getElementsByTagName("html")[0];
        var oWidth = document.body.clientWidth || document.documentElement.clientWidth;
        html.style.fontSize = oWidth/pwidth*prem + "px";
    }

  }
})
