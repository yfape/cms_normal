<template><div v-if="show">
<q-dialog v-model="show" position="left">
  <q-card style="width:250px">
    <q-bar>
      <div>图片模块</div>
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
      <q-input filled color="red-10" label="图片地址" v-model="obj.src" dense @change="reflesh"/>
      <upbtn :iid="'img'+(new Date()).getTime()" class="q-mb-sm" label="上传图片" @change="function(imgs){obj.src=imgs[0];reflesh()}"></upbtn>

      <edittext :obj="obj" @reflesh="reflesh"></edittext>

      <q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">功能</div>
      <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section class="text-left text-grey text-caption">
          <q-item-label>{{obj.contain?'包含':'自适应'}}模式</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-toggle dense color="red-10" v-model="obj.contain" :true-value="1" :false-value="0" @change="reflesh"/>
        </q-item-section>
      </q-item>
      <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
        <q-item-section class="text-left text-grey text-caption">
          <q-item-label>{{obj.isthumbnail?'缩略图':'原图'}}模式</q-item-label>
        </q-item-section>
        <q-item-section side>
          <q-toggle dense color="red-10" v-model="obj.isthumbnail" :true-value="1" :false-value="0" @change="reflesh"/>
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
  name:'diaimg',
  components:{upbtn,selectarticle,selecttopic,selectmagazine,editflex,edittext},
  data:()=>({
    show:false,col:{},test:'',obj:{contain:0},
    justify:[
        {value:'text-left',text:'居左'},
        {value:'text-center',text:'居中'},
        {value:'text-right',text:'居右'},
    ],
  }),
  mounted(){},
  methods: {
    showd(content){
      this.obj = Object.assign({},{},JSON.parse(JSON.stringify(content)))
      this.obj.type = 'img'
      this.obj.src = this.obj.src?this.obj.src:''
      this.obj.url = this.obj.url?this.obj.url:''
      this.obj.height = this.obj.height?this.obj.height:'auto'
      this.obj.width = this.obj.width?this.obj.width:'100%'
      this.obj.contain = this.obj.contain?this.obj.contain:0
      this.obj.isthumbnail = this.obj.isthumbnail?this.obj.isthumbnail:0
      this.show = true
    },
    reflesh(){
      this.obj = Object.assign({},{},this.obj)
      this.$emit('refleshcol',this.obj)
    },
    setcontent(data,arg='article'){
      if(arg=='article'){
        this.obj.title = data[0].title
        this.obj.src = this.obj.isthumbnail?data[0].thumbnail:data[0].faceimg
      }else{
        this.obj.title = data[0].title
        this.obj.src = data[0].img
      }
      this.obj.url = '/'+arg+'/'+data[0].zid
      this.reflesh()
    }
  },
}
</script>