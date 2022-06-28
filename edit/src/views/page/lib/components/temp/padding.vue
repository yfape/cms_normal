<template><div>
	<q-select v-model="data.p" :options="paddings" filled emit-value map-options option-value="value" option-label="text" label="内边距" dense color="red-10" class="q-mb-sm" @change="reflesh"/>
	<q-badge class="q-mt-sm" color="grey">上边距：{{data.p_t}}px</q-badge>
	<q-slider dense v-model="data.p_t" :min="0" :max="50" :step="1" color="red-10"/>
	<q-badge class="q-mt-sm" color="grey">下边距：{{data.p_b}}px</q-badge>
	<q-slider dense v-model="data.p_b" :min="0" :max="50" :step="1" color="red-10"/>
	<q-badge class="q-mt-sm" color="grey">左边距：{{data.p_l}}px</q-badge>
	<q-slider dense v-model="data.p_l" :min="0" :max="50" :step="1" color="red-10"/>
	<q-badge class="q-mt-sm" color="grey">右边距：{{data.p_r}}px</q-badge>
	<q-slider dense v-model="data.p_r" :min="0" :max="50" :step="1" color="red-10"/>
</div></template>
<script>
export default{
name:'',
components:{},
props:['data'],
data(){return {
	paddings:[
		{value:'',text:'默认'},
		{value:'q-pa-none',text:'无'},
		{value:'q-pa-xs',text:'超小'},
		{value:'q-pa-sm',text:'小'},
		{value:'q-pa-md',text:'中'},
		{value:'q-pa-lg',text:'大'},
		{value:'q-pa-xl',text:'超大'},
	]
}},
mounted(){},
methods:{
	reflesh(){this.$emit('update:data',this.data);this.$emit('reflesh');}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>