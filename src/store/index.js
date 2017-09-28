import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new  Vuex.Store({
	state: {
		bannerList: [
			{
				id: null,
				srco: null,
				title: null,
				href: null	
			}
		],
		productList: [
			{
				id: null,
				ico: null,
				title: null,
				price: null,
				originalCost: null,
				details: null
			}
	    ],
	    getdetails: {
    		id:null,
			title:null,
			img:[],
			price: null,
			salesvolume:null,
			address:null,
			assess:[
				{
					id:null,
					userid:null,
					userpic:null,
					nikename:null,
					content:null,
					start:null,
					date:null	
		    	}
    		]
		},
	},
	getters: {},
	mutations: {
		setBannerList: (state, data)=> {
			state.bannerList = data
		},
		setProductList:(state,data)=>{
			state.productList = data
		},
		setGetdetails:(state,data)=>{
			state.getdetails = data
		}
	},
	actions: {
		//获取首页banner图
		fetchBannerList (store, data) {
			store.commit('setBannerList', data)
		},
		//获取首页产品列表
		fetchProductList (store, data) {
			store.commit('setProductList', data)
		},
		//根据id获取详情信息
		getProListById (store, data) {
			store.commit('setGetdetails',data)
		}
	}
})
export default store

