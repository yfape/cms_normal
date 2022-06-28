<style scoped>
.imgys{transition:box-shadow 0.3s;cursor:pointer;}
.imgys:hover{box-shadow:5px 5px 10px #AFB2B2,-5px -5px 10px #AFB2B2}
.notvalid{filter:contrast(0.3);}
</style>
<template>
<div class="q-pa-md">
	<q-card class="q-pa-sm q-mb-sm">
		<q-btn label="新增杂志" dense icon="add" color="brown-5" @click="showdialog(-1)"/>
	</q-card>
	<div class="row">
		<div class="col-2 q-pa-lg" v-for="item in magazines">
			<q-img :class="{imgys:true,'notvalid':!parseInt(item.valid)}" :src="item.img" @click="showdialog(item.zid)">
				<div class="absolute-bottom text-subtitle1 text-center">
            		{{item.title}}
          		</div>
			</q-img>
		</div>
	</div>
	<mdialog ref="mdialog" @change="getmagazines"></mdialog>
</div>
</template>

<script>
import mdialog from '@/components/dialog/magazinedialog'

export default {
name: 'magazine',
components:{mdialog},
data:()=>({
	magazines:[
	],
}),
created(){
	
},
mounted(){
	this.getmagazines()
},
methods:{
	showdialog(zid){
		this.$refs.mdialog.showd(zid)
	},
	getmagazines(){
		this.$q.loading.show()
		this.axios.post('getMagazines').then(response=>{console.log(response)
			this.magazines = Object.assign([],[],response.magazines)
			this.$q.loading.hide()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	}

}
}
</script>
