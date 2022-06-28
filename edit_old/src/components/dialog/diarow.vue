<template><div v-if="show">
<q-dialog v-model="show" position="left">
  <q-card style="width:250px">
    <q-bar>
      <div>框架</div>
      <q-space />
      <q-btn dense flat icon="delete" v-close-popup class="q-mr-sm" @click="$emit('deleterow')"/>
      <q-btn dense flat icon="close" v-close-popup/>
    </q-bar>
    <div class="q-pa-md">
      <q-select v-model="row.padding" :options="paddings" emit-value map-options option-value="value" option-label="text" label="边距" dense color="red-10" class="q-mb-sm"/> 
      <q-select v-model="row.align" :options="align" emit-value map-options option-value="value" option-label="text" label="垂直对齐" dense color="red-10" class="q-mb-sm"/>
      <q-select v-model="row.justify" :options="justify" emit-value map-options option-value="value" option-label="text" label="水平对齐" dense color="red-10" class="q-mb-sm"/>
      <q-input dense label="背景色" color="red-10" v-model="row.backcolor" class="q-mb-sm">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="row.backcolor" format-model="hex" no-header/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="row.backcolor='transparent'"/>
        </template>
      </q-input>
      <q-input label="背景图" dense color="red-10" v-model="row.backimg">
        <template v-slot:append>
          <q-btn flat dense icon="close" @click="function(imgs){row.backimg='';var t=row.padding+'';row.padding='q-pa-none';row.padding=t;}"/>
        </template>
      </q-input>
      <upbtn iid="imgrow" label="设置背景图" class="q-mb-sm" @change="function(imgs){row.backimg=imgs[0];var t=row.padding+'';row.padding='q-pa-none';row.padding=t;}"></upbtn>
      <q-item dense class="q-px-none">
        <q-item-section avatar>
          <div>上外边距:{{row.margintop}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider v-model="row.margintop" :min="0" :max="50" color="grey-7"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-px-none">
        <q-item-section avatar>
          <div>下外边距:{{row.marginbottom}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider v-model="row.marginbottom" :min="0" :max="50" color="brown-7"/>
        </q-item-section>
      </q-item>
    </div>
  </q-card>
</q-dialog>
</div></template>

<script>
import upbtn from '@/components/UploadCom'
export default {
  name:'diarow',
  components:{upbtn},
  data:()=>({
    show:false,row:{},
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
      {value:'justify-around',text:'分散'},
      {value:'justify-between',text:'两端'},
    ],
  }),
  created(){},
  methods: {
    showd(row){
      this.row = row
      this.show = true
    },
  }
}
</script>