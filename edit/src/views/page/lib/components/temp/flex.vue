<template><div>
	<q-select v-model="data.a" :options="aligns" filled emit-value map-options option-value="value" option-label="text" label="垂直分布" dense color="red-10" class="q-mb-sm" @change="reflesh"/>
	<q-select v-model="data.j" :options="justifys" filled emit-value map-options option-value="value" option-label="text" label="水平分布" dense color="red-10" @change="reflesh"/>
</div></template>
<script>
export default{
name:'margin',
components:{},
props:['data'],
data(){return {
	aligns:[
		{value:'',text:'无'},
		{value:'items-start',text:'顶部对齐'},
		{value:'items-center',text:'居中对齐'},
		{value:'items-end',text:'底部对齐'},
		{value:'items-stretch',text:'列伸展'},
		{value:'items-baseline',text:'基准线对齐'},
	],
	justifys:[
		{value:'',text:'无'},
		{value:'justify-start',text:'左分布'},
		{value:'justify-center',text:'居中分布'},
		{value:'justify-end',text:'右分布'},
		{value:'justify-between',text:'两端分布'},
		{value:'justify-around',text:'分散分布'},
		{value:'justify-evenly',text:'优化分布'},
	]
}},
mounted(){},
methods:{
	reflesh(){this.$emit('update:data',this.data)}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>