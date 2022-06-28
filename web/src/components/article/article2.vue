<style scoped>
#faceimg_art2{width:100%;height:450px;margin-bottom:10px;}
.intext_art2{text-align:left;background-color:transparent!important;}
#colname_art2{font-family:'黑体';border-radius:0!important}
.intext{height:25px;line-height:25px;padding:0 5px;font-size:12px;opacity:0.8}
#title_art2{font-weight:bold;font-size:28px;text-shadow:1px 1px 1px #000;margin-bottom:10px;}
#intro_art2{font-size:12px;opacity:0.8}
#content{padding:10px 0;}
#func{padding:5px 0px;box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000}
#func>*{margin-right:10px;}
</style> 
<template><div style="width:100%;background-color:#F8F8F8;padding-bottom:20px;">
    <q-breadcrumbs active-color="red-10" style="background-color:transparent;padding:10px 0;opacity:0.7;width:950px;margin:0 auto">
        <q-breadcrumbs-el label="首页" />
        <q-breadcrumbs-el :label="$store.state.breakcrumb.fa" v-if="$store.state.breakcrumb.fa"/>
        <q-breadcrumbs-el :label="$store.state.breakcrumb.ch" v-if="$store.state.breakcrumb.ch"/>
    </q-breadcrumbs>
    <div style="padding:20px;width:950px;margin:0 auto;background:#fff">
        <q-img :src="content.article.faceimg" id="faceimg_art2" >
            <div class="absolute-bottom-right intext">
                {{content.article.faceintro}}
            </div>
            <div class="absolute-bottom intext_art2">
                <q-chip id="colname_art2" square dense color="red-10" text-color="white">{{$store.state.breakcrumb.ch}}</q-chip>
                <div id="title_art2">{{content.article.title}}</div>
                <div id="intro_art2">{{getLocalTime(content.article.createdate)}} {{content.article.source}}</div>
            </div>
        </q-img>
        <div id="func">
            <q-btn dense flat round color="red-10" icon="headset"  @click="$store.commit('audio_show')">
                <q-tooltip>
                    听文章
                </q-tooltip>
            </q-btn>
            <q-btn dense flat round color="red-10" @click="$emit('autoRead')">
                <q-tooltip>
                    自动滚动
                </q-tooltip>
                <div style="padding:0px;font-size:12px">auto</div>
            </q-btn>
            <q-btn dense flat round color="red-10" :icon="$store.state.articleconfig.fontsize==16?'format_size':'text_fields'" @click="$store.commit('articleFontsize')">
                <q-tooltip>
                    调整字体大小
                </q-tooltip>
            </q-btn>
            <q-btn dense flat round color ="red-10" :icon="$store.state.articleconfig.islove?'favorite':'favorite_border'" @click="$store.commit('articleIslove')">
                <q-tooltip>
                    添加至 “我的收藏”
                </q-tooltip>   
            </q-btn>
        </div>
        <div id="content" v-html="content.article.content" :style="{'font-size':$store.state.articleconfig.fontsize+'px'}"></div>
    </div>
</div></template>
<script>
import tm2 from '@/components/displaystyle/TM2';
import cl2 from '@/components/displaystyle/ContentList2';
export default{
	name:'article2',
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
