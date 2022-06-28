<template><q-layout v-scroll="scrolled" v-if="config.show">
	<header2 :tab="1"></header2>
	<header3 v-if="show1" v-show="config.LH3show" :title="content.article.title" @autoRead="autoRead"></header3>
	<article1 v-if="show1&&content.article.style===1" :content="content" @autoRead="autoRead"></article1>
	<article2 v-if="show1&&content.article.style===2" :content="content" @autoRead="autoRead"></article2>
	<article3 v-if="show1&&content.article.style===3" :content="content" @autoRead="autoRead"></article3>
	<div v-if="!show1" class="full-width text-grey text-subtitle1 text-center q-py-xl">此文章不存在或已被删除</div>
	<footer1 id="articleend"></footer1>
	<audiopanel1 v-if="$store.state.audio.show"></audiopanel1>
	<q-page-scroller position="bottom-right" :scroll-offset="200" :offset="[18, 18]">
        <q-btn icon="keyboard_arrow_up" color="red-10" />
    </q-page-scroller>
</q-layout></template>
<script>
import header2 from '@/components/header/header2'
import header3 from '@/components/header/header3'
import article1 from '@/components/article/article1'
import article2 from '@/components/article/article2'
import article3 from '@/components/article/article3'
import audiopanel1 from '@/components/service/audiopanel1'
export default{
	name:'article_yf',
	props:['aid'],
	components:{
		header2,header3,article1,article2,article3,audiopanel1
	},
	data:()=>({
		show1:false,
		config:{
			show:false,LH3show:false,timer:null,lastpose:0
		},
		content:{article:'',m19:[],m20:[]},
	}),
	created(){
		window.scrollTo(0, 0)
	},
	mounted(){
		this.getArticle()
	},
	methods:{
		scrolled(position){
	      	if(position>=200){
	      		this.config.LH3show=true
	      	}else{
	      		this.config.LH3show=false
	      	}
	    	if(this.config.lastpose>=position){
	    		this.clearTimer()
	      	}else{
	      		this.config.lastpose = position
	      	}
	    },
	    getArticle(){
	    	this.config.show = false
	    	let _this=this
	    	this.axios.get('article/'+this.aid).then(response=>{
	    		if(response.code==200){
	    			this.content = Object.assign({},{},response.data)
	    			this.$store.commit('setBreakcrumbByCid',this.content.article.col)
	    			this.setAudio()
	    			this.show1 = true
		    		this.config.show = true
	    		}else{
	    			this.show1 = false
	    			this.config.show = true
	    		}
	    	})
	    },
        autoRead(){
        	if(this.config.timer){
        		this.clearTimer()
        		return
        	}
        	var el = document.getElementById('articleend')
        	var target = el.offsetTop
            var lastPos = 0;
            var arg = 1
            let _this = this
            function goMove() {
                var currentPosition = (document.documentElement.scrollTop || document.body.scrollTop)+1;
                currentPosition = parseInt(currentPosition)
                if(lastPos == currentPosition) { //页面高度不够长，未滑动到指定位置的时候，已经滑动到底部了
                    window.scrollTo(0, target);
                    _this.clearTimer()
                    return;
                }
                lastPos = currentPosition;
                if(Math.abs(currentPosition - target) < arg) {
                    window.scrollTo(0, target);
                    _this.clearTimer()
                    return;
                }
                if (currentPosition -target > arg) {
                    currentPosition -= arg;
                    window.scrollTo(0, currentPosition);
                } else {
                    currentPosition += arg;
                    window.scrollTo(0, currentPosition);
                }
            }
            this.config.timer = setInterval(goMove, 40);
        },
        clearTimer(){
        	clearInterval(this.config.timer);
	    	this.config.timer = null
	    	this.config.lastpose = 0
        },
        setAudio(){
        	this.$store.state.audio = Object.assign({},{show:false,title:this.content.article.title,url:this.content.article.audio,img:this.content.article.faceimg})
        }
	},
	watch:{
		"aid"(){
			this.getArticle()
		}
	}
}
</script>