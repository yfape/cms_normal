import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  	nav:[],
  	tool:{show:false,dark:false,largefont:false,},
    control:{toptab:true,footer1:true}
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  }
})
