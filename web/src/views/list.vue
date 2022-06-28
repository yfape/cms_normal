<style scoped>
.topborder{box-shadow:0px -0.3px 0.3px #000}
.bottomborder{box-shadow:0px 0.3px 0.3px #000}
.ys{height:140px;}
.ys1{height:110px;}
.ysshadow{border:1px solid #C3CBDD;border-radius:3px}
.ysdate{height:27.5px;line-height:27.5px}

.righthead{height:40px}
.righthead>.title{width:36%;font-size:18px;height:38px;line-height:38px;font-weight:bold;color:#B71C1C;border-top:2px solid #B71C1C;text-align:center;}
.righthead>.line{width:62%;height:38px;border-top:2px solid #DADADA;margin-left:2%;}
</style>
<template><div v-if="show">
	<header4 style="position:fixed;z-index:10;"></header4>
	<div style="height:60px"></div>
	<q-layout class="">
		<q-page-container>
	        <q-page>
	        	<div class="row q-pa-md" style="background:transparent;width:1300px;margin:0 auto">
	        		
	        		<div class="col-2 q-pr-lg row justify-end">
	        			<q-tabs style="position:fixed;width:162px;" vertical
					        v-model="tab"
					        class="text-grey-7"
					        active-bg-color="grey-2"
					        active-color="red-10"
					        @input="changeTab"
					    >
					        <q-tab :disable="tabdisable" :label="navitem.text" :name="navitem.cid" style="background:#B71C1C!important;color:#fff!important;"/>
					        <q-tab :disable="tabdisable" v-for="item in navitem.children" :label="item.text" :name="item.cid" class="topborder"/>
					    </q-tabs>
	        		</div>
	        		<div class="col-7">
	        			<q-infinite-scroll @load="onLoad" :offset="250" :disable="scrolldisable">
					      	<div v-for="(item,index) in articles" @click="">
		        				<q-item clickable v-ripple class="ys" v-if="item.img">
			                        <q-item-section thumbnail style="margin-left:0">
			                            <img :src="item.img" style="height:120px;width:180px">
			                        </q-item-section>
			                        <q-item-section class="column">
			                        	<div class="col-8 text-h6">{{item.title}}</div>
			                        	<div class="col-4 row items-end text-grey-5 justify-between text-weight-thin">
			                        		<div>
			                        			<q-chip square dense size="13px" color="grey-2">{{item.col}}</q-chip>
			                        			<q-chip square dense size="13px" color="grey-3">{{item.source}}</q-chip>
			                        		</div>
			                        		<div class="ysdate">
			                        			{{df(item.createdate)}}
			                        		</div>
			                        	</div>
			                        </q-item-section>
			                    </q-item>
			                    <q-item clickable v-ripple class="ys1" v-if="!item.img">
			                    	<q-item-section class="column">
			                        	<div class="col-8 text-h6">{{item.title}}</div>
			                        	<div class="col-4 row items-end text-grey-5 justify-between text-weight-thin">
			                        		<div>
			                        			<q-chip square dense size="13px" color="grey-2">{{item.col}}</q-chip>
			                        			<q-chip square dense size="13px" color="grey-3" :label="item.source"/>
			                        		</div>
			                        		<div class="ysdate">
			                        			{{df(item.createdate)}}
			                        		</div>
			                        	</div>
			                        </q-item-section>
			                    </q-item>
		                    	<q-separator />
		        			</div>
		        			<div v-if="articles.length<=0" class="text-center text-subtitle1 text-grey-5">暂无文章</div>
					      	<template v-slot:loading>
					        	<div class="row justify-center q-my-lg">
					          		<q-spinner-dots color="red-10" size="40px" />
					        	</div>
					      	</template>
					    </q-infinite-scroll>
	        		</div>
	        		<div class="col-3 q-pl-lg">
	        			<div class="q-mb-lg bg-grey-2">
	        				<tm2 title="推荐阅读"></tm2>
	        				<itb5 :record="recommend"></itb5>
	        			</div>
	        			<div class="q-mb-lg bg-grey-2 ">
	        				<tm2 title="热门文章"></tm2>
						    <itb5 :record="recommend"></itb5>
	        			</div>
	        		</div>
	        	</div>
		        <q-page-scroller position="bottom-right" :scroll-offset="150" :offset="[18, 18]">
		        	<q-btn icon="keyboard_arrow_up" color="red-10"/>
		        </q-page-scroller>
	        </q-page>
	    </q-page-container>
	</q-layout>
	<footer1></footer1>
</div></template>
<script>
import header4 from '@/components/header/header4'
import tm2 from '@/components/displaystyle/TM2'
import itb5 from '@/components/displaystyle/itb5'

export default{
name:'list',
props:['cid'],
components:{header4,tm2,itb5},
data:()=>({
	show:false,tab:1,navitem:{},page:1,scrolldisable:false,tabdisable:false,
	recommend:[],hot:[],articles:[],
}),
mounted(){
	window.scrollTo(0, 0)
	this.getNavItem()
	this.getData()
},
methods:{
	getData(){
		this.page = 1
		this.scrolldisable = false
		let mode = (this.tab == this.navitem.cid)?1:0
		this.axios.get('list/'+this.tab+'/'+this.page,{params:{mode:mode}}).then(response=>{

			this.articles = Object.assign([],[],response.articles)
			this.recommend = Object.assign([],[],response.recommend)
			this.hot = Object.assign([],[],response.hot)
			window.scrollTo(0, 0)
			this.show = true
		})
	},
	getNavItem(){
		let nav = this.$store.state.nav
		this.navitem = {}
		for(let i in nav){
			if(nav[i].url == this.$route.path){
				this.navitem = Object.assign({},{},nav[i])
				break;
			}
		}
		this.tab = this.navitem.cid
	},
	changeTab(){
		this.getData()
	},
	onLoad (index, done) {
		this.tabdisable = true
    	this.page = this.page+1
    	let mode = (this.tab == this.navitem.cid)?1:0
    	this.axios.get('list/'+this.tab+'/'+this.page,{params:{mode:mode}}).then(response=>{
    		if(response.articles.length<10){
    			this.scrolldisable = true
    			this.articles.push(...response.articles)
    		}
    		this.tabdisable = false
    		done()
		})
    }
},
watch:{
	'$route.path'(){
		window.scrollTo(0, 0)
		this.getNavItem()
		this.getData()
	}
}
}
</script>