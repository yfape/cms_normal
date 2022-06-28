<style src="../common.css" scoped></style>
<template><div>
  <!-- logo区 -->
  <div class="row justify-between widthlim q-px-md">
    <div class="q-pa-sm row items-center" style="height:100px"><img alt="四川党建网" src="/static/logo1.png"/></div>
    <div class="row items-center">
      <q-btn class="q-ml-sm" flat round color="red-10" @click="">
        <img src="static/weixin.gif" style="width:30px;"/>
        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
          党建视点 微信公众号
        </q-tooltip>
      </q-btn>
      <q-btn class="q-ml-sm" flat round color="red-10" @click="">
        <img src="static/weibo.gif" style="width:30px;"/>
        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
          四川党的建设杂志 新浪微博
        </q-tooltip>
      </q-btn>
      <q-btn class="q-ml-sm" flat round color="red-10" @click="">
        <img src="static/renminhao.gif" style="width:30px;"/>
        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
          四川党的建设杂志社 人民号
        </q-tooltip>
      </q-btn>
      <q-btn class="q-ml-sm" flat round color="red-10" @click="">
        <img src="static/douyin.gif" style="width:30px;"/>
      </q-btn>
      <q-btn class="q-ml-sm" flat round color="red-10" @click="">
        <img src="static/ximalaya.gif" style="width:30px;"/>
        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
          四川党的建设杂志 喜马拉雅电台
        </q-tooltip>
      </q-btn>
    </div>
    <div class="row items-center">
      <q-btn class="q-ml-sm" flat round color="red-10" icon="star_outline"/>
      <q-btn class="q-ml-sm" flat round color="red-10" icon="fullscreen"/>
      <q-btn class="q-ml-sm" flat round color="red-10" icon="search"/>
    </div>
  </div>
  <!-- 导航栏 -->
  <div id="navrow" :class="{'bg-red-10':true,widthlim:shrink}">

      <div class="widthlim">
        <q-tabs dense stretch align="justify" narrow-indicator inline-label class="bg-red-10 text-white no-shadow">
          <q-route-tab v-for="item in data" :label="item.text" :to="item.url" exact disable/>
        </q-tabs>
      </div>

  </div>
</div></template>
<script>
export default{
  name:'header1',
  props:['shrink','data'],
  data:()=>({
    nav:[]
  }),
  mounted(){
    
  },
  methods:{

  }
}
</script>