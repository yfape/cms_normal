<style scoped>
#home{width:100%;overflow-x:hidden;}
#home #logo{width:50px;}
#home #logotitle{font-size:18px;font-weight:bold;}
</style>
<template>
<q-layout view="hHh lpr lff" id="home" v-if="show" class="full-height">
	<q-header elevated class="bg-red-10" v-if="$store.state.config.header">
		<q-toolbar>
			<q-img id="logo" src="./static/sys/logo.png" v-if="!inarticle"/>
      <q-btn class="" flat round dense icon="keyboard_return" @click="$router.go(-1)" v-if="inarticle"/>
    	<q-toolbar-title id="logotitle">四川党建网后台管理系统</q-toolbar-title>

      <q-item clickable v-ripple class="bg-brown-5" @click="$router.push('/userinfo')">
        <q-item-section avatar>
          <q-avatar>
            <img :src="$store.state.user.headimg">
          </q-avatar>
        </q-item-section>
        <q-item-section>
          <q-item-label lines="1">{{$store.state.user.nickname}}</q-item-label>
          <q-item-label caption lines="2">
            <span class="text-weight-bold text-grey-13">{{$store.state.system.identitys[$store.state.user.identity]}}</span>
          </q-item-label>
        </q-item-section>
      </q-item>

    	<q-btn class="q-ml-sm" flat round dense icon="power_settings_new" @click="$refs.d_exit.showD()"/>
    </q-toolbar>
	</q-header>
	<q-drawer v-model="leftdrawer.show" :width="180" :breakpoint="500">
		<q-tabs
			v-model="leftdrawer.tab"
			inline-label
    	vertical
    	class="text-brown-6 bg-brown-1 full-height"
    	active-color="red-10"
    	active-bg-color="red-2"
    >	
      <div v-for="item in usernav">
      	<q-route-tab  v-if="!item.istext" :name="item.id" :disable="item.istext" :icon="item.icon" :label="item.title" :to="item.href" exact/>
      	<div class="text-grey-6 text-caption q-px-sm" v-if="item.istext">{{item.title}}</div>
	    </div>
    </q-tabs>
	</q-drawer>
	<q-page-container class="full-height bg-grey-2">
    <q-page class="full-height">
    	<router-view/>
    </q-page>
  </q-page-container>
	<exitdialog ref="d_exit"></exitdialog>
  <q-dialog v-model="$store.state.audio.show" position="bottom">
    <VueAplayer autoplay :music="{
      title: $store.state.audio.title?$store.state.audio.title:'暂无标题',
      artist: ' ',
      src: $store.state.audio.audio,
      pic: $store.state.audio.img,
      lrc: '[00:00.00]lrc here [00:01.00]aplayer'
    }"></VueAplayer>
  </q-dialog>
  <readarticle v-if="$store.state.readarticle.show"></readarticle>
  <auditarticle v-if="$store.state.auditarticle.show"></auditarticle>
</q-layout>
</template>

<script>
import exitdialog from '@/components/dialog/exitdialog'
import VueAplayer from 'vue-aplayer'
import readarticle from '@/components/dialog/readarticle'
import auditarticle from '@/components/dialog/auditarticle'

export default {
  	name: 'home',
  	components: {
  		exitdialog,VueAplayer,readarticle,auditarticle
  	},
  	data:()=>({
  		show:false,
      inarticle:false,
      pageheight:0,
  		leftdrawer:{show:true,tab:1},
      nav:[
        {id:1,title:'数据总概',icon:'home',href:'/datacenter',identity:4},
        {id:2,istext:true,icon:'home',title:'文章',href:'/',identity:4},
        {id:3,title:'文章管理',icon:'insert_chart',href:'/artmessage',identity:4},
        {id:4,title:'文章审核',icon:'check_circle_outline',href:'/artaudit',identity:2},
        {id:5,istext:true,icon:'home',title:'栏目',href:'/',identity:3},
        {id:6,title:'栏目管理',icon:'horizontal_split',href:'/colmessage',identity:3},
        {id:7,title:'导航管理',icon:'list',href:'/navmessage',identity:3},
        {id:5,istext:true,icon:'home',title:'页面',href:'/',identity:3},
        {id:8,title:'页面管理',icon:'amp_stories',href:'/pages',identity:3},
        {id:9,title:'模块管理',icon:'o_highlight_alt',href:'/mods',identity:3},
        {id:10,title:'杂志管理',icon:'bookmark_border',href:'/magazine',identity:3},
        // {id:11,title:'专题管理',icon:'amp_stories',href:'/topics',identity:3},
        {id:16,istext:true,icon:'home',title:'系统',href:'/',identity:1},
        {id:17,title:'用户管理',icon:'people_alt',href:'/usermanage',identity:1},
        {id:18,title:'文章导入',icon:'get_app',href:'/importarticle',identity:1},
      ],
      usernav:[]
  	}),
  	created(){
      this.getSystemInfo()
  	},
  	mounted(){
      this.isArtedit()
  	},
	methods:{
    isArtedit(){
      if(this.$route.name == 'artedit'||this.$route.name == 'topic'||this.$route.name == 'page'){
        this.inarticle = true
        this.leftdrawer.show = false
      }else{
        this.inarticle = false
        this.leftdrawer.show = true
      }
    },
    getSystemInfo(){
      this.axios.post('system').then(response=>{
          this.$store.commit('setSystem',response)
          this.setUsernav()
          this.show = true
      }).catch(err=>{

      })
    },
    setUsernav(){
      let identity = this.$store.state.user.identity
      for (var i = 0; i < this.nav.length; i++) {
        if(this.nav[i].identity>=identity){
          this.usernav.push(this.nav[i])
        }
      }
    },
	},
  watch:{
    '$route.name'(){
      this.isArtedit()
    }
  }
}
</script>
