<template><div>
	<div v-if="show" :class="[[$q.dark.isActive?'':'bg-white']]">
		<q-img v-if="article.faceimg" :src="article.faceimg" style="height:52vw">
			<div class="imgin">{{article.faceintro}}</div>
		</q-img>
		<div v-if="article.faceimg" class="row justify-between q-pl-sm q-pr-md" style="height:30px">
			<div><q-chip :label="article.col" class="text-grey" square dense/>
			<q-chip :label="timefor(article.createdate,Date.parse(new Date())/1000)" color="" square dense class="q-mr-sm text-grey"/></div>
			<img :class="['shadow-4']" style="height:50px;position:relative;top:-25px;" src="static/zzlogo.png"/>
		</div>
		<div class="q-px-sm q-py-md text-h6 text-weight-bold">{{article.title}}</div>
		<div class="q-px-sm text-grey row justify-between items-center">
			<div>来源：{{article.source}}</div>
			<div v-if="!article.faceimg">
				{{article.col}} / {{timefor(article.createdate,Date.parse(new Date())/1000)}}
			</div>
		</div>
		<q-separator/>
		<div v-html="article.content" class="q-pa-sm cfont content" style="overflow:hidden;"></div>
	</div>

	<!-- 音频播放 -->
	<q-dialog v-model="audio.show" position="top" seamless >
		<VueAplayer style="box-shadow:-1px 0px 3px #999999" autoplay :music="{
		  title: article.title,
		  artist: ' ',
		  src: article.audio,
		  pic: article.faceimg,
		  lrc: '[00:00.00]lrc here [00:01.00]aplayer'
		}"></VueAplayer>
	</q-dialog>

	<footer2 :aid="aid" :audio="article.audio" :audioshow="audio.show" @showAudio="showAudio"></footer2>
	<q-inner-loading :showing="!show">
        <q-spinner-bars size="30px" color="red-10" />
  </q-inner-loading>
</div></template>
<script>
import footer2 from '@/components/footer/footer2'
import VueAplayer from 'vue-aplayer'
export default{
	name:'art',
	props:['aid'],
	components:{footer2,VueAplayer},
	data:()=>({
		show:false,
		audio:{show:false},
		article:{},
	}),
	mounted(){
		this.getArticle()
	},
	methods:{
		getArticle(){
			if(!this.aid){
				return
			}
			this.axios.get('article/'+this.aid).then(res=>{
				this.article = Object.assign({},{},res.article)
				this.show = true
			})
		},
		showAudio(){
			this.audio.show = true
		}
	}
}
</script>
<style>
.imgin{padding:3px!important;position:relative;top:34vw;right:0;border-radius:0 3px 3px 0;max-width:80%;max-height:46px;overflow:hidden;}
.aplayer-icon-mode{display:none!important}
.content img{max-width:100%!important;}
</style>