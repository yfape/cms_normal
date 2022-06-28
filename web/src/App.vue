<template>
  <router-view id="app" v-if="show"></router-view>
</template>
<script>
export default {
name: 'app',
data:()=>({
	show:false
}),
created(){},
mounted(){
	this.getNav()
},
methods:{
	getNav(){
		let isuser = this.judgeUser()
		this.axios.get('nav',{params:{isuser:isuser}}).then(response=>{
			this.$store.state.nav = Object.assign([],[],response)
			this.show = true
		})
	},
	judgeUser(){
		let isuser = localStorage.getItem('isuser');
		return isuser?1:0
	}
}
}
</script>


