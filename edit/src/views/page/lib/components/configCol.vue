<template>
	<q-dialog v-model="show" position="bottom">
		<q-card class="row" style="min-width:900px">
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">布局</div>
				<padding :data.sync="col"/>
				<q-select class="q-mt-sm" v-model="col.s" :options="selfs" filled emit-value map-options option-value="value" option-label="text" label="相对于框架垂直分布" dense color="red-10" @change="reflesh"/>
				<q-select class="q-mt-sm" v-model="col.a" :options="contents" filled emit-value map-options option-value="value" option-label="text" label="列内部垂直分布" dense color="red-10" @change="reflesh"/>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">背景</div>
				<background :data.sync="col"/>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">边框</div>
				<border :data.sync="col" @reflesh="reflesh"/>
			</div>
		</q-card>
	</q-dialog>
</template>
<script>
import padding from './temp/padding'
import background from './temp/background'
import border from './temp/border'

export default{
name:'configCol',
components:{padding,background,border},
props:['col'],
data(){return {
	show:false,
	selfs:[
		{value:'',text:'默认'},
		{value:'self-start',text:'居顶'},
		{value:'self-center',text:'居中'},
		{value:'self-end',text:'居底'},
	],
	contents:[
		{value:'',text:'无'},
		{value:'content-start',text:'顶部'},
		{value:'content-center',text:'居中'},
		{value:'content-end',text:'底部'},
		{value:'content-stretch',text:'列伸展'},
		{value:'content-between',text:'分散于上下'},
		{value:'content-around',text:'优化分布'},
	],
}},
mounted(){},
methods:{
	showPanel(){this.show=true},
	reflesh(){
		this.$emit('update:col',this.col);
		this.$emit('reflesh');
	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>