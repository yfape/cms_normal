<style scoped>
#main{height:50px;overflow:hidden;box-shadow:0px 0.3px 0.5px #8E8E8E;position:fixed;top:0;left:0;width:100%;z-index:10000;min-width:1100px}
#logo{height:50px;margin:0px 20px;}
.inrow{float:left;}
.rtext{color:#fff;height:50px;line-height:50px;font-family:'黑体';font-size:16px}
.fade-enter-active, .fade-leave-active {
    transition:opacity 0.5s
}
.fade-enter, .fade-leave-to{
    opacity: 0
}
#func{float:right;height:50px;line-height:50px;margin-right:20px;}
</style>
<template><transition name="fade">
<div class="bg-red-10" id="main">
  <img id="logo" class="inrow" src="/static/zzlogo.png">
  <div class="inrow rtext oneline">正在阅读:{{title}}</div>
  <div id="func">
      <q-btn flat round color="white" icon="headset" @click="$store.commit('audio_show')"/>
      <q-btn flat round color="white" @click="$emit('autoRead')">
        <div style="padding:0 5px;font-size:12px">auto</div>
      </q-btn>
      <q-btn flat round color="white" :icon="$store.state.articleconfig.fontsize==16?'format_size':'text_fields'" @click="$store.commit('articleFontsize')"/>
      <q-btn flat round color="white" :icon="$store.state.articleconfig.islove?'favorite':'favorite_border'" @click="$store.commit('articleIslove')"/>
  </div>
</div>
</transition></template>
<script>
export default{
  name:'header3',
  props:['title'],
  data:()=>({

  }),
  mounted(){

  },
  methods:{
    
  }
}
</script>