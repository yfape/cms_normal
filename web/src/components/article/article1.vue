<style scoped>
.title{font-size:36px;margin-bottom:10px;font-weight:bold;}
.datetext{font-size:20px;text-align:center;font-family:'黑体';width:80%;margin:0 auto;margin-bottom:10px;}
.lines{box-shadow:0px 0.3px 0.3px #000;}
.source{font-size:14px;text-align:center;font-family:'黑体';}
.leftsty{width:100%;border-right:3px solid #B71C1C;background-color:#EAEAEA;padding:3px;margin-bottom:10px;}
.mybtn{height:45px;line-height:45px;text-align:center;position:relative;}
#intro{height:45px;line-height:45px;margin:20px 0;box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000;}
#intro>#ys{float:left;}
#intro>#func{float:right;}
.art3{background-color:#F7F8F9;padding-bottom:10px;width:100%;margin-bottom:20px;}
</style>
<template><div style="padding:20px 0;">
    <q-breadcrumbs class="widthlim" active-color="red-10" style="margin-bottom:10px;">
        <q-breadcrumbs-el label="首页" />
        <q-breadcrumbs-el :label="$store.state.breakcrumb.fa" v-if="$store.state.breakcrumb.fa"/>
        <q-breadcrumbs-el :label="$store.state.breakcrumb.ch" v-if="$store.state.breakcrumb.ch"/>
    </q-breadcrumbs>
    <div class="widthlim">
        <div class="title">{{content.article.title}}</div>
        <div id="intro" class="text-grey-14">
        	<div id="ys">{{getLocalTime(content.article.createdate)}} {{content.article.source}}</div>
        	<div id="func">
        		<q-btn flat round color="red-10" icon="headset" @click="$store.commit('audio_show')">
                    <q-tooltip>
                    听文章
                    </q-tooltip>
                </q-btn>
                <q-btn flat round color="red-10" @click="$emit('autoRead')">
                    <q-tooltip>
                    自动滚动
                    </q-tooltip>
                    <div style="padding:0 5px;font-size:12px">auto</div>
                </q-btn>
        		<q-btn flat round color="red-10" :icon="$store.state.articleconfig.fontsize==16?'format_size':'text_fields'" @click="$store.commit('articleFontsize')">
                    <q-tooltip>
                    调整字体大小
                    </q-tooltip>      
                </q-btn>
        		<q-btn flat round color="red-10" :icon="$store.state.articleconfig.islove?'favorite':'favorite_border'" @click="$store.commit('articleIslove')">
                    <q-tooltip>
                    添加至 “我的收藏”
                    </q-tooltip>         
                </q-btn>
        	</div>
    	</div>

        <div class="row">
        	<div class="col-9">
        		<div v-html="content.article.content" style="width:100%;padding-right:25px" :style="{'font-size':$store.state.articleconfig.fontsize+'px'}"></div>
        	</div>
        	<div class="col-3">
        		<div class="art3">
                    <tm2 title="推荐阅读" url="/ztlist"></tm2>
                    <itb5 :record="content.m19"/>
                </div>
                <div class="art3">
                    <tm2 title="热门文章" url="/ztlist"></tm2>
                    <itb5 :record="content.m20"/>
                </div>
        	</div>
        </div>
    </div>
</div></template>
<script>
import tm2 from '@/components/displaystyle/TM2';
import itb5 from '@/components/displaystyle/itb5'
export default{
	name:'article1',
	components:{
		tm2,itb5
	},
	props:['content'],
	data:()=>({}),
	mounted(){
        
    }
}
</script>