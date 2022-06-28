<style scoped>
#dailynews1{height:430px;overflow:hidden;}
#dailynews1>div{height:100%;}
.title2{font-size:16px;margin-bottom:8px}
</style>
<template><q-layout v-if="show"><q-page-container><q-page>
    <toptopic :content="content.m1" @close="content.m1.show=0" @open="content.m1.show=1"></toptopic>
    <header1 :shrink="parseInt(content.m1.show)"></header1>
    <div class="widthlim" style="overflow:hidden;">
        <!-- 今日热点 -->
    	<div id="dailynews1" class="row">
    		<div class="col-8 q-pa-md">
    			<car1 :record="content.m2"></car1>
    		</div>
    		<div class="col-4 q-py-md q-pl-sm q-pr-md">
                <tb2 :content="content.m3"></tb2>
    		</div>
    	</div>
        <!-- 横幅专题1 -->
    	<div id="banner1" class="q-pa-md" v-if="parseInt(content.m4.valid)">
                <q-img :src="content.m4.faceimg" style="height:80px" class="full-width canclick" @click="gourl(content.m4.url)"/>
            </div>
        <!-- 人事任免 时事评论 专题 锐视角 -->
        <div id="block1" class="row">
            <div class="col-8">
                <div class="row">
                    <div class="col-6 q-pa-md">
                        <tm1 title1="人事" title2="任免" twidth="30%" lwidth="70%"></tm1>
                        <tb1 :content="content.m5"></tb1>
                    </div>
                    <div class="col-6 q-pa-md">
                        <tm1 title1="时事" title2="评论" twidth="30%" lwidth="70%"></tm1>
                        <tb1 :content="content.m6"></tb1>
                    </div>
                </div>
                <div class="q-px-md q-py-sm">
                    <itb2 :record="content.m7"></itb2>
                </div>
            </div>
            <div class="col-4 q-pa-md">
                <div class="bg-grey-3">
                    <tm2 img="/static/rsj.png" url="/"></tm2>
                    <itb1 :content="content.m8"></itb1>
                </div>
            </div>
        </div>
        <!-- 横幅专题2 -->
        <div id="banner2" class="q-pa-md" v-if="parseInt(content.m9.valid)">
            <q-parallax :height="80" :speed="0.5" class="full-width canclick" @click="gourl(content.m9.url)">
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
            <car2 class="q-pl-md" :record="content.m16"></car2>
            <div class="row q-pl-md" style="height:232px;">
                <div class="col-4 q-pr-md">
                    <q-img style="height:232px;cursor:pointer;" :src="content.m17[0].img" @click="gourl(content.m17[0].url)">
                        <div class="absolute-bottom text-subtitle1 ">
                            {{content.m17[0].title}}
                            <div style="position:absolute;right:3px;bottom:-3px;font-size:12px" class="text-grey-4">{{content.m17[0].zz}}</div>
                        </div>
                    </q-img>
                </div>
                <div class="col-4 q-pr-md">
                    <q-item clickable v-ripple class="bg-white q-mb-sm" v-for="(item,index) in content.m17" v-if="index>0&&index<4" @click="gourl(item.url)">
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
                    <q-item clickable v-ripple class="bg-white" style="height:58px" v-for="(item,index) in content.m17" v-if="index>=4" @click="gourl(item.url)">
                        <q-item-section>
                            <q-item-label>{{item.title}}</q-item-label>
                            <q-item-label class="text-right" caption lines="1">{{item.zz}}</q-item-label>
                        </q-item-section>
                    </q-item>
                </div>
            </div>
        </div>
        <!-- 更多专题 -->
        <div class="row q-pl-md q-mb-md" style="height:70px;">
            <div class="col-3 q-pr-md" v-for="item in content.m18">
                <q-img class="full-height canclick" :src="item.img" @click="gourl(item.url)"/>
            </div>
            <div class="col-3 q-pr-md">
                <div class="bg-red-10 full-height text-center" style="cursor:pointer;font-size:18px;font-weight:bold;color:#fff;height:70px;line-height:70px" @click="gourl('/topics')">
                    <q-icon size="26px" name="library_books"></q-icon> 更多专题
                </div>
            </div>
        </div>
    </div>
    <footer1></footer1>
    <q-page-scroller position="bottom-right" :scroll-offset="150" :offset="[18, 18]">
        <q-btn icon="keyboard_arrow_up" color="red-10"/>
    </q-page-scroller>
</q-page></q-page-container></q-layout></template>
<script>
import tm1 from '@/components/displaystyle/TM1'
import tm2 from '@/components/displaystyle/TM2'
import tm3 from '@/components/displaystyle/tm3'
import toptopic from '@/components/displaystyle/toptopic'
import header1 from '@/components/header/header1'
import tb1 from '@/components/displaystyle/tb1'
import tb2 from '@/components/displaystyle/tb2'
import itb1 from '@/components/displaystyle/itb1'
import itb2 from '@/components/displaystyle/itb2'
import itb4 from '@/components/displaystyle/itb4'
import car1 from '@/components/displaystyle/car1'
import car2 from '@/components/displaystyle/car2'

export default {
  name: 'home',
  components: {tm1,tm2,tm3,toptopic,header1,tb1,tb2,itb1,itb2,itb4,car1,car2},
  data:()=>({
    slide:1,show:false,caro:1,
    content:{},
  }),
  mounted(){
    this.getData()
  },
  methods:{
    getData(){
        this.axios.get('home').then(response=>{
            this.content = Object.assign(response)
            this.show = true
        })
    }
  }
}
</script>