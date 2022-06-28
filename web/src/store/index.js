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
  	nav:[],
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
      let nav = state.nav

      for(let index in nav){
        if(nav[index].cid==cid){
          res={fa:nav[index].text,ch:''};break;
        }
        let childs = nav[index].children
        for(let i in childs){
          if(childs[i].cid==cid){
            res={fa:nav[index].text,ch:childs[i].text};break;
          }
        }
      }console.log(res)
      state.breakcrumb = Object.assign({},{},res)
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
