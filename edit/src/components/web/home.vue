<style scoped>
#dailynews1{height:430px;overflow:hidden;}
#dailynews1>div{height:100%;}
.title2{font-size:16px;margin-bottom:8px}

#backimg{width:100%;min-width:1100px;position:absolute;z-index:-1;top:0;left:0;}
#importtopic{cursor:pointer;display:block;background-color:transparent;padding:0;position:relative;-z-index:1}
.closeimporttopic{height:0;overflow:visible;width:1100px;margin:0 auto;text-align:right;position:relative;top:50px;}

.fullwidth-fade-enter-active,.fullwidth-fade-leave-active{
    transition:width 1s,opacity 0.3s;
}
.fullwidth-fade-enter, .fullwidth-fade-leave-to{
    width:0;opacity:0;
}
.fullwidth-fade-enter-to, .fullwidth-fade-leave{
    width:1100px;opacity:1;
}

.cc{cursor:pointer;}
.cc:hover{background-color:#fff;filter:brightness(0.3);}
</style>
<style src="./common.css" scoped></style>
<template><div v-if="show">
    <q-layout class="bg-white" style="position:relative;z-index:1"><q-page-container><q-page>
        <div v-if="parseInt(content.m1.valid)=='1'">
            <transition name="fade">
                <img id="backimg" v-if="parseInt(content.m1.valid)=='1'" :src="content.m1.backimg"/>
            </transition>
            <transition name="fullwidth-fade">
                <img v-if="parseInt(content.m1.valid)=='1'" :src="content.m1.faceimg" id="importtopic" class="widthlim cc" @click="$refs.me1.showd(1,content.m1)"/>
            </transition>
        </div>
        <header1 :shrink="parseInt(content.m1.valid)=='1'" :data="nav"></header1>
        <div class="widthlim" style="overflow:hidden;">
            <!-- 今日热点 -->
        	<div id="dailynews1" class="row">
        		<div class="col-8 q-pa-md cc" @click="$refs.ite.showd(2,content.m2,0,6,1)">
        			<car1 :record="content.m2"></car1>
        		</div>
        		<div class="col-4 q-py-md q-pl-sm q-pr-md cc" @click="$refs.ite.showd(3,content.m3,0,12)">
                    <tb2 :content="content.m3"></tb2>
        		</div>
        	</div>
            <!-- 横幅专题1 -->
        	<div id="banner1" class="q-pa-md cc" v-if="parseInt(content.m4.valid)=='1'" @click="$refs.me1.showd(4,content.m4,0)">
                <q-img :src="content.m4.faceimg" :url="content.m4.url" style="height:80px" class="full-width canclick"/>
            </div>
            <!-- 人事任免 时事评论 专题 锐视角 -->
            <div id="block1" class="row">
                <div class="col-8">
                    <div class="row">
                        <div class="col-6 q-pa-md cc" @click="$refs.ite.showd(5,content.m5,4,6)">
                            <tm1 title1="人事" title2="任免" twidth="30%" lwidth="70%"></tm1>
                            <tb1 :content="content.m5"></tb1>
                        </div>
                        <div class="col-6 q-pa-md cc" @click="$refs.ite.showd(6,content.m6,3,6)">
                            <tm1 title1="时事" title2="评论" twidth="30%" lwidth="70%"></tm1>
                            <tb1 :content="content.m6"></tb1>
                        </div>
                    </div>
                    <div class="q-px-md q-py-sm cc" @click="$refs.ite.showd(7,content.m7,0,4,0,0,1)">
                        <itb2 :record="content.m7"></itb2>
                    </div>
                </div>
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(8,content.m8,0,4,0,1)">
                    <div class="bg-grey-3">
                        <tm2 img="/static/rsj.png" url="/"></tm2>
                        <itb1 :content="content.m8"></itb1>
                    </div>
                </div>
            </div>
            <!-- 横幅专题2 -->
            <div id="banner2" class="q-pa-md cc" v-if="parseInt(content.m9.valid)=='1'" @click="$refs.me1.showd(9,content.m9)">
                <q-parallax :height="80" :speed="0.5" class="full-width canclick">
                    <template v-slot:media>
                        <img :src="content.m9.backimg">
                    </template>
                    <q-img :src="content.m9.faceimg" style="height:60px;" contain/>
                </q-parallax>
            </div>
            <!-- 新闻阵列 -->
            <div class="row">
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(10,content.m10,0,6)">
                    <itb4 :record="content.m10" head="党建" :limit="6"></itb4>
                </div>
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(11,content.m11,0,6)">
                    <itb4 :record="content.m11" head="社会" :limit="6"></itb4>
                </div>
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(12,content.m12,0,6)">
                    <itb4 :record="content.m12" head="廉政" :limit="6"></itb4>
                </div>
            </div>
            <div class="row">
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(13,content.m13,0,6)">
                    <itb4 :record="content.m13" head="理论" :limit="6"></itb4>
                </div>
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(14,content.m14,0,6)">
                    <itb4 :record="content.m14" head="视野" :limit="6"></itb4>
                </div>
                <div class="col-4 q-pa-md cc" @click="$refs.ite.showd(15,content.m15,0,6)">
                    <itb4 :record="content.m15" head="人物" :limit="6"></itb4>
                </div>
            </div>
            <!-- 杂志板块 -->
            <div class="q-pb-md q-mb-md bg-grey-2">
                <tm3 title="杂志"></tm3>
                <div class="cc" @click="$refs.ite.showd(16,content.m16,0,24,0,0,1)">
                    <car2 class="q-pl-md" :record="content.m16"></car2>
                </div>
                <div class="row q-pl-md cc" style="height:232px;" @click="$refs.ite.showd(17,content.m17,0,8,1,0,0)">
                    <div class="col-4 q-pr-md">
                        <q-img style="height:232px;cursor:pointer;" :src="content.m17[0].img">
                            <div class="absolute-bottom text-subtitle1 ">
                                {{content.m17[0].title}}
                                <div style="position:absolute;right:3px;bottom:-3px;font-size:12px" class="text-grey-4">{{content.m17[0].zz}}</div>
                            </div>
                        </q-img>
                    </div>
                    <div class="col-4 q-pr-md">
                        <q-item clickable v-ripple class="bg-white q-mb-sm" v-for="(item,index) in content.m17" v-if="index>0&&index<4">
                            <q-item-section thumbnail style="margin-left:0">
                                <img :src="item.img">
                            </q-item-section>
                            <q-item-section>
                                <q-item-label>{{item.title}}</q-item-label>
                                <q-item-label caption lines="1">{{item.zz}}</q-item-label>
                            </q-item-section>
                        </q-item>
                    </div>
                    <div class="col-4 q-pr-md">
                        <q-item clickable v-ripple class="bg-white" style="height:58px" v-for="(item,index) in content.m17" v-if="index>=4">
                            <q-item-section>
                                <q-item-label>{{item.title}}</q-item-label>
                                <q-item-label class="text-right" caption lines="1">{{item.zz}}</q-item-label>
                            </q-item-section>
                        </q-item>
                    </div>
                </div>
            </div>
            <!-- 更多专题 -->
            <div class="row q-pl-md q-mb-md cc" style="height:70px;" @click="$refs.ite.showd(18,content.m18,0,3,0,0,1)">
                <div class="col-3 q-pr-md" v-for="item in content.m18">
                    <q-img class="full-height canclick" :src="item.img"/>
                </div>
                <div class="col-3 q-pr-md">
                    <div class="bg-red-10 full-height text-center" style="cursor:pointer;font-size:18px;font-weight:bold;color:#fff;height:70px;line-height:70px">
                        <q-icon size="26px" name="library_books"></q-icon> 更多专题
                    </div>
                </div>
            </div>
        </div>
        <q-page-scroller position="bottom-right" :scroll-offset="150" :offset="[18, 18]">
            <q-btn icon="keyboard_arrow_up" color="red-10"/>
        </q-page-scroller>
        <q-page-sticky position="bottom-right" :offset="[18, 18]">
            <q-card class="q-px-md q-py-sm row">
                <q-btn color="grey-6" label="顶部大专题" @click="$refs.me1.showd(1,content.m1)"/>
                <q-btn color="grey-6" class="q-ml-sm" label="横幅专题1" @click="$refs.me1.showd(4,content.m4,0)"/>
                <q-btn color="grey-6" class="q-ml-sm" label="横幅专题2" @click="$refs.me1.showd(9,content.m9)"/>
                <q-separator vertical class="q-mx-sm"/>
                <q-btn color="grey-5" label="重置" class="q-mr-sm" icon="cached" @click="content = JSON.parse(JSON.stringify(server))"/>
                <q-btn color="red-10" label="保存" class="q-px-lg" icon="save" @click="saveHome"/>
            </q-card>
            
        </q-page-sticky>
    </q-page></q-page-container></q-layout>
    <me1 ref="me1" @changeContent="changeContent"></me1>
    <ite ref="ite" @changeContent="changeContent"></ite>
</div></template>
<script>
import tm1 from './mod/TM1'
import tm2 from './mod/TM2'
import tm3 from './mod/tm3'
import header1 from './mod/header1'
import tb1 from './mod/tb1'
import tb2 from './mod/tb2'
import itb1 from './mod/itb1'
import itb2 from './mod/itb2'
import itb4 from './mod/itb4'
import car1 from './mod/car1'
import car2 from './mod/car2'

import me1 from './dialog/toptopic'
import ite from './dialog/imgtext'

export default {
  name: 'home',
  components: {tm1,tm2,tm3,header1,tb1,tb2,itb1,itb2,itb4,car1,car2,
    me1,ite},
  data:()=>({
    nav:[],
    slide:1,show:false,caro:1,
    content:{},
    server:{},
  }),
  mounted(){
    this.getNav()
    this.getData()
  },
  methods:{
    getData(){
        this.$q.loading.show()
        this.axios.post('page',{pid:1}).then(response=>{
            this.content = Object.assign(response.content)
            this.server = JSON.parse(JSON.stringify(response.content))
            this.show = true
            this.$q.loading.hide()
        }).catch(err=>{
            this.$q.loading.hide()
        })
    },
    getNav(){
        this.axios.post('nav').then(response=>{
            this.nav = Object.assign([],[],response)
        })
    },
    saveHome(){
        this.$q.loading.show()
        this.axios.post('savePage',{pid:1,title:'首页',content:this.content,isheader:1,isfooter:1}).then(response=>{
            this.$q.loading.hide()
        }).catch(err=>{
            this.$q.loading.hide()
        })
    },
    changeContent(mid,data){
        this.$set(this.content,'m'+mid,data)
    }
  }
}
</script>