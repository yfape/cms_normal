<template><div v-if="show">
<q-dialog v-model="show" position="left">
  <q-card style="width:250px">
    <q-bar>
      <div>幻灯片模块</div>
      <q-space />
      <q-btn dense flat icon="delete" v-close-popup class="q-mr-sm" @click="$emit('deletecom')"/>
      <q-btn dense flat icon="close" v-close-popup/>
    </q-bar>
    <div class="row">
      <div class="col-12 q-pa-md">
        <q-separator /><div class="q-mb-sm text-caption text-grey">基本属性</div>
        <q-input filled color="red-10" label="宽度(例 100%,300px)" v-model="obj.width" dense class="q-mb-sm" @input="reflesh"/>
        <q-input filled color="red-10" label="高度(例 200px,auto)" v-model="obj.height" dense @input="reflesh"/>
      </div>
      <div class="col-12 q-pa-md">
        <q-separator /><div class="q-mb-sm text-caption text-grey">数据</div>
        <q-item dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section avatar>
            <div class="text-caption text-grey">条数:{{obj.count}}</div>
          </q-item-section>
          <q-item-section>
            <q-slider dense v-model="obj.count" :min="0" :max="20" color="red-10" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.isthumbnail?'缩略图':'原图'}}模式</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.isthumbnail" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <div><q-btn dense label="设置条数据" icon="graphic_eq" outline color="red-10" class="full-width" @click="$refs.messimgtext.showd(obj)"/></div>
      </div>
      <div class="col-12 q-pa-md">
        <q-separator /><div class="q-mb-sm text-caption text-grey">幻灯片模式</div>
        <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.arrows?'启用':'禁用'}}左右箭头</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.arrows" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.navigation?'启用':'禁用'}}点状导航</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.navigation" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.thumbnails?'启用':'禁用'}}缩略图</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.thumbnails" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.infinite?'启用':'禁用'}}循环播放</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.infinite" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
        <q-item tag="label" dense class="bg-grey-2 q-pa-sm">
          <q-item-section class="text-left">
            <q-item-label>{{obj.autoplay?'启用':'禁用'}}自动播放</q-item-label>
          </q-item-section>
          <q-item-section side>
            <q-toggle dense color="red-10" v-model="obj.autoplay" :true-value="1" :false-value="0" @input="reflesh"/>
          </q-item-section>
        </q-item>
      </div>
      
      <edittext class="col-12 q-px-md" :obj="obj" @reflesh="reflesh"></edittext>

      <editflex class="col-12 q-px-md" :obj="obj" @reflesh="reflesh"></editflex>
    </div>
  </q-card>
</q-dialog>

<messimgtext ref="messimgtext" @reflesh="refleshcontent"></messimgtext>
</div></template>

<script>
import upbtn from '@/components/UploadCom'
import editflex from '@/components/mini/editflex'
import edittext from '@/components/mini/edittext'
import messimgtext from '@/components/dialog/messimgtext'

export default {
  name:'diacarousel',
  components:{messimgtext,upbtn,editflex,edittext},
  data:()=>({
    show:false,obj:{},test:'',
  }),
  created(){},
  methods: {
    showd(obj){
      this.obj = Object.assign({},{},JSON.parse(JSON.stringify(obj)))
      this.obj.type = 'carousel'
      this.obj.value = 1
      this.obj.height = this.obj.height?this.obj.height:'auto'
      this.obj.width = this.obj.width?this.obj.width:'100%'
      this.obj.contain = this.obj.contain?this.obj.contain:0
      this.obj.isthumbnail = this.obj.isthumbnail?this.obj.isthumbnail:0
      this.obj.count = this.obj.count?this.obj.count:0
      this.obj.navigation = this.obj.navigation?this.obj.navigation:0
      this.obj.arrows = this.obj.arrows?this.obj.arrows:0
      this.obj.thumbnails = this.obj.thumbnails?this.obj.thumbnails:0
      this.obj.infinite = this.obj.infinite?this.obj.infinite:0
      this.obj.autoplay = this.obj.autoplay?this.obj.autoplay:0
      this.obj.content = this.obj.content?this.obj.content:[]
      this.show = true
    },
    reflesh(){
      this.obj = Object.assign({},{},this.obj)
      this.$emit('refleshcol',this.obj)
    },
    refleshcontent(content){
      this.obj.content = Object.assign([],[],content)
      this.reflesh()
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