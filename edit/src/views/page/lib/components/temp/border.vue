<template><div>
	<q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      	<div class="text-caption text-grey">边框:{{data.b_w}}px</div>
	    </q-item-section>
	    <q-item-section>
	      	<q-slider dense v-model="data.b_w" :min="0" :max="10" color="red-10" @input="changeborder"/>
	    </q-item-section>
  	</q-item>
  	<q-select class="q-mb-sm" color="red-10" label="样式" filled dense emit-value map-options option-value="value" option-label="text" :options="borders" v-model="data.b_s" @input="changeborder"/>
  	<q-input filled dense label="颜色" color="red-10" v-model="data.b_c" class="q-mb-sm" @input="changeborder">
	    <template v-slot:append>
	     	<q-icon name="colorize" class="cursor-pointer">
	        	<q-popup-proxy transition-show="scale" transition-hide="scale">
	          		<q-color v-model="data.b_c" format-model="hexa" no-header @input="changeborder"/>
	        	</q-popup-proxy>
	      	</q-icon>
	      	<q-btn flat icon="close" dense @click="data.b_c='transparent'"/>
	    </template>
	</q-input>
  	<div class="row bg-grey-2 q-pa-sm q-mb-sm row justify-between">
    	<q-checkbox dense v-model="data.b_t" :true-value="1" :false-value="0" label="上" color="red-10" @input="changeborder"/>
    	<q-checkbox dense v-model="data.b_b" :true-value="1" :false-value="0" label="下" color="red-14" class="q-mr-md" @input="changeborder"/>
    	<q-checkbox dense v-model="data.b_l" :true-value="1" :false-value="0" label="左" color="red-14" class="q-mr-md" @input="changeborder"/>
    	<q-checkbox dense v-model="data.b_r" :true-value="1" :false-value="0" label="右" color="red-14" class="q-mr-md" @input="changeborder"/>
  	</div>
</div></template>
<script>
export default{
name:'border',
components:{},
props:['data'],
data(){return {
	borders:[
	    {value:'dotted',text:'点状边框'},
	    {value:'dashed',text:'虚线边框'},
	    {value:'solid',text:'实线边框'},
	    {value:'double',text:'双边框'},
	    {value:'groove',text:'3D沟槽边框'},
	    {value:'ridge',text:'3D脊边框'},
	    {value:'inset',text:'3D嵌入边框'},
	    {value:'outset',text:'3D突出边框'},
    ]
}},
mounted(){},
methods:{
	reflesh(){
		this.$emit('update:data',this.data)
		this.$emit('reflesh')
	},
	changeborder(){
		if(!this.data.b_w){
			this.data.bd = ''
		}else{
			let border = this.data.b_w+'px '+this.data.b_s+' '+this.data.b_c
			let l = this.data.b_l ? border : ''
			let r = this.data.b_r ? border : ''
			let t = this.data.b_t ? border : ''
			let b = this.data.b_b ? border : ''

			this.data.bd = {
				'border-left':l,
				'border-right':r,
				'border-top':t,
				'border-bottom':b
			}
		}
	  	this.reflesh()
	},
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>