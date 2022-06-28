<style scoped>
.inwidth{width:900px;margin:0 auto;background-color:#fff}

#faceimg{width:960px;height:500px;margin-bottom:10px;position:relative;left:-50px;}
.intext{height:25px;line-height:25px;padding:0 5px;font-size:12px;opacity:0.8}
#title{font-size:30px;padding:10px 0;font-weight:bold;}
#intro_art2{font-size:12px;opacity:0.8}
#content{padding:10px 0;}
#func{padding:1px 0px;box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000;text-align:center;}
#func>*{margin-right:10px;}
</style> 
<template><div style="width:100%;background-color:#F8F8F8;padding:20px 0px;">
    
    <div class="inwidth" style="padding:20px;">
        <div style="text-align:center;padding-bottom:20px;">
            <q-breadcrumbs active-color="red-10" align="center">
                <q-breadcrumbs-el label="首页" />
                <q-breadcrumbs-el :label="$store.state.breakcrumb.fa" v-if="$store.state.breakcrumb.fa"/>
                <q-breadcrumbs-el :label="$store.state.breakcrumb.ch" v-if="$store.state.breakcrumb.ch"/>
            </q-breadcrumbs>
            <div id="title">{{content.article.title}}</div>
            <div id="intro_art2">{{getLocalTime(content.article.createdate)}} {{content.article.source}}</div>
        </div>
        <q-img v-if="content.article.faceimg" :src="content.article.faceimg" id="faceimg" class="shadow-3">
            <div class="absolute-bottom-right intext">
                {{content.article.faceintro}}
            </div>
        </q-img>
        <div id="func">
            <q-btn dense flat round color="red-10" icon="headset"  @click="$store.commit('audio_show')"><q-tooltip>
                    听文章
                </q-tooltip></q-btn>
            <q-btn dense flat round color="red-10" @click="$emit('autoRead')"><q-tooltip>
                    自动滚动
                </q-tooltip>
                <div style="padding:0px;font-size:12px">auto</div>
            </q-btn>
            <q-btn dense flat round color="red-10" :icon="$store.state.articleconfig.fontsize==16?'format_size':'text_fields'" @click="$store.commit('articleFontsize')"><q-tooltip>
                    调整字体大小
                </q-tooltip> </q-btn>
            <q-btn dense flat round color ="red-10" :icon="$store.state.articleconfig.islove?'favorite':'favorite_border'" @click="$store.commit('articleIslove')"><q-tooltip>
                    添加至 “我的收藏”
                </q-tooltip>   </q-btn>
        </div>
        <div id="content" v-html="content.article.content" :style="{'font-size':$store.state.articleconfig.fontsize+'px'}"></div>
    </div>
</div></template>
<script>
import tm2 from '@/components/displaystyle/TM2';
import cl2 from '@/components/displaystyle/ContentList2';
export default{
    name:'article3',
    components:{
        tm2,cl2
    },
    props:['content'],
    data:()=>({}),
    mounted(){

    },
    methods:{
        
    }
}
</script>
