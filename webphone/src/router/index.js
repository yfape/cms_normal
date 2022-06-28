import Vue from 'vue'
import store from '@/store/index.js'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import portal from '@/views/portal.vue'
import list from '@/views/list.vue'
import article from '@/views/article.vue'
import topics from '@/views/topics'
import magazines from '@/views/magazines'
import error from '@/views/error'

Vue.use(VueRouter)

  const routes = [
  {path:'/',name:'Home',redirect:'/portal',component:Home,children:[
  	{path:'/portal',name:'portal',meta:'首页',component:portal},
  	{path:'/list/:cid',name:'list',meta:'',component:list,props:true},
    {path:'/article/:aid',name:'article',meta:'',component:article,props:true},
  ]},
  {path:'/topics',name:'topics',meta:'专题',component:topics},
  {path:'/magazines',name:'magazines',meta:'电子杂志',component:magazines},
  {path:'/error',name:'error',meta:'错误',component:error}
]

const router = new VueRouter({
  routes
})

router.beforeEach((to, from, next) => {
	document.title = (typeof to.meta == 'string')?('四川党建网 - '+to.meta):'四川党建网'

  if(to.name == 'article'){
    store.state.control.toptab = false
    store.state.control.footer1 = false
  }else{
    store.state.control.toptab = true
    store.state.control.footer1 = true
  }

	next()
})

export default router
