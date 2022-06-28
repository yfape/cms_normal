import Vue from 'vue'
import './plugins/axios'
import './plugins/helper'
import App from './App.vue'
import router from './router'
import store from './store'
import './quasar'
import '@/assets/css/common.css'
import footer1 from './components/footer/footer1'

Vue.component('footer1',footer1)

Vue.config.productionTip = false

Vue.prototype.gourl = function(url){
  if(!url){
    return
  }
  if(url.indexOf("http") != -1){
    window.location.href=url
  }else{
    router.push(url)
  }
}

Vue.prototype.goArticle = function(aid){
  router.push('/article/'+aid)
}

Vue.prototype.df = function(timestamp){
	var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    var D = date.getDate() + ' ';
    // var h = date.getHours() + ':';
    // var m = date.getMinutes() + ':';
    // var s = date.getSeconds();
    return Y+M+D;
}

Vue.prototype.timefor = function(timestamp){
  
}

var vue = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default vue