<template><div>
	<q-select v-model="data.m" :options="$store.state.margins" filled emit-value map-options option-value="value" option-label="text" label="外边距" dense color="red-10" class="q-mb-sm" @input="reflesh"/>

	<q-badge class="q-mt-sm" color="grey">上边距：{{data.m_t}}px</q-badge>
	<q-slider dense v-model="data.m_t" :min="0" :max="50" :step="1" color="red-10" @input="reflesh"/>
	<q-badge class="q-mt-sm" color="grey">下边距：{{data.m_b}}px</q-badge>
	<q-slider dense v-model="data.m_b" :min="0" :max="50" :step="1" color="red-10" @input="reflesh"/>
</div></template>
<script>
export default{
name:'margin',
components:{},
props:['data'],
data(){return {
}},
mounted(){},
methods:{
	reflesh(){this.$emit('update:data',this.data);this.$emit('reflesh')}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>