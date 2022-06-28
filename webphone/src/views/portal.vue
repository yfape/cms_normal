<template><div><div v-if="show">
	<q-carousel :dark="false" arrows animated swipeable infinite autoplay v-model="car" style="height:50vw">
		<q-carousel-slide v-for="item,index in content.m2" :name="index" :img-src="item.img">
	        <div class="absolute-bottom text-subtitle1 q-px-sm q-py-xs text-white tback cfont">{{item.title}}</div>
      	</q-carousel-slide>
	</q-carousel>
	<div :class="['row q-mb-sm',[$q.dark.isActive?'bg-grey-10':'bg-white']]">
		<div class="col-3">
			<q-btn stack class="full-width q-py-sm" flat icon="o_horizontal_split">
				<div class="text-subtitle2">专题</div>
			</q-btn>
		</div>
		<div class="col-3">
			<q-btn stack class="full-width q-py-sm" flat icon="o_turned_in_not">
				<div class="text-subtitle2">杂志</div>
			</q-btn>
		</div>
		<div class="col-3">
			<q-btn disable stack class="full-width q-py-sm text-grey-5" flat icon="o_map">
				<div class="text-subtitle2">市州</div>
			</q-btn>
		</div>
		<div class="col-3">
			<q-btn stack class="full-width q-py-sm" flat icon="o_search">
				<div class="text-subtitle2">搜索</div>
			</q-btn>
		</div>
	</div>

	<div v-for="item,index in content.m3">
		<!-- 主 -->
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
		<!-- 横幅1 -->
		<q-img :src="content.m4.faceimg" class="q-mb-sm" v-if="index==2"/>
		<!-- 专题1-1,2 -->
		<div class="q-px-sm row q-col-gutter-sm items-start" v-if="index==4">
			<q-item clickable v-ripple class="col-6 q-pr-none" v-for="item,i1 in content.m7" v-if="i1<2">
				<q-item-section class="q-pa-none">
					<q-img :src="item.img" class="full-width" :ratio="16/9"/>
					<div :class="['q-pa-sm text-subtitle1 cfont',[$q.dark.isActive?'bg-grey-10':'bg-white']]">
						<q-item-label :lines="2">
							{{item.title}}
						</q-item-label>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<!-- 专题1-3,4 -->
		<div class="q-px-sm row q-col-gutter-sm items-start" v-if="index==6">
			<q-item clickable v-ripple class="col-6 q-pr-none" v-for="item,i1 in content.m7" v-if="i1>=2">
				<q-item-section class="q-pa-none">
					<q-img :src="item.img" class="full-width" :ratio="16/9"/>
					<div :class="['q-pa-sm text-subtitle1 cfont',[$q.dark.isActive?'bg-grey-10':'bg-white']]">
						<q-item-label :lines="2">
							{{item.title}}
						</q-item-label>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<!-- 视差图1 -->
		<q-parallax class="q-my-sm" :height="80" :speed="0.5" v-if="index==8">
	      	<template v-slot:media>
	        	<img :src="content.m9.backimg">
	      	</template>
	      	<div class="q-px-xl"><img class="full-width" :src="content.m9.faceimg"/></div>
	    </q-parallax>

		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==3">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m10[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m10[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m10[0].img">
				<img :src="content.m10[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==3">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m11[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m11[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m11[0].img">
				<img :src="content.m11[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
		
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==5">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m12[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m12[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m12[0].img">
				<img :src="content.m12[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
		
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==5">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m13[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m13[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m13[0].img">
				<img :src="content.m13[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==7">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m14[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m14[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m14[0].img">
				<img :src="content.m14[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
		<q-item clickable v-ripple @click="" :class="[
		'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
		]" v-if="index==7">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{content.m15[0].title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{content.m15[0].source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="content.m15[0].img">
				<img :src="content.m15[0].img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>

	<div v-for="item,index in content.m5" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m6" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m8" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m10" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m11" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m12" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m13" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m14" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m15" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>
	<div v-for="item,index in content.m17" v-if="index>0">
		<q-item clickable v-ripple @click="" :class="[
			'q-mb-sm q-py-md',[$q.dark.isActive?'bg-grey-10':'bg-white']
			]">
			<q-item-section>
				<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
				<q-item-label :lines="1" caption class="row q-pt-sm">{{item.source}}<q-space /> {{item.createdate}} <span></span></q-item-label>
			</q-item-section>
			<q-item-section thumbnail v-if="item.img">
				<img :src="item.img" class="full-height"/>
			</q-item-section>
		</q-item>
	</div>

	<div style="height:30px"></div>
	
    </div>
    <q-inner-loading :showing="!show">
        <q-spinner-bars size="30px" color="red-10" />
    </q-inner-loading>
</div></template>
<script>
export default{
	name:'portal',
	components:{},
	data:()=>({
		car:0,show:false,
		content:{}
	}),
	mounted(){
		this.getData()
	},
	methods:{
		getData(){
	        this.axios.get('home').then(response=>{
                this.content = Object.assign({},{},response)
                this.show = true
	        })
	    }
	}
}
</script>
<style scoped>
.tback{background-image: linear-gradient(transparent,#4C4B4B)}
.dbtn{height:70px;width:70px;}
</style>