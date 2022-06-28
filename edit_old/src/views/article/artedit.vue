<style scoped>
.colB{font-size:16px;font-weight:bold;}
.rightmain{min-width:850px;width:calc(100% - 400px);height:100%;}
.insetshadow{box-shadow:inset 2px -2px 2px #E0E0E0,inset 2px 2px 2px #E0E0E0;}
.panelright{width:325px;}
.uploadimg{position:relative;transition:box-shadow 0.5s;cursor:pointer;width:100%;}
.uploadimg:hover{box-shadow:1px 5px 5px #E0E0E0,-1px -1px 5px #E0E0E0;}
.edui-editor-toolbarboxouter{background:#fff!important;}
.styleselectitem{width:300px;}
.gnl{box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000;}
.firs{font-size:16px;font-weight:bold}
</style>
<template>
<div class="row bg-grey-4 full-height" style="overflow:hidden;" v-if="show">
  <q-card class="shadow-2 bg-grey-2 row" style="width:400px;height:100%;">

    <q-tabs v-model="pagecontrol.editormode" vertical switch-indicator class="bg-white nosshadow" active-bg-color="grey-2" active-color="red-8" style="width:75px">
      <q-tab :ripple="false" :class="{insetshadow:pagecontrol.editormode=='素材'}" name="素材" icon="image" label="素材"/>
      <q-tab :ripple="false" :class="{insetshadow:pagecontrol.editormode=='音频'}" name="音频" icon="headset" label="音频"/>
      <q-tab :ripple="false" :class="{insetshadow:pagecontrol.editormode=='校对'}" name="校对" icon="edit" label="校对" />
      <q-tab :ripple="false" :class="{insetshadow:pagecontrol.editormode=='发布'}" name="发布" icon="send" label="发布" />
    </q-tabs>

    <q-tab-panels v-model="pagecontrol.editormode" class="q-px-md bg-grey-2 full-height"  style="width:325px;" keep-alive>
      <q-tab-panel name="素材" class="noscrollstyle text-center full-height" style="overflow-y:auto;">
        <div class="row justify-center">
          <UploadCom style="width:120px" @change="uploadimgs"></UploadCom>
          <div style="width:10px"></div>
          <q-btn icon="video_call" color="brown-5" style="width:120px" dense label="插入视频" @click="$refs.insertIframe.myshow()"/>
        </div>
        <div class="q-py-md row">
          <div class="col-6 q-pa-sm" v-for="item in uploadarr"><img :src="item" class="uploadimg" @click="insertEditor(item)"/></div>
        </div>
      </q-tab-panel>
      <q-tab-panel name="音频">
        <q-btn dense label="文字转化音频" color="teal" class="full-width q-mb-md" @click="textToAudio" :loading="check.loading"/>
        <div v-if="!data.audio" class="text-center">暂无音频</div>

        <q-item v-if="data.audio" clickable v-ripple class="bg-white shadow-1 q-pa-none" @click="playAudio">
          <q-item-section slide>
            <q-img :src="data.faceimg" :ratio="16/9">
              <div class="absolute-full text-subtitle1 text-center" style="background:transparent;">
                <q-icon name="play_circle_outline" color="white" size="35px"/>
              </div>
            </q-img>
          </q-item-section>
          <q-item-section class="q-px-sm" style="overflow:hidden;width:135px;height:67px"><div class="q-my-sm" style="overflow:hidden;">{{data.title?data.title:'暂无标题'}}</div></q-item-section>
        </q-item>

        <q-item clickable v-ripple dense v-if="data.audio">
          <q-item-section>
            <div class="full-width">启用音频</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-toggle v-model="pagecontrol.audiovalid" color="green"/></div>
          </q-item-section>
        </q-item>
      </q-tab-panel>
      <q-tab-panel name="校对">
        <q-btn dense label="提交AI审核" color="teal" class="full-width" @click="submitBaiduCheck" :loading="check.loading"/>
        <checkinfo :textcensor='data.check.textcensor' :ecnet='data.check.ecnet'></checkinfo>
      </q-tab-panel>
      <q-tab-panel name="发布" class="column">
        <div class="col-11">
          <q-img class="full-width" style="cursor:pointer;border-radius:3px;" :src="data.faceimg?data.faceimg:'/static/sys/faceimgback.png'" @click="openFaceimgSelect">
            <div class="text-caption text-center">
              封面
            </div>
          </q-img>
          <q-input standout="bg-grey-6 text-white" autogrow dense color="red-10" v-model="data.faceintro" class="q-mb-md" label="封面简介"/>

          <q-input standout="bg-grey-6 text-white" autogrow dense color="red-10" v-model="data.title" class="q-mb-md">
            <template v-slot:prepend>
              <span style="font-size:15px">标题｜</span>
            </template>
          </q-input>
          <q-select standout="bg-grey-6 text-white" dense v-model="data.source" :options="$store.state.system.sourcewl" class="q-mb-md" color="red-10">
            <template v-slot:prepend>
              <span style="font-size:15px">来源｜</span>
            </template>
          </q-select>
          <!--栏目选择-->
          <q-input standout="bg-grey-6 text-white" dense class="q-mb-md" color="red-10" v-model="$store.state.system.cols[data.col].col">
            <template v-slot:prepend>
              <span style="font-size:15px">栏目｜</span>
            </template>
            <q-popup-proxy style="width:250px">
                <q-tree dense style="width:250px"
                  :nodes="cols"
                  :selected.sync="test"
                  default-expand-all
                  node-key="cid"
                  label-key="col"
                >
                  <template v-slot:default-header="prop">
                    <q-item dense :disable="!prop.node.sub" class="full-width" clickable @click="data.col = prop.node.cid">
                      <q-item-section>
                        {{ prop.node.col }}
                      </q-item-section>
                    </q-item>
                  </template>
                </q-tree>
            </q-popup-proxy>
          </q-input>
          <q-input standout="bg-grey-6 text-white" dense color="red-10" v-model="data.editor" class="q-mb-md" readonly>
            <template v-slot:prepend>
              <span style="font-size:15px">编辑｜</span>
            </template>
          </q-input>
          <q-input filled dense v-model="data.createdate" mask="date" :rules="['date']" color="red-10">
            <template v-slot:prepend>
              <q-icon name="access_time" size="18px"/>
            </template>
            <q-popup-proxy ref="qDateProxy" transition-show="scale" transition-hide="scale">
              <q-date color="red-10" minimal :locale="myLocale" v-model="data.createdate" @input="() => $refs.qDateProxy.hide()" style="width:300px;"/>
            </q-popup-proxy>
          </q-input>
          <q-btn dense :label="'文章样式 '+data.style" color="teal-4" class="full-width" @click="openStyleSelect"/>
          <q-item clickable v-ripple dense class="q-mt-sm">
            <q-item-section>
              <div class="full-width">手机端同步</div>
            </q-item-section>
            <q-item-section slide>
              <div class="text-right"><q-toggle v-model="data.isphone" color="green" :false-value="0" :true-value="1"/></div>
            </q-item-section>
          </q-item>
          <q-item clickable v-ripple dense class="q-mt-sm">
            <q-item-section>
              <div class="full-width">微信小程序同步</div>
            </q-item-section>
            <q-item-section slide>
              <div class="text-right"><q-toggle v-model="data.isweixin" color="teal" :false-value="0" :true-value="1"/></div>
            </q-item-section>
          </q-item>
        </div>
        <div class="col-1 row items-end" v-if="data.aid>0">
          <q-btn dense class="full-width" color="grey-6" label="保存至草稿箱" @click="saveArticle(0)"/>
          <q-btn dense class="full-width q-mt-sm" color="brown-5" label="保存并提交审核" @click="saveArticle(1)"/>
        </div>
        <div class="col-1 row items-end" v-if="data.aid==0">
          <q-btn dense class="full-width" color="grey-6" label="新增至草稿箱" @click="addArticle(0)"/>
          <q-btn dense class="full-width q-mt-sm" color="brown-5" label="保存并提交审核" @click="addArticle(1)"/>
        </div>
      </q-tab-panel>
    </q-tab-panels>
  </q-card>
  <div class="rightmain row justify-center items-center text-center">
    <VueUeditorWrap 
      :config="UEeditor"
      class="shadow-2 text-left" 
      style="width:800px;border:0px"
      v-model="data.content"
      @ready="geteditor"
    ></VueUeditorWrap>
  </div>
  <insertIframe ref="insertIframe" @inIframe="inIframe"></insertIframe>

  <!-- 样式选择弹窗 -->
  <q-dialog v-model="pagecontrol.styleselect" class="row justify-center">
    <q-item clickable v-ripple class="q-pa-none">
      <q-img src="static/sys/style1.png" contain class="styleselectitem" :style="{width:data.style===1?'400px':'300px'}" @click="selectArticleStyle(1)"/>
    </q-item>
    <q-item clickable v-ripple class="q-pa-none q-ml-md">
      <q-img src="static/sys/style2.png" contain class="styleselectitem" :style="{width:data.style===2?'400px':'300px'}" @click="selectArticleStyle(2)"/>
    </q-item>
    <q-item clickable v-ripple class="q-pa-none q-ml-md">
      <q-img src="static/sys/style3.png" contain class="styleselectitem" :style="{width:data.style===3?'400px':'300px'}" @click="selectArticleStyle(3)"/>
    </q-item>
  </q-dialog>
  <!-- 封面选择弹窗 -->
  <q-dialog v-model="pagecontrol.faceimgselect" class="row justify-center">
    <q-item clickable v-ripple class="q-pa-none q-mr-md" v-for="item in uploadarr" @click="selectFaceimg(item)">
      <q-img :src="item" contain class="styleselectitem"/>
    </q-item>
    <div v-if="uploadarr.length<=0" class="q-pa-md bg-white">暂无图片，请至‘素材’上传图片</div>
  </q-dialog>
</div>
</template>
<script>
import VueUeditorWrap from 'vue-ueditor-wrap'
import UploadCom from '@/components/UploadCom'
import insertIframe from '@/components/dialog/insertIframe'
import VueAplayer from 'vue-aplayer'
import checkinfo from '@/components/checkinfo'

export default{
  name:'artedit',
  props:['aid'],
  components:{UploadCom,VueUeditorWrap,insertIframe,VueAplayer,checkinfo},
  data:()=>({
    show:false,
    check:{loading:false},
    pagecontrol:{editormode:'素材',imgmode:'本文图片',audio:false,audiovalid:true,styleselect:false,faceimgselect:false},
    ueeditor:'',
    UEeditor:{
      autoHeightEnabled: false,
      initialFrameHeight:0,
      serverUrl: '',
      toolbars: [['source','|','undo','redo','|','fontsize','fontfamily','forecolor', 'backcolor','bold','italic','underline','|','removeformat','formatmatch','paragraph','lineheight','|','justifyleft','justifycenter','justifyright','justifyjustify','|','indent']],
    },
    uploadarr:[],
    data:{aid:0,editor:'',source:'四川党建网',title:'',createdate:'',col:2,faceimg:'',faceintro:'',content:'',audio:'',style:1,isphone:1,isweixin:1,status:0,check:{textcensor:[],ecnet:[]}},
    myLocale:{
      days:'周一_周二_周三_周四_周五_周六_周日'.split('_'),
      daysShort: '周一_周二_周三_周四_周五_周六_周日'.split('_'),
      months: '1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月'.split('_'),
      monthsShort: '1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月'.split('_'),
    },
    cols:[],test:0,
  }),
  created(){

  },
  mounted(){
    this.$q.loading.show({
      message: '文章数据加载中'
    })
    this.setEditorHeight()
    this.geteditor()
    this.aid==0?this.setNewArtData():this.getArticle()
    this.setLocalCols()
  },
  methods:{
    setLocalCols(){
      this.cols = JSON.parse(JSON.stringify(this.$store.state.system.webcols))
    },
    setColexpanded(){
      
    },
    geteditor(ueditorself){
      this.ueeditor = ueditorself
    },
    setEditorHeight(){
      let height = document.body.clientHeight
      this.UEeditor.initialFrameHeight = height-160;
    },
    getArticle(){
      this.axios.post('getArticle',{aid:this.aid}).then(response=>{
        if(response.status!==0){
          this.$q.loading.hide()
          this.AItip('文章未处于草稿箱中，无法编辑')
          this.$router.replace('/artmessage')
          return
        }
        this.data = Object.assign({},response)
        this.pagecontrol.editormode = '发布'
        this.show = true
        this.$q.loading.hide()
      })
    },
    setNewArtData(){
      let now = (new Date()).getTime()/1000;
      this.data.createdate = this.getLocalTime(now)
      this.data.editor = this.$store.state.user.nickname
      this.show = true
      this.$q.loading.hide()
    },
    uploadimgs(imgs){
      console.log(imgs)
      for(let item in imgs){
        this.uploadarr.push(imgs[item])
      }
    },
    insertEditor(img){
      this.ueeditor.execCommand('inserthtml','<p style="width:100%;text-align:center"><img style="max-width:100%;" src="'+img+'"/></p>')
    },
    inIframe(code){
      this.ueeditor.execCommand('inserthtml',code)
    },
    submitBaiduCheck(){
      if(!this.data.content){
        this.AItip('无文字')
        return
      }
      this.$q.loading.show({
        message: 'AI审核中,请耐心等待<br>AI审核可准确性有待提升,结果仅仅作为参考'
      })
      this.axios.post('textCensor',{content:this.data.content}).then(response=>{console.log(response)
        this.data.check = Object.assign({},{},{textcensor:response.textcensor,ecnet:response.ecnet})
        this.$q.loading.hide()
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    textToAudio(){
      if(!this.data.content){
        this.AItip('无文字')
        return
      }
      this.$q.loading.show({
        message: 'AI生成中,请耐心等待'
      })
      this.axios.post('textToAudio',{content:this.data.content}).then(response=>{
        this.data.audio = response
        this.$q.loading.hide()
      }).then(err=>{
        this.$q.loading.hide()
      })
    },
    openStyleSelect(){
      this.pagecontrol.styleselect = true
    },
    selectArticleStyle(arg){
      this.data.style = arg
      this.pagecontrol.styleselect = false
    },
    openFaceimgSelect(){
      this.pagecontrol.faceimgselect = true
    },
    selectFaceimg(img){
      this.data.faceimg = img
      this.pagecontrol.faceimgselect = false
    },
    juageData(){
      if(!(this.data.title&&this.data.source&&this.data.col&&this.data.editor&&this.data.createdate&&this.data.style&&this.data.content)){
        this.AItip('输入框不能为空')
        return false
      }else{
        return true
      }
    },
    saveArticle(status){
      if(!this.juageData()){
        return
      }
      this.data.status = status
      this.$q.loading.show({
        message: '文章保存中'
      })
      this.axios.post('saveArticle',{article:this.data,check:this.check}).then(response=>{
        this.AItip('文章保存成功')
        this.$router.push('/artmessage')
        this.$q.loading.hide()
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    addArticle(status){
      if(!this.juageData()){
        return
      }
      this.data.status = status
      this.$q.loading.show({
        message: '文章保存中'
      })
      let subjson = Object.assign({},this.data)
      subjson.createdate = this.timeDate(this.data.createdate)
      this.axios.post('addArticle',{article:subjson}).then(response=>{
        this.AItip('文章新增成功')
        this.$q.loading.hide()
        this.$router.push('/artmessage')
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    playAudio(){
      this.$store.commit('playAudio',{audio:this.data.audio,img:this.data.faceimg,title:this.data.title})
    }
  },
  watch:{

  }
}
</script>
