import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '@/store'

import home from '@/views/home'
import login from '@/views/login'

import usermanage from '@/views/assist/usermanage'
import datacenter from '@/views/assist/datacenter'
import userinfo from '@/views/assist/userinfo'
import artmessage from '@/views/article/artmessage'
import artedit from '@/views/article/artedit'
import artaudit from '@/views/article/audit'

import colmessage from '@/views/col/colmessage'
import navmessage from '@/views/col/navmessage'

import homemessage from '@/views/mod/homemessage'
import modmessage from '@/views/mod/modmessage'
import magazine from '@/views/mod/magazine'

import topics from '@/views/mod/topics'
import topic from '@/views/mod/topic'

import importarticle from '@/views/assist/importarticle'

import mods from '@/views/mod/mods'

import pages from '@/views/page/pages'
import page from '@/views/page/lib/page'

Vue.use(VueRouter)

const routes = [
  {path:'/',name:'home',component:home,redirect:'/datacenter',children:[
    {path:'/datacenter',name:'datacenter',component:datacenter},
    {path:'/usermanage',name:'usermanage',component:usermanage},
    {path:'/userinfo',name:'userinfo',component:userinfo},
    {path:'/artmessage',name:'artmessage',component:artmessage},
    {path:'/artedit/:aid',name:'artedit',component:artedit,props:true},
    {path:'/artaudit',name:'artaudit',component:artaudit},
    {path:'/colmessage',name:'colmessage',component:colmessage},
    {path:'/navmessage',name:'navmessage',component:navmessage},
    {path:'/homemessage',name:'homemessage',component:homemessage},
    {path:'/modmessage',name:'modmessage',component:modmessage},
    {path:'/magazine',name:'magazine',component:magazine},
    {path:'/topics',name:'topics',component:topics},
    {path:'/topic/:pid',name:'topic',component:topic,props:true},

    {path:'/importarticle',name:'importarticle',component:importarticle},

    {path:'/mods',name:'mods',component:mods},

    {path:'pages',name:'pages',component:pages},
    {path:'/page/:pid',name:'page',component:page,props:true},
  ]},
  {path:'/login',name:'login',component:login},
  {path:'*',redirect: "/"},
]

const router = new VueRouter({
  routes
})

function lStorage(name,data=''){
  if(data){
    localStorage.setItem(name,JSON.stringify(data))
    return true
  }else{
    return localStorage.getItem(name)?JSON.parse(localStorage.getItem(name)):false
  }
}
function checkToken(){
  store.state.token = store.state.token?store.state.token:lStorage('token')
  return store.state.token?true:false
}
router.beforeEach((to,form,next)=>{
  if(to.name=='login'){
    next()
  }else{
    checkToken()?next():next('/login')
  }
})

export default router
