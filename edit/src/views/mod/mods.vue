<template><div class="q-pa-lg">
	<q-table class="no-shadow" color="red-10" :data="list.data" :columns="list.config"row-key="pid" :loading="loading">
	    <template v-slot:body="props">
	        <q-tr :props="props">
	          <q-td key="mid" :props="props">{{ props.row.mid }}</q-td>
	          <q-td key="title" :props="props">{{ props.row.title }}</q-td>
	          <q-td key="actions" :props="props">
	              <q-btn :disable="loading" flat dense round icon="o_edit" color="green" class="q-ml-sm" @click="openMod(props.row.mid)"/>
	          </q-td>
	        </q-tr>
	    </template>
    </q-table>
    <textedit ref="textedit" @save="saveContent"/>
</div></template>
<script>
import textedit from '@/components/tool/textedit'
export default{
name:'mods',
components:{textedit},
data(){return {
	list:{
	    config:[
	      { name: 'mid', required: true, label: 'MODID', align: 'left', field: row => row.mid, style:'width:60px'},
	      { name: 'title', label: '名称', align: 'center'},
	      { name: 'actions', label: '操作', align: 'right'},
	    ],
	    data:[],
	    page:1
	},
	action:{},loading:false,
}},
mounted(){
	this.getData()
},
methods:{
	getData(){
    	this.loading = true
		this.axios.post('mods',{page:this.list.page}).then(res=>{
      		this.list.data = Object.assign([],[],res)
			this.show = true
      		this.loading = false
		})
	},
	saveContent(data){
		this.loading = true
		this.axios.post('saveMod',{mid:this.action.mid,data:data}).then(res=>{
			this.getData()
		})
	},
	openMod(mid){
		this.loading = true
		let obj;
		this.axios.post('mod',{mid:mid}).then(res=>{
			this.action = Object.assign([],[],res)
			this.$refs.textedit.showPanel(this.action.data)
			this.loading = false
		})
		
	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>