<template><div>
	<q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">文字</div>
      <q-input filled color="red-10" label="文字" v-model="obj.title" dense class="q-mb-sm" @input="reflesh" clearable/>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">宽度:{{obj.textwidth}}%</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.textwidth" :min="0" :max="100" color="red-10" @input="settextstyle"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">字号:{{obj.textsize}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.textsize" :min="0" :max="40" color="red-10" @input="settextstyle"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">定位:{{obj.textbottom}}%</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.textbottom" :min="0" :max="100" color="red-10" @input="settextstyle"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">边距:{{obj.textpadding}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.textpadding" :min="0" :max="24" color="red-10" @input="settextstyle"/>
        </q-item-section>
      </q-item>
      <q-input filled dense label="字色" color="red-10" v-model="obj.textcolor" class="q-mb-sm" @change="settextstyle">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="obj.textcolor" format-model="hexa" no-header @input="settextstyle"/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="obj.textcolor='transparent'"/>
        </template>
      </q-input>
      <q-input filled dense label="背景色" color="red-10" v-model="obj.textbackcolor" class="q-mb-sm" @change="settextstyle">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="obj.textbackcolor" format-model="hexa" no-header @input="settextstyle"/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="obj.textbackcolor='transparent'"/>
        </template>
      </q-input>
      <q-select filled v-model="obj.textjustify" :options="justify" emit-value map-options option-value="value" option-label="text" label="水平对齐" dense color="red-10" class="q-mb-sm"/>
      <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section class="text-left text-grey text-caption">
          <q-item-label>{{obj.textgradient?'自下而上':'自上而下'}}</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-toggle dense color="red-10" v-model="obj.textgradient" :true-value="1" :false-value="0" @input="settextstyle"/>
        </q-item-section>
      </q-item>
      <div class="row bg-grey-2 q-pa-sm q-mb-sm row justify-between">
        <q-checkbox dense v-model="obj.textweight" :true-value="1" :false-value="0" label="加粗" color="teal" @input="settextstyle"/>
        <q-checkbox dense v-model="obj.textgradual" :true-value="1" :false-value="0" label="渐变" color="red-14" class="q-mr-md" @input="settextstyle"/>
      </div>
</div></template>
<script>
export default{
	name:'edittext',
	props:['obj'],
	data:()=>({
		justify:[
	        {value:'text-left',text:'居左'},
	        {value:'text-center',text:'居中'},
	        {value:'text-right',text:'居右'},
	    ],
	}),
	mounted(){
    this.complate()
  },
	methods:{
    complate(){
      this.obj.title = this.obj.title?this.obj.title:''
      this.obj.textstyle = this.obj.textstyle?this.obj.textstyle:''
      this.obj.textsize=this.obj.textsize?this.obj.textsize:0
      this.obj.textpadding=this.obj.textpadding?this.obj.textpadding:0
      this.obj.textweight=this.obj.textweight?this.obj.textweight:0
      this.obj.textwidth=this.obj.textwidth?this.obj.textwidth:0
      this.obj.textbottom=this.obj.textbottom?this.obj.textbottom:0
      this.obj.textjustify=this.obj.textjustify?this.obj.textjustify:''
      this.obj.textcolor=this.obj.textcolor?this.obj.textcolor:''
      this.obj.textbackcolor=this.obj.textbackcolor?this.obj.textbackcolor:''
      this.obj.textgradual=this.obj.textgradual?this.obj.textgradual:0
      this.obj.textgradient=this.obj.textgradient?this.obj.textgradient:0
      this.settextstyle()
    },
    settextstyle(){
      let gradient = this.obj.textgradient?'background-image: linear-gradient(transparent,'+this.obj.textbackcolor+')':'background-image: linear-gradient('+this.obj.textbackcolor+',transparent)'
      let gradual = this.obj.textgradual?gradient:'background-color:'+this.obj.textbackcolor+''
      let tob = this.obj.textgradient?'bottom':'top'

      let style = 'position:absolute;'+gradual+';color:'+this.obj.textcolor+';'+tob+':'+this.obj.textbottom+'%;font-weight:'+(this.obj.textweight?'bold':'0')+';font-size:'+this.obj.textsize+'px;width:'+this.obj.textwidth+'%;padding:'+this.obj.textpadding+'px;'
      this.obj.textstyle = style
    },
    reflesh(){
      this.$emit('reflesh')
    },
	}
}
</script>