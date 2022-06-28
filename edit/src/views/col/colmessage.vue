<style lang="scss" :scoped="true">

</style>
<template>
<div class="q-pa-md" v-if="show">
	<q-card class="q-pa-sm q-mb-md no-shadow"><q-btn icon="add" color="brown-5" label="新增主栏目" @click="openAdd(0)"/></q-card>
	<q-tree :nodes="$store.state.system.webcols" node-key="cid" accordion>
	  	<template v-slot:default-header="prop">
	      		<q-item dense :class="{'full-width':true,'text-grey-4':prop.node.valid===0}" clickable>
	      			<q-item-section>
	      				{{ prop.node.col }}
	      			</q-item-section>
		      		<q-item-section side>
		      			<div v-if="prop.node.sub===0">
		      				<q-btn flat dense icon="expand_less" v-if="prop.node.allsort>0" @click="changeColAllSort(prop.node.cid,prop.node.allsort-1)"/>
			      			<q-btn flat dense icon="expand_more" v-if="prop.node.allsort<$store.state.system.webcols.length-1" @click="changeColAllSort(prop.node.cid,prop.node.allsort+1)"/>
			      			<q-btn color="red-10" flat label="删除" v-if="prop.node.children.length===0">
			      				<q-popup-edit v-model="show" content-class="bg-brown-9 text-white">
						            <div class="text-center">真的要删除吗?<br>(栏目内所有文章无法浏览)</div>
						            <q-btn class="full-width" :loading="loading" unelevated size="sm" color="red-8" label="确定" icon="delete" @click="deleteCol(prop.node.cid)"/>
						        </q-popup-edit>
			      			</q-btn>
			      			<q-btn color="red-10" flat :label="prop.node.valid?'禁用':'启用'" @click="changeValid(prop.node.cid,prop.node.valid?0:1)"/>
		      				<q-btn flat dense label="新增子栏目" @click="openAdd(1,prop.node)"/>
		      			</div>
		      			<div v-if="prop.node.sub===1">
			      			<q-btn flat icon="expand_less" v-if="prop.node.sort>1" @click="changeColSort(prop.node.cid,prop.node.sort-1)"/>
			      			<q-btn flat icon="expand_more" v-if="prop.node.sort<$store.state.system.webcols[prop.node.allsort].children.length" @click="changeColSort(prop.node.cid,prop.node.sort+1)"/>
			      			<q-btn color="red-10" flat label="删除">
			      				<q-popup-edit v-model="show" content-class="bg-brown-9 text-white">
						            <div class="text-center">真的要删除吗?<br>(栏目内所有文章无法浏览)</div>
						            <q-btn class="full-width" :loading="loading" unelevated size="sm" color="red-8" label="确定" icon="delete" @click="deleteCol(prop.node.cid)"/>
						        </q-popup-edit>
			      			</q-btn>
			      			<q-btn color="red-10" flat :label="prop.node.valid?'禁用':'启用'" @click="changeValid(prop.node.cid,prop.node.valid?0:1)"/>
		      			</div>
		      		</q-item-section>
	      		</q-item>
	      	</template>
	</q-tree>
	<q-dialog v-model="add.show">
		<q-card class="q-pa-md">
			<q-input filled class="q-mb-sm" color="brown-5" dense label="栏目名" v-model="add.col"/>



			<q-item class="bg-grey-2 q-mb-sm" dense>
				<q-item-section class="text-brown-5">{{add.valid?'启用':'禁用'}}</q-item-section>
				<q-item-section slide class="text-right">
					<q-toggle v-model="add.valid" :false-value="0" :true-value="1" color="brown-5"/>
				</q-item-section>
			</q-item>
			<div class="full-width"></div>
			<q-btn color="brown-5" class="full-width" :label="add.sub?'新增至 “'+add.parentcol+'”':'新增主栏目'" @click="addCol"/>
		</q-card>
	</q-dialog>
</div>
</template>

<script>
export default {
name: 'colmessage',
components:{},
data:()=>({
  show:false,loading:false,
  add:{show:false,col:'',sub:1,group:1,valid:1,parentcol:''},
}),
created(){},
mounted(){
  this.show = true
},
methods:{
	openAdd(sub,parent={}){
		this.add.col = ''
		this.add.sub = sub
		this.add.group = parent.group
		this.add.parentcol = parent.col
		this.add.show = true
	},
	changeColSort(cid,sort){
		this.$q.loading.show({message: '请等待'})
		this.axios.post('changeColSort',{cid:cid,sort:sort}).then(response=>{
			this.getSystemInfo()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	getSystemInfo(){
		this.axios.post('system').then(response=>{
          	this.$store.commit('setSystem',response)
          	this.add.show = false
          	this.loading = false
          	this.$q.loading.hide()
	    }).catch(err=>{
	    	this.loading = false
	    	this.$q.loading.hide()
	    })
	},
	changeColAllSort(cid,allsort){
		this.$q.loading.show({message: '请等待'})
		this.axios.post('changeColAllSort',{cid:cid,allsort:allsort}).then(response=>{
			this.getSystemInfo()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	deleteCol(cid){
		this.loading = true
		this.changeValid(cid,-1)
	},
	changeValid(cid,valid){
		this.$q.loading.show({message: '请等待'})
		this.axios.post('changeValid',{cid:cid,valid:valid}).then(response=>{
			this.getSystemInfo()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	addCol(){
		this.$q.loading.show({message: '请等待'})
		this.axios.post('addCol',{
			sub:this.add.sub,
			col:this.add.col,
			valid:this.add.valid,
			group:this.add.group
		}).then(response=>{
			this.getSystemInfo()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	}
}
}
</script>
