import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import store from './store'
import './quasar'
import '@/assets/common.css'
import '../public/static/font.css'

Vue.config.productionTip = false

Vue.prototype.timefor = function(timestamp,now){
	let text = ''
	let c = now-timestamp
	switch(true){
		case c<60:text='刚刚';break;
		case c>=60&&c<600:text=parseInt(c/60)+'分钟前';break;
		case c>=600&&c<3600:text='半小时前';break;
		case c>=3600&&c<86400:text=parseInt(c/3600)+'小时前';break;
		case c>=86400&&c<=432000:text=parseInt(c/86400)+'天前';break;
		case c>432000:var date = new Date(timestamp * 1000);var Y = date.getFullYear() + '-';var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';var D = date.getDate()<10? "0" + date.getDate():date.getDate();text=Y+M+D;break;
	}
	return text;
}

Vue.prototype.goArticle = function(aid){
	if(aid){
		this.$router.push('/article/'+aid)
	}
}

var vue = new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

export default vue
