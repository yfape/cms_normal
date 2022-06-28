<template><div v-if="show">
	<q-tabs dense narrow-indicator active-color="red-10" align="justify" class="text-grey-6" v-if="$store.state.control.toptab">
		<q-route-tab v-for="item,index in $store.state.nav" :to="item.url" exact @click="setTitle(item.text)">
			<div class="text-subtitle2 cfont">{{item.text}}</div>
		</q-route-tab>
	</q-tabs>
	<router-view :class="[
    [$q.dark.isActive?'':'bg-grey-1']
  ]"/>
</div></template>

<script>
export default {
  name: 'Home',
  data:()=>({
    show:false,text:'',col:0
  }),
  mounted(){
    this.getConfig()
  },
  methods:{
  	setTitle(title){
  		document.title = '四川党建网 - '+title
  	},
    getConfig(){
      var nav = this.getCookie('nav')
      if(!nav){
        this.getNav()
      }else{
        this.$store.state.nav = Object.assign([],[],JSON.parse(nav))
        this.show = true
      }
    },
    getNav(){
      this.$q.loading.show()
      this.axios.get('nav').then(res=>{
        this.$store.state.nav = Object.assign([],[],res)
        this.setCookie('nav',JSON.stringify(res))
        this.show = true
        this.$q.loading.hide()
      })
    },
    setCookie(name,value){
      var exp = new Date(); 
      exp.setTime(exp.getTime() + 20*60*1000);
      document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    },
    getCookie(name){
      var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
      if(arr=document.cookie.match(reg)) return unescape(arr[2]);
      else return null;
    },
  }
}
</script>
<style>

</style>