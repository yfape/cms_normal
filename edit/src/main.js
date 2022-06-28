import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import './quasar'
import '@/plugins/froala'
import router from './router'
import store from './store'
import '@/assets/common.scss'
import '@/plugins/helper.js'

Vue.config.productionTip = false

Vue.prototype.AItip = function(title,actions){
  if(!title){
    return
  }
	this.$q.notify({
      message: title,
      position: 'top',
      avatar: '/static/sys/ai1.gif',
      html: true,
      timeout:actions?0:2000,
      color: 'secondary',
      actions:actions
  })
}

Vue.prototype.getUserdata = function(){
  return this.$store.state.userdata
}

var vue = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default vue
