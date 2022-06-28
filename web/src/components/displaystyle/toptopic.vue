<style scoped>
#backimg{width:100%;min-width:1100px;position:absolute;z-index:-9;top:0;left:0;}
#importtopic{cursor:pointer;display:block;background-color:transparent;padding:0;}
.closeimporttopic{height:0;overflow:visible;width:1100px;margin:0 auto;text-align:right;position:relative;top:50px;}
.fade-enter-active, .fade-leave-active {
    transition:opacity 1s
}
.fade-enter, .fade-leave-to{
    opacity: 0
}
.fullwidth-fade-enter-active,.fullwidth-fade-leave-active{
	transition:width 1s,opacity 0.3s;
}
.fullwidth-fade-enter, .fullwidth-fade-leave-to{
    width:0;opacity:0;
}
.fullwidth-fade-enter-to, .fullwidth-fade-leave{
    width:1100px;opacity:1;
}
</style>
<template><div v-if="content.valid">
	<transition name="fade">
		<div v-if="parseInt(content.show)" class="closeimporttopic"><q-btn flat round color="white" icon="close" @click="$emit('close')"/></div>
	</transition>
	<transition name="fade">
		<img id="backimg" v-if="parseInt(content.show)" :src="content.backimg"/>
	</transition>
	<transition name="fullwidth-fade">
		<img v-if="parseInt(content.show)" :src="content.faceimg" id="importtopic" class="widthlim" @click="gourl(content.url)"/>
	</transition>
</div></template>
<script>
export default{
	name:'toptopic',
	props:['content'],
	data:()=>({

	}),
	mounted(){
		this.autoshow()
	},
	methods:{
		autoshow(){
			if(this.content.faceimg&&(this.content.show===0)){
				this.$emit('open')
			}
		}
	}
}
</script>