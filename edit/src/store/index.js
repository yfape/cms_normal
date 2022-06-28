import Vue from 'vue'
import Vuex from 'vuex'
import main from '@/main.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //系统
    system:{cols:[],webcols:[],identitys:[],astatus:[]},
    config:{header:true},
    domain:{web:'http://www.scdjw.net',file:'http://file.scdjw.net',api:'http://api.scdjw.net/v1'},
    //用户数据
    user:{},token:'',
    //音乐播放器
    audio:{show:false,audio:'',img:'',title:''},
    //文章阅读器
    readarticle:{show:false,aid:0},
    //文章审核器
    auditarticle:{show:false,aid:0},

    //编辑器
    paddings:[
      {value:'',text:'默认'},
      {value:'q-pa-none',text:'无'},
      {value:'q-pa-xs',text:'超小'},
      {value:'q-pa-sm',text:'小'},
      {value:'q-pa-md',text:'中'},
      {value:'q-pa-lg',text:'大'},
      {value:'q-pa-xl',text:'超大'},
    ],
    margins:[
      {value:'',text:'无'},
      {value:'q-ma-xs',text:'超小'},
      {value:'q-ma-sm',text:'小'},
      {value:'q-ma-md',text:'中'},
      {value:'q-ma-lg',text:'大'},
      {value:'q-ma-xl',text:'超大'},
    ],
    textjustify:[
      {icon: 'o_format_align_left', value: 'text-left'},
      {icon: 'o_format_align_center', value: 'text-center'},
      {icon: 'o_format_align_right', value: 'text-right'}
    ],
  },
  mutations: {
    setSystem(state,data){
      let cols = []
      for(let i in data.cols){
        cols['c'+data.cols[i].cid] = data.cols[i]
      }

      state.system.cols = Object.assign({},{},cols)
      state.system.identitys = Object.assign([],data.identitys)
      state.system.astatus = Object.assign([],data.astatus)
      state.system.sourcewl = Object.assign([],data.sourcewhites)
      state.user = Object.assign({},data.user)

      let tr = data.cols
      let webcols = []
      for(let i in tr){
        if(tr[i].valid == -1){
          continue;
        }
        if(tr[i].sub){
          webcols[tr[i].allsort].children[tr[i].sort-1] = Object.assign({},{},tr[i])
        }else{
          tr[i].children = []
          webcols[tr[i].allsort] = Object.assign({},{},tr[i])
        }
      }
      state.system.webcols = Object.assign([],[],webcols)
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
