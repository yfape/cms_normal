import Vue from 'vue'
import Vuex from 'vuex'
import main from '@/main.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //系统
    system:{cols:[],webcols:[],identitys:[],astatus:[]},
    domain:{web:'http://www.scdjw.net',file:'http://file.scdjw.net',api:'http://api.scdjw.net/v1'},
    //用户数据
    user:{},token:'',

    //音乐播放器
    audio:{show:false,audio:'',img:'',title:''},

    //文章阅读器
    readarticle:{show:false,aid:0},
    //文章审核器
    auditarticle:{show:false,aid:0},
  },
  mutations: {
    setSystem(state,data){
      let cols = []
      for(let i in data.cols){
        cols[data.cols[i].cid] = data.cols[i]
      }

      let arr=data.cols
      let temp=[]
      for(let i in arr){
        temp[arr[i].cid] = arr[i]
      }
      state.system.cols = temp
      state.system.webcols = Object.assign([],data.webcols)
      state.system.showcols = Object.assign([],data.showcols)
      state.system.identitys = Object.assign([],data.identitys)
      state.system.astatus = Object.assign([],data.astatus)
      state.system.sourcewl = Object.assign([],data.sourcewl)
      state.user = Object.assign({},data.user)
    },
    sortCols(state){
      
    },
    playAudio(state,data){
      state.audio.audio = data.audio
      state.audio.img = data.img
      state.audio.title = data.title
      state.audio.show = true
    },
    readArticle(state,aid){
      state.readarticle.aid = aid
      state.readarticle.show = true
    },
    auditArticle(state,aid){
      state.auditarticle.aid = aid
      state.auditarticle.show = true
    }
  },
  actions: {
  },
  modules: {
  }
})
