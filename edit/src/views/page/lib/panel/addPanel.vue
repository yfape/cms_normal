<template>
	<q-dialog v-model="show" position="bottom" seamless>
		<q-card style="min-width:900px">
			<q-bar class="full-width bg-grey-6 text-white q-pl-none rounded-borders">
       			<q-tabs >
       				<q-tab label="文字"/>
       				<q-tab label="图文"/>
       				<q-tab label="特效"/>
       			</q-tabs>
		        <q-space />
		        <q-btn dense flat icon="close" v-close-popup/>
		    </q-bar>
		    <div class="row drop-target">
		    	<div class="col-3 q-pa-md text-center text-grey"><q-img id="imgtext1" contain src="/static/imgtext1.png" :ratio="16/9" :draggable="true" @dragstart="onDragStart"/>图文1（图片）</div>
				<div class="col-3 q-pa-md text-center text-grey"><q-img id="imgtext2" contain src="/static/imgtext2.png" :ratio="16/9" :draggable="true" @dragstart="onDragStart"/>图文2</div>
				<div class="col-3 q-pa-md text-center text-grey"><q-img id="imgtext3" contain src="/static/imgtext3.png" :ratio="16/9" :draggable="true" @dragstart="onDragStart"/>图文3</div>
		    </div>
			
		</q-card>
		
	</q-dialog>
</template>
<script>
export default{
name:'',
components:{},
props:[],
data(){return {
	show:false,
}},
mounted(){},
methods:{
	showPanel(){this.show = true},
	onDragStart(e){
		let com = {
			t:e.target.id,
			img:'static/temp.jpg',
		}
		e.dataTransfer.setData('cp', JSON.stringify(com))
		e.dataTransfer.dropEffect = 'move'
		// this.$emit('dragstart',e)
	},
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>