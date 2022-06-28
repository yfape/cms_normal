<template><div>
	<!--边框-->
  	<q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">边框</div>
  	<q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      	<div class="text-caption text-grey">边框:{{obj.borderwidth}}px</div>
	    </q-item-section>
	    <q-item-section>
	      	<q-slider dense v-model="obj.borderwidth" :min="0" :max="10" color="red-10" @input="changeborder"/>
	    </q-item-section>
  	</q-item>
  	<q-select class="q-mb-sm" color="red-10" label="样式" filled dense emit-value map-options option-value="value" option-label="text" :options="border" v-model="obj.borderstyle" @input="changeborder"/>
  	<q-input filled dense label="颜色" color="red-10" v-model="obj.bordercolor" class="q-mb-sm" @change="changeborder">
	    <template v-slot:append>
	     	<q-icon name="colorize" class="cursor-pointer">
	        	<q-popup-proxy transition-show="scale" transition-hide="scale">
	          		<q-color v-model="obj.bordercolor" format-model="hexa" no-header @input="changeborder"/>
	        	</q-popup-proxy>
	      	</q-icon>
	      	<q-btn flat icon="close" dense @click="obj.bordercolor='transparent'"/>
	    </template>
	</q-input>
  	<div class="row bg-grey-2 q-pa-sm q-mb-sm row justify-between">
    	<q-checkbox dense v-model="obj.bordertop" :true-value="1" :false-value="0" label="上" color="red-10" @input="reflesh"/>
    	<q-checkbox dense v-model="obj.borderbottom" :true-value="1" :false-value="0" label="下" color="red-14" class="q-mr-md" @input="reflesh"/>
    	<q-checkbox dense v-model="obj.borderleft" :true-value="1" :false-value="0" label="左" color="red-14" class="q-mr-md" @input="reflesh"/>
    	<q-checkbox dense v-model="obj.borderright" :true-value="1" :false-value="0" label="右" color="red-14" class="q-mr-md" @input="reflesh"/>
  	</div>

	<q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">布局</div>
	  <q-select filled v-model="obj.padding" :options="paddings" emit-value map-options option-value="value" option-label="text" label="边距" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
	  <q-select filled v-model="obj.align" :options="align" emit-value map-options option-value="value" option-label="text" label="垂直对齐" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
	  <q-select filled v-model="obj.justify" :options="justify" emit-value map-options option-value="value" option-label="text" label="水平对齐" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
	  <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      <div class="text-caption text-grey">上:{{obj.paddingtop}}px</div>
	    </q-item-section>
	    <q-item-section>
	      <q-slider dense v-model="obj.paddingtop" :min="0" :max="50" color="red-10" @input="reflesh"/>
	    </q-item-section>
	  </q-item>
	  <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      <div class="text-caption text-grey">下:{{obj.paddingbottom}}px</div>
	    </q-item-section>
	    <q-item-section>
	      <q-slider dense v-model="obj.paddingbottom" :min="0" :max="50" color="red-10" @input="reflesh"/>
	    </q-item-section>
	  </q-item>
	  <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      <div class="text-caption text-grey">左:{{obj.paddingleft}}px</div>
	    </q-item-section>
	    <q-item-section>
	      <q-slider dense v-model="obj.paddingleft" :min="0" :max="50" color="red-10" @input="reflesh"/>
	    </q-item-section>
	  </q-item>
	  <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
	    <q-item-section avatar>
	      <div class="text-caption text-grey">右:{{obj.paddingright}}px</div>
	    </q-item-section>
	    <q-item-section>
	      <q-slider dense v-model="obj.paddingright" :min="0" :max="50" color="red-10" @input="reflesh"/>
	    </q-item-section>
	  </q-item>
	  <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">背景</div>
	  <q-input filled dense label="背景色" color="red-10" v-model="obj.backcolor" class="q-mb-sm">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="obj.backcolor" format-model="hex" no-header/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="obj.backcolor='transparent'"/>
        </template>
      </q-input>
      <q-input filled label="背景图" dense color="red-10" v-model="obj.backimg">
        <template v-slot:append>
          <q-btn flat dense icon="close" @click="function(imgs){obj.backimg='';var t=obj.padding+'';obj.padding='q-pa-none';obj.padding='q-pa-xs';obj.padding=t;}"/>
        </template>
      </q-input>
      <upbtn iid="imgcol" label="设置背景图" class="q-mb-sm" @change="function(imgs){obj.backimg=imgs[0];var t=obj.padding+'';obj.padding='q-pa-none';obj.padding='q-pa-xs';obj.padding=t;}"></upbtn>
</div></template>
<script>
import upbtn from '@/components/UploadCom'
export default{
	name:'editflex',
	props:['obj'],
	components:{upbtn},
	data:()=>({
		paddings:[
	      {value:'q-pa-none',text:'无边距 -- none'},
	      {value:'q-pa-xs',text:'超小边距 -- xs'},
	      {value:'q-pa-sm',text:'小边距 -- sm'},
	      {value:'q-pa-md',text:'中边距 -- md'},
	      {value:'q-pa-lg',text:'大边距 -- lg'},
	      {value:'q-pa-xl',text:'超大边距 -- xl'},
	    ],
	    align:[
	      {value:'items-start',text:'居顶'},
	      {value:'items-center',text:'居中'},
	      {value:'items-end',text:'居底'},
	    ],
	    justify:[
	      {value:'justify-start',text:'居左'},
	      {value:'justify-center',text:'居中'},
	      {value:'justify-end',text:'居右'},
	    ],
	    border:[
	      {value:'dotted',text:'点状边框'},
	      {value:'dashed',text:'虚线边框'},
	      {value:'solid',text:'实现边框'},
	      {value:'double',text:'双边框'},
	      {value:'groove',text:'3D沟槽边框'},
	      {value:'ridge',text:'3D脊边框'},
	      {value:'inset',text:'3D嵌入边框'},
	      {value:'outset',text:'3D突出边框'},
    	]
	}),
	mounted(){
		this.complate()
	},
	methods:{
		complate(){
			this.obj.border = this.obj.border?this.obj.border:''
			this.obj.borderwidth = this.obj.borderwidth?this.obj.borderwidth:0
			this.obj.borderstyle = this.obj.borderstyle?this.obj.borderstyle:''
			this.obj.bordercolor = this.obj.bordercolor?this.obj.bordercolor:''
			this.obj.bordertop = this.obj.bordertop?this.obj.bordertop:0
			this.obj.borderbottom = this.obj.borderbottom?this.obj.borderbottom:0
			this.obj.borderleft = this.obj.borderleft?this.obj.borderleft:0
			this.obj.borderright = this.obj.borderright?this.obj.borderright:0

			this.obj.padding = this.obj.padding?this.obj.padding:''
	      	this.obj.paddingtop = this.obj.paddingtop?this.obj.paddingtop:0
	      	this.obj.paddingbottom = this.obj.paddingbottom?this.obj.paddingbottom:0
	      	this.obj.paddingleft = this.obj.paddingleft?this.obj.paddingleft:0
	      	this.obj.paddingright = this.obj.paddingright?this.obj.paddingright:0

	      	this.obj.align = this.obj.align?this.obj.align:''
	      	this.obj.justify = this.obj.justify?this.obj.justify:''
	      	this.changeborder()
		},
		changeborder(){
			if(!this.obj.borderwidth){
				this.obj.border = ''
			}else{
				this.obj.border = this.obj.borderwidth+'px '+this.obj.borderstyle+' '+this.obj.bordercolor
			}
	      	this.reflesh()
	    },
	    reflesh(){
			this.$emit('reflesh')
		},
	}
}
</script>