import Vue from 'vue'

Vue.prototype.lStorage = function(name,data=''){
	if(data){
		localStorage.setItem(name,JSON.stringify(data))
		return true
	}else{
		return localStorage.getItem(name)?JSON.parse(localStorage.getItem(name)):false
	}
},
Vue.prototype.formatDate = function(now) { 
     var year=now.getFullYear();
     var month=now.getMonth()+1;
     var date=now.getDate();
     // var hour=now.getHours();
     // var minute=now.getMinutes();
     // var second=now.getSeconds();
     return year+"年"+month+"月"+date+'日'; 
},
Vue.prototype.outRepeat = function(arr){
  return Array.from(new Set(array));
},
Vue.prototype.getLocalTime = function(posttime) { 
  return this.formatDate(new Date(posttime*1000));
}