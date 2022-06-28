<template><div v-if="show">
<q-dialog v-model="show" position="left">
  <q-card style="width:250px">
    <q-bar>
      <div>列块</div>
      <q-space />
      <q-btn dense flat icon="close" v-close-popup/>
    </q-bar>
    <div class="q-pa-md">
      <q-select v-model="col.padding" :options="paddings" emit-value map-options option-value="value" option-label="text" label="边距" dense color="red-10" class="q-mb-sm"/>
      <q-select v-model="col.align" :options="align" emit-value map-options option-value="value" option-label="text" label="垂直对齐" dense color="red-10" class="q-mb-sm"/>
      <q-input dense label="背景色" color="red-10" v-model="col.backcolor" class="q-mb-sm">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="col.backcolor" format-model="hex" no-header/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="col.backcolor='transparent'"/>
        </template>
      </q-input>
      <q-input label="背景图" dense color="red-10" v-model="col.backimg">
        <template v-slot:append>
          <q-btn flat dense icon="close" @click="function(imgs){col.backimg='';var t=col.padding+'';col.padding='q-pa-none';col.padding=t;}"/>
        </template>
      </q-input>
      <upbtn iid="imgcol" label="设置背景图" class="q-mb-sm" @change="function(imgs){col.backimg=imgs[0];var t=col.padding+'';col.padding='q-pa-none';col.padding=t;}"></upbtn>
    </div>
  </q-card>
</q-dialog>
</div></template>

<script>
import upbtn from '@/components/UploadCom'
export default {
  name:'diacol',
  components:{upbtn},
  data:()=>({
    show:false,col:{},
    paddings:[
      {value:'q-pa-none',text:'无边距 -- none'},
      {value:'q-pa-xs',text:'超小边距 -- xs'},
      {value:'q-pa-sm',text:'小边距 -- sm'},
      {value:'q-pa-md',text:'中边距 -- md'},
      {value:'q-pa-lg',text:'大边距 -- lg'},
      {value:'q-pa-xl',text:'超大边距 -- xl'},
    ],
    align:[
      {value:'self-start',text:'居顶'},
      {value:'self-center',text:'居中'},
      {value:'self-end',text:'居底'},
    ],
  }),
  created(){},
  methods: {
    showd(col){
      this.col = col
      this.show = true
    },
  }
}
</script>