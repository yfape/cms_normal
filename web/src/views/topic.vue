<style scoped>
.widthlim{width:1020px;}
.bdr{border:1px dashed #4E4D4D;height:80px;width:80px;}
.ssi{width:200px;}

.hover1:hover{cursor:pointer;background-color:#E7E2E2!important;}
</style>
<template><div v-if="show">
	<header4 v-if="topic.isheader==1" style="margin-bottom:1px"></header4>
	<div class="row justify-center"
	:style="{
		'background-size':'100%',
		'background-repeat':'no-repeat',
		'background-color':topic.backcolor,
		backgroundImage:'url(' + topic.backimg + ')'
	}">
		<!-- 页面内容 -->
		<!----- row ------->
		<div v-if="topic.content" v-for="item,index in topic.content"
		:class="[
			'row',
			[item.fullwidth==1?'full-width':'widthlim'],
			[item.padding?item.padding:'q-pa-md'],
			[item.align?item.align:'items-center'],
			[item.justify?item.justify:'justify-center'],
		]"
		:style="{
			'margin-top':item.margintop+'px',
			'margin-bottom':item.marginbottom+'px',
			'background-size':'100%',
			'background-repeat':'no-repeat',
			'background-color':item.backcolor?item.backcolor:'transparent',
			backgroundImage:'url(' + item.backimg + ')'
		}"
		>
			<!-- col ---->
			<div v-for="item1,index1 in item.content" 
			:class="[
				'cc','col-md-'+item1.col,'row','col-sm-12',
				[item1.padding?item1.padding:'q-pa-none'],
				[item1.align?item1.align:'self-center'],
			]" 
			style="min-height:30px;background-size:100%;background-repeat:no-repeat;"
			:style="{
				'background-color':item1.backcolor?item1.backcolor:'transparent',
				backgroundImage:'url(' + item1.backimg + ')',
			}">

				<!-- col内组件遍历 -->
				<div v-for="item2,index2 in item1.content" 
				:class="[
					'full-width','col-12','row','cys','hover1',
					[item2.padding?item2.padding:'q-pa-none'],
					[item2.align?item2.align:'items-center'],
					[item2.justify?item2.justify:'justify-center'],
					[item2.hoverstyle],
				]"
				:style="{
					'min-height':'30px',
					'height':item2.height,
					'padding-top':item2.paddingtop?(item2.paddingtop+'px'):'',
					'padding-bottom':item2.paddingbottom?(item2.paddingbottom+'px'):'',
					'padding-left':item2.paddingleft?(item2.paddingleft+'px'):'',
					'padding-right':item2.paddingright?(item2.paddingright+'px'):'',
					'border-top':item2.bordertop==1?item2.border:'',
					'border-bottom':item2.borderbottom==1?item2.border:'',
					'border-left':item2.borderleft==1?item2.border:'',
					'border-right':item2.borderright==1?item2.border:'',
					'background-color':item2.backcolor?item2.backcolor:'transparent',
					backgroundImage:'url(' + item2.backimg + ')',
				}">
					<!-- 图片模块 -->
					<q-img v-if="item2.type=='img'"
					:src="item2.src" 
					:style="{width:item2.width,height:item2.height}" 
					:contain="item2.contain==1"
					>
						<div v-if="item2.title" :style="item2.textstyle"
						:class="[
							[item2.textjustify?item2.textjustify:'text-center'],
						]">{{item2.title}}</div>
					</q-img>

					<!-- 幻灯片模块 -->
					<q-carousel v-if="item2.type=='carousel'" 
						v-model="item2.value"
						swipeable
						:style="{width:item2.width,height:item2.height}" 
						:animated="item2.animated==1"
						transition-prev="slide-right"
 						transition-next="slide-left"
 						:arrows="item2.arrows==1"
 						:navigation="item2.navigation==1"
 						:thumbnails='item2.thumbnails==1'
 						:infinite='item2.infinite==1'
						:autoplay='item2.autoplay==1'
					>
						<q-carousel-slide v-for="item3,tempi in item2.content" :name="tempi+1" :img-src="item3.img" class="q-pa-none">
							<div v-if="item3.title" :style="item2.textstyle"
							:class="[
								[item2.textjustify?item2.textjustify:'text-center'],
							]">{{item3.title}}</div>
					  </q-carousel-slide>
					</q-carousel>

					<!-- 文字模块 -->
					<div v-if="item2.type=='textblock'" :class="[[item2.textjustify?item2.textjustify:'text-left'],'full-width']">
						<div class="full-width" :style="{'width':item2.width,'font-size':item2.size+'px','font-weight':item2.weight,'color':item2.color}">{{item2.title}}</div>
						<div v-if="item2.intro" :style="{
							'font-size':item2.introsize+'px!important',
							'color':item2.introcolor,
							'font-weight':item2.introweight,
							'padding-top':item2.introtop+'px',
							'padding-bottom':item2.introbottom+'px'
						}" class="full-width">
							{{item2.intro}}
						</div>
					</div>

					<!-- 图文二 -->
					<q-item v-if="item2.type=='imgtext2'" 
					:style="{
						height:item2.height,
						width:item2.width,
						'background-color':item2.backcolor?item2.backcolor:'transparent'
					}"
					:class="[[item2.inpadding],]">
						<q-item-section :avatar="item2.isavatar==1" :thumbnail="item2.isavatar!=1" v-if="item2.img&&item2.imgleft" 
						>
							<img :src="item2.img"/>
						</q-item-section>
						<q-item-section>
							<q-item-label :lines="2" 
							:style="{
								'font-size':item2.size+'px',
								'color':item2.color,
								'font-weight':item2.weight,
							}"
							:class="[
								[item2.textjustify?item2.textjustify:'text-left'],
							]">
								{{item2.title}}
							</q-item-label>
							<q-item-label caption :line="3">{{item2.intro}}</q-item-label>
						</q-item-section>
						<q-item-section :avatar="item2.isavatar==1" :thumbnail="item2.isavatar!=1" v-if="item2.img&&!item2.imgleft" 
						>
							<img :src="item2.img"/>
						</q-item-section>
					</q-item>

					<!-- 图文三 -->
					<div v-if="item2.type=='imgtext3'"
					:style="{}"
					:class="['full-width']"
					>
						<q-img :src="item2.img"/>
						<div
						:style="{
							'font-size':item2.size+'px',
							'color':item2.color,
							'font-weight':item2.weight,
						}"
						:class="['full-width','q-pa-sm',
							[item2.textjustify?item2.textjustify:'text-left'],
						]"
						>{{item2.title}}</div>
						<div v-if="item2.intro"
						:style="{
							'font-size':item2.introsize+'px',
							'color':item2.introcolor,
							'font-weight':item2.introweight?item2.introweight:100,
							'padding-top':item2.introtop+'px',
							'padding-bottom':item2.introbottom+'px'
						}"
						:class="['full-width','q-px-sm']">{{item2.intro}}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer1 v-if="topic.isfooter" class="shadow-1"></footer1>
</div></template>
<script>
import header4 from '@/components/header/header4'

export default{
name:'topic',
components:{header4},
props:['pid'],
data:()=>({
	show:false,oldcar:0,
	carousel:{},
	topic:{
		pid:0,title:'',img:'',backimg:'',isheader:1,isfooter:1,backcolor:'#fff',valid:0,
		content:[]
	},
}),
mounted(){
	this.getData()
},
methods:{
	getData(){
		if(this.pid<=0){
			this.$router.replace('/')
		}
		this.axios.get('page/'+this.pid).then(res=>{
			if(res.code==200){
				this.topic = Object.assign({},{},res.data)
				this.formatvalue()
				this.show = true
			}else{
				this.$router.replace('/error')
			}
		})
	},
	formatvalue(){
		let r = /^\+?[1-9][0-9]*$/;
		var cnum = 0;

		for(let i in this.topic){
			if(r.test(this.topic[i])){
				this.topic[i] = parseInt(this.topic[i])
			}
			if(Array.isArray(this.topic[i])){
				for(let i1 in this.topic[i]){
					let ct = this.topic[i][i1]
					for(let i2 in ct){
						if(r.test(ct[i2])){
							ct[i2] = parseInt(ct[i2])
						}
						if(Array.isArray(ct[i2])){
							for(let i3 in ct[i2]){
								let ct1 = ct[i2][i3]
								for(let i4 in ct1){
									if(r.test(ct1[i4])){
										ct1[i4] = parseInt(ct1[i4])
									}
									if(Array.isArray(ct1[i4])){
										for(let i5 in ct1[i4]){
											let ct2 = ct1[i4][i5]
											for(let i6 in ct2){
												if(r.test(ct2[i6])){
													ct2[i6] = parseInt(ct2[i6])
												}
												if(Array.isArray(ct2[i6])){
													for(let i7 in ct2[i6]){
														let ct3 = ct2[i6][i7]
														for(let i8 in ct3){
															if(r.test(ct3[i8])){
																ct3[i8] = parseInt(ct3[i8])
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}	
			}
		}

		this.topic = Object.assign({},{},this.topic)
	},
	getnum(){
		this.carindex = this.carindex+1
		return this.carindex
	}
}
}
</script>