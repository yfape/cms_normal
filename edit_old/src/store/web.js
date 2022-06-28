import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    config:{},
    audio:{
      show:false,
      title:'',
      url:'',
      img:''
    },
    breakcrumb:{fa:'',ch:''},
  	nav:{
      data:[
        {id:1,text:'首页',url:'/'},
        {id:2,text:'时政',url:'/sz',childrens:[
          {id:21,text:'要闻',url:'/yw'},
          {id:22,text:'时评',url:'/sp'},
          {id:23,text:'人事任免',url:'/rsrm'},
          {id:24,text:'权威声音',url:'/qwsy'},
          {id:25,text:'领导动态',url:'/lddt'},
        ]},
        {id:3,text:'服务',url:'/fw'},
        {id:4,text:'社会',url:'/sh'},
        {id:5,text:'党建',url:'/dj'},
        {id:6,text:'廉政',url:'/lz'},
        {id:7,text:'理论',url:'/ll'},
        {id:8,text:'人物',url:'/rw'},
        {id:9,text:'视野',url:'/sy'},
        {id:10,text:'杂志',url:'/zz'},
      ]
    },
    toptopic:{show:false,backimg:'',faceimg:''},
    articleconfig:{
      islove:false,fontsize:16,
    }
  },
  mutations: {
    articleIslove(state){

      state.articleconfig.islove=!state.articleconfig.islove
    },
    articleFontsize(state){

      state.articleconfig.fontsize=(state.articleconfig.fontsize==16)?20:16
    },
    setBreakcrumbByCid(state,cid){
      var res = {}
      for(var index in state.nav.data){
        if(state.nav.data[index].id===cid){
          res={fa:state.nav.data[index].text,ch:''};break;
        }
        for(var i in state.nav.data[index].childrens){
          if(state.nav.data[index].childrens[i].id===cid){
            res={fa:state.nav.data[index].text,ch:state.nav.data[index].childrens[i].text};break;
          }
        }
      }
      state.breakcrumb = Object.assign({},res)
    },
    audio_show(state){
      if(!state.audio.url){
        return
      }else{
        state.audio.show = true
      }
    },
    audio_exit(state){

      state.audio.show = false
    },
  },
  actions: {

  },
  modules: {
  }
})
