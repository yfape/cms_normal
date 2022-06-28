import Vue from 'vue'
import VueRouter from 'vue-router'
import home from '@/views/home.vue'
import article from '@/views/article.vue'
import list from '@/views/list'
import magazines from '@/views/magazines'
import magazine from '@/views/magazine'
import topics from '@/views/topics'
import topic from '@/views/topic'
import error from '@/views/error'
import search from '@/views/search'

Vue.use(VueRouter)

const routes = [
  {path: '/',name: 'home',component:home},
  
  {path:'/list/:cid',name:'list',component:list,props:true},
  {path:'/article/:aid',component:article,props:true},
  {path:'/magazines',name:'magazines',component:magazines},
  {path:'/magazine/:zid',component:magazine,props:true},
  {path:'/topics',name:'topics',component:topics},
  {path:'/topic/:pid',component:topic,props:true},
  {path:'/search/:text?',component:search,props:true},
  {path:'/error',name:'error',component:error},
  {path:'*',redirect:'/'}
]

const router = new VueRouter({
  routes
})

export default router
