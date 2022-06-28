<template>
	<div class="q-pa-sm text-center" style="position:fixed;width:300px;bottom:20px;margin:0 auto;left:0;right:0;">
		<q-btn icon="o_add" flat fab-mini color="grey-10" @click="$emit('showAdd')"/>
		<q-btn class="q-mx-md" icon="o_settings" flat fab-mini color="grey-10" @click="$emit('showSettings')"/>
		<q-btn icon="o_exit_to_app" flat fab-mini color="grey-10" @click="exit"/>
	</div>
</template>
<script>
export default{
name:'bottommenu',
components:{},
props:[],
data(){return {
	page:{},
}},
mounted(){},
methods:{
	exit(){
		if(true){
			this.$q.dialog({
		        title: '确定退出',
		        message: '页面尚未保存，确定要退出吗？',
		        cancel: true,
		        persistent: true,
		        color: 'red-10'
		    }).onOk(() => {
		    	this.$router.go(-1)
		    })
		}else{
			this.$router.go(-1)
		}
	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>