<template><div v-if="show">
<q-dialog v-model="show" position="left">
  <q-card style="width:250px">
    <q-bar>
      <div>图文模块二</div>
      <q-space />
      <q-btn dense flat icon="delete" v-close-popup class="q-mr-sm" @click="$emit('deletecom')"/>
      <q-btn dense flat icon="close" v-close-popup/>
    </q-bar>
    <div class="q-px-md">

      <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">基本属性</div>
      <q-input filled color="red-10" label="链接" v-model="obj.url" dense class="q-mb-sm" @change="reflesh">
        <template v-slot:append>
          <q-btn dense icon="link" flat>
            <q-popup-edit v-model="test">
              <q-btn class="text-teal" flat label="文章" @click="$refs.selectarticle.showd()"/>
              <q-btn class="text-teal" flat label="专题" @click="$refs.selecttopic.showd()"/>
              <q-btn class="text-teal" flat label="杂志" @click="$refs.selectmagazine.showd()"/>
            </q-popup-edit>
          </q-btn>
        </template>
      </q-input>
      <q-input filled color="red-10" label="宽度(例 100%,300px)" v-model="obj.width" dense class="q-mb-sm" @input="reflesh"/>
      <q-input filled color="red-10" label="高度(例 200px,auto)" v-model="obj.height" dense class="q-mb-sm" @input="reflesh"/>
      <q-select filled v-model="obj.inpadding" :options="paddings" emit-value map-options option-value="value" option-label="text" label="边距" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
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
      <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section class="text-left">
          <q-item-label>{{obj.imgleft?'左图右文':'右图左文'}}</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-toggle dense color="red-10" v-model="obj.imgleft" :true-value="1" :false-value="0" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">图片</div>
      <q-input filled color="red-10" label="图片地址" v-model="obj.img" dense @change="reflesh"/>
      <upbtn :iid="'img'+(new Date()).getTime()" class="q-mb-sm" label="上传图片" @change="function(imgs){obj.img=imgs[0];reflesh()}"></upbtn>
      <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section class="text-left">
          <q-item-label>{{obj.isavatar?'大图':'小图'}}</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-toggle dense color="red-10" v-model="obj.isavatar" :true-value="1" :false-value="0" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">文字</div>
      <q-input filled color="red-10" label="标题" v-model="obj.title" dense class="q-mb-sm" @input="reflesh"/>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">字号:{{obj.size}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.size" :min="0" :max="40" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-input filled dense label="字色" color="red-10" v-model="obj.color" class="q-mb-sm" @change="reflesh">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="obj.color" format-model="hexa" no-header @input="reflesh"/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="obj.color='transparent'"/>
        </template>
      </q-input>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">粗细:{{obj.weight}}</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.weight" :min="100" :max="600" :step="100" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-select filled v-model="obj.textjustify" :options="textjustify" emit-value map-options option-value="value" option-label="text" label="水平对齐" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
      <!--简介-->
      <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">简介</div>
      <q-input filled color="red-10" label="简介" v-model="obj.intro" dense class="q-mb-sm" @input="reflesh"/>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">字号:{{obj.introsize}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.introsize" :min="0" :max="40" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-input filled dense label="字色" color="red-10" v-model="obj.introcolor" class="q-mb-sm" @change="reflesh">
        <template v-slot:append>
          <q-icon name="colorize" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-color v-model="obj.introcolor" format-model="hexa" no-header @input="reflesh"/>
            </q-popup-proxy>
          </q-icon>
          <q-btn flat icon="close" dense @click="obj.introcolor='transparent'"/>
        </template>
      </q-input>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">粗细:{{obj.introweight}}</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.introweight" :min="100" :max="600" :step="100" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">上:{{obj.introtop}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.introtop" :min="0" :max="50" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section avatar>
          <div class="text-caption text-grey">下:{{obj.introbottom}}px</div>
        </q-item-section>
        <q-item-section>
          <q-slider dense v-model="obj.introbottom" :min="0" :max="50" color="red-10" @input="reflesh"/>
        </q-item-section>
      </q-item>
      
      <editflex :obj="obj" @reflesh="reflesh"></editflex>
    </div>
  </q-card>
</q-dialog>

<selectarticle ref="selectarticle" @change="function(data){setcontent(data,'article')}"></selectarticle>
<selecttopic ref="selecttopic" @change="function(data){setcontent(data,'topic')}"></selecttopic>
<selectmagazine ref="selectmagazine" @change="function(data){setcontent(data,'magazine')}"></selectmagazine>
</div></template>

<script>
import upbtn from '@/components/UploadCom'
import selectarticle from '@/components/dialog/selectarticle'
import selecttopic from '@/components/dialog/selecttopic'
import selectmagazine from '@/components/dialog/selectmagazine'
import editflex from '@/components/mini/editflex'
import edittext from '@/components/mini/edittext'

export default {
  name:'diaimgtext2',
  components:{upbtn,selectarticle,selecttopic,selectmagazine,editflex,edittext},
  data:()=>({
    show:false,col:{},test:'',obj:{contain:0},
    textjustify:[
        {value:'text-left',text:'居左'},
        {value:'text-center',text:'居中'},
        {value:'text-right',text:'居右'},
    ],
    paddings:[
        {value:'q-pa-md',text:'中边距 -- md'},
        {value:'q-pa-lg',text:'大边距 -- lg'},
        {value:'q-pa-xl',text:'超大边距 -- xl'},
    ],
  }),
  mounted(){},
  methods: {
    showd(content){
      this.obj = Object.assign({},{},JSON.parse(JSON.stringify(content)))
      this.obj.type = 'imgtext2'
      this.obj.img = this.obj.img?this.obj.img:''
      this.obj.url = this.obj.url?this.obj.url:''
      this.obj.height = this.obj.height?this.obj.height:'auto'
      this.obj.width = this.obj.width?this.obj.width:'100%'
      this.obj.imgleft = this.obj.imgleft?this.obj.imgleft:1
      this.obj.isavatar = this.obj.isavatar?this.obj.isavatar:0
      this.obj.inpadding = this.obj.inpadding?this.obj.inpadding:'q-pa-md'
      this.reflesh()
      this.show = true
    },
    reflesh(){
      this.obj = Object.assign({},{},this.obj)
      this.$emit('refleshcol',this.obj)
    },
    setcontent(data,arg='article'){
      if(arg=='article'){
        this.obj.title = data[0].title
        this.obj.img = this.obj.isthumbnail?data[0].thumbnail:data[0].faceimg
        this.obj.url = '/'+arg+'/'+data[0].aid
      }else if(arg=='topic'){
        this.obj.title = data[0].title
        this.obj.img = data[0].img
        this.obj.url = '/'+arg+'/'+data[0].tid
      }else{
        this.obj.title = data[0].title
        this.obj.img = data[0].img
        this.obj.url = '/'+arg+'/'+data[0].zid
      }
      
      this.reflesh()
    }
  },
}
</script>