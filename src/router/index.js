import Vue from 'vue'
import Router from 'vue-router'
import Index from '../components/index'
import Products from '../components/products'
import Setting from '../components/setting'
import details from '../components/childPage/details'
import Order from '../components/order'
import productType from "../components/childPage/productType"
import mycollect from "../components/childPage/mycollect"
import commitOrder from "../components/childPage/commitOrder"
import myAddress from "../components/childPage/myAddress"
import login from "../components/login"
import register from "../components/register"




Vue.use(Router)

export default new Router({
	linkActiveClass: 'active',
	 mode: 'history',
	 routes: [
	    /*{
	      path: '/',
	      component: Index
	    },*/
	    {
	      path: "*",
	      redirect: "/index"
	    },
	     {
	      path: '/index',
	      name: "index",
	      component: Index
	    },
	    {
	      path: '/products',
	      name: "products",
	      component: Products
	    },
	    {
	    	path:'/order',
	    	name:'order',
	    	component:Order
	    },
	    {
		    path: '/setting',
		    name: "setting",
		    component: Setting
		   
	    },
	    //登录页面
	    {
			path:"/login",
			component:login
		},
		 //注册页面
	    {
			path:"/register",
			component:register
		},
	    //产品类型
	    {
	    	path:"/productType",
	    	name:"productType",
	    	component:productType
	    },
	    //商品详情
	    {
	      path: '/details/:id',
	      name: "details",
	      component: details
	    },
	    //我的收藏
	    { 
			path: "/mycollect",
			component: mycollect 
		},
		//提交订单
		  { 
			path: "/commitOrder",
			component: commitOrder 
		},
		//收货地址
		{
			path:"/myaddress",
			component:myAddress
		}
		
	    
	]
})
