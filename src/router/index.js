import Vue from 'vue'
import Router from 'vue-router'
import Index from '../components/index'
import Products from '../components/products'
import Setting from '../components/setting'
import details from '../components/common/details'
import Order from '../components/order'
import productType from "../components/childPage/productType"
import mycollect from "../components/childPage/mycollect"
import commitOrder from "../components/childPage/commitOrder"



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
	    {
	      path: '/details/:id',
	      name: "details",
	      component: details
	    },
	    {
	    	path:"/productType",
	    	name:"productType",
	    	component:productType
	    },
	    //我的收藏
	    { 
			path: "/mycollect",
			component: mycollect 
		},
		//订单
		  { 
			path: "/commitOrder",
			component: commitOrder 
		},
		
	    
	]
})
