<style scoped>
.inpanel{animation-fill-mode:forwards;animation:panelin 0.3s;}
@keyframes panelin{
	from{bottom:-100px;}
	to{bottom:0px;}
}
.outpanel{animation-fill-mode:forwards;animation:panelout 0.3s;}
@keyframes panelout{
	from{bottom:0px;}
	to{bottom:-100px;}
}
</style>
<template><div style="position:fixed;bottom:0;left:0;right:0;z-index:999;width:500px;margin:0 auto;" :class="{inpanel:true,outpanel:out}">
	<div style="height:0;width:100%;text-align:right;overflow:visible;">
		<q-btn flat  dense icon round style="position:relative;top:0px;z-index:1" @click="exit_panel" icon="close"/>
	</div>
	<a-player style="box-shadow:-1px 0px 3px #999999" autoplay :music="{
			  title: $store.state.audio.title,
			  artist: ' ',
			  src: $store.state.audio.url,
			  pic: $store.state.audio.img,
			  lrc: '[00:00.00]lrc here [00:01.00]aplayer'
	}"></a-player>
</div></template>
<script>
import VueAplayer from 'vue-aplayer'
export default{
	name:'audiopanel1',
	components: {
        'a-player': VueAplayer
    },
	data:()=>({
		out:false,
	}),
	created(){
		console.log('create')
	},
	mounted(){
		console.log('start')
	},
	methods:{
		exit_panel(){
			this.out = true
			let _this = this
			setTimeout(function(){
				_this.$store.commit('audio_exit')
			},300)
		}
	},
	destroyed(){
		console.log('over')
	}
}
</script>