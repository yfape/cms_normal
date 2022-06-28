<style scoped>
.widthlim{width:1020px;}
.leftp{float:left;width:250px;overflow:hidden;}
.rightp{float:right;width:calc(100% - 250px);}
.bdr{border:1px dashed #4E4D4D;height:80px;width:80px;}

.cys{cursor:pointer;}
.cys:hover{border:1px dashed #000;}
.ssi{width:200px;}

.hover1:hover{cursor:pointer;background-color:#E7E2E2!important;}
</style>
<template><div v-if="show">
	<div>
		<div class="leftp"></div>
		<div class="leftp q-px-md full-height bg-white shadow-2" style="position:fixed">
			<q-separator class="q-mt-md"/><div class="q-mb-sm text-caption text-grey">基本属性</div>
			<div class="q-mt-sm">
				<q-input filled label="链接" :value="tid==-1?'未保存，暂无链接':($store.state.domain.web+'/topic/'+tid)" readonly dense color="red-10"/>
			</div>
			<div class="q-mt-sm">
				<q-input filled label="专题名" v-model="topic.title" dense color="red-10"/>
			</div>
			<div class="q-mt-sm">
				<q-img v-if="topic.img" :src="topic.img"/>
				<div class="text-caption text-center text-grey" v-if="!topic.img">未设置封面</div>
				<q-input filled label="封面图" dense color="red-10" v-model="topic.img">
					<template v-slot:append>
						<q-btn icon="close" dense flat @click="function(){topic.img=''}"/>
					</template>
				</q-input>
				<upbtn iid="faceimg123" label="设置封面" @change="function(imgs){changeimg(imgs[0],'img')}"/>
			</div>
			<div class="q-mt-sm">
				<q-img v-if="topic.backimg" :src="topic.backimg"/>
				<div class="text-caption text-center text-grey" v-if="!topic.backimg">未设置背景图</div>
				<q-input filled label="背景图" dense color="red-10" v-model="topic.backimg">
					<template v-slot:append>
						<q-btn icon="close" dense flat @click="function(){topic.backimg=''}"/>
					</template>
				</q-input>
				<upbtn class="q-mb-sm" iid="back123" label="设置背景图" @change="function(imgs){changeimg(imgs[0],'backimg')}"/>
				<div class="q-mt-sm">
					<q-input filled dense label="背景色" color="red-10" v-model="topic.backcolor" class="q-mb-sm">
				        <template v-slot:append>
				          	<q-icon name="colorize" class="cursor-pointer">
				            	<q-popup-proxy transition-show="scale" transition-hide="scale">
				              		<q-color v-model="topic.backcolor" format-model="hex" no-header/>
				            	</q-popup-proxy>
				          	</q-icon>
				          	<q-btn flat icon="close" dense @click="topic.backcolor='transparent'"/>
				        </template>
				    </q-input>
				</div>
			</div>

			<q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
		        <q-item-section class="text-left text-grey text-caption">
		          <q-item-label>{{topic.isheader==1?'启用':'禁用'}}顶部导航</q-item-label>
		        </q-item-section>
		        <q-item-section side>
		          <q-toggle dense color="red-10" v-model="topic.isheader" :true-value="1" :false-value="0"/>
		        </q-item-section>
		    </q-item>
		    <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
		        <q-item-section class="text-left text-grey text-caption">
		          <q-item-label>{{topic.isfooter==1?'启用':'禁用'}}底部导航</q-item-label>
		        </q-item-section>
		        <q-item-section side>
		          <q-toggle dense color="red-10" v-model="topic.isfooter" :true-value="1" :false-value="0"/>
		        </q-item-section>
		    </q-item>
		    <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
		        <q-item-section class="text-left text-grey text-caption">
		          <q-item-label>{{topic.valid==1?'启用':'禁用'}}专题</q-item-label>
		        </q-item-section>
		        <q-item-section side>
		          <q-toggle dense color="red-10" v-model="topic.valid" :true-value="1" :false-value="0"/>
		        </q-item-section>
		    </q-item>
		    <q-btn label="保存" v-if="topic.tid==-1" color="grey-7" dense class="full-width" icon="save" @click="addtopic"/>
		    <q-btn label="保存" v-if="topic.tid!=-1" color="grey-7" dense class="full-width" icon="save" @click="savetopic"/>
		    <q-btn label="删除专题" v-if="topic.tid!=-1" color="red-10" dense class="full-width q-mt-sm" icon="delete">
		    	<q-popup-edit dark v-model="test" class="q-pa-none"><q-btn label="您真的要删除吗？" icon="report_problem" class="full-width" dense color="red-10" @click="deletetopic"></q-btn></q-popup-edit>
		    </q-btn>

		</div>
		<div class="rightp q-pa-md">
			<div class="bg-white" id="code">
				<header4 v-if="topic.isheader==1" style="margin-bottom:1px"></header4>
				<div id="code" class="row justify-center"
				:style="{
					'background-size':'100%',
					'background-repeat':'no-repeat',
					'background-color':topic.backcolor?topic.backcolor:'transparent',
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
									animated
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

								<!-- 点击设置 -->
								<q-menu touch-position>
						          <q-list  style="min-width: 100px">
						            <q-item class="bg-red-10 text-white" clickable v-close-popup @click="opencomedit(item2,index,index1,index2)">
						            	<q-item-section class="text-center text-bold text-body2">组件设置</q-item-section>
						            </q-item>
						            <q-btn label="新增组件" color="grey" flat class="full-width full-height q-pa-none">
				            			<q-popup-edit v-model="test">
												<div class="text-grey text-caption">图文</div>
												<q-separator />
												<div class="row q-gutter-sm">
												<q-btn class="" flat @click="addmod('img',index,index1,index2)" v-close-popup>
													<div><div><q-img :ratio="16/9" contain class="ssi" src="/static/imgtext1.png"/></div>
													<div class="text-grey text-center text-caption">图文一(图片)</div></div>
												</q-btn>
												<q-btn class="" flat @click="addmod('imgtext2',index,index1,index2)" v-close-popup>
													<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/imgtext2.png"/></div>
													<div class="text-grey text-center text-caption">图文二</div></div>
												</q-btn>
												<q-btn class="" flat @click="addmod('imgtext3',index,index1,index2)" v-close-popup>
													<div><div><q-img :ratio="16/9" contain class="ssi" src="/static/imgtext3.png"/></div>
													<div class="text-grey text-center text-caption">图文三</div></div>
												</q-btn>
												</div>
												<div class="text-grey text-caption">文字</div>
												<q-separator />
												<q-btn class="" flat @click="addmod('textblock',index,index1,index2)" v-close-popup>
													<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/text1.png"/></div>
													<div class="text-grey text-center text-caption">文字模块</div></div>
												</q-btn>
												<div class="text-grey text-caption">多元</div>
												<q-separator />
												<q-btn class="" flat @click="addmod('carousel',index,index1,index2)" v-close-popup>
													<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/carousel1.png"/></div>
													<div class="text-grey text-center text-caption">幻灯片</div></div>
												</q-btn>
												<q-btn class="" flat @click="addmod('img',index,index1,index2)" v-close-popup>
													<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/pp1.png"/></div>
													<div class="text-grey text-center text-caption">视差图</div></div>
												</q-btn>
												<q-btn class="" flat @click="addmod('img',index,index1,index2)" v-close-popup>
													<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/pm1.png"/></div>
													<div class="text-grey text-center text-caption">跑马灯</div></div>
												</q-btn>
											</q-popup-edit>
								        </q-btn>
						            <q-separator />
						            <q-item dense clickable v-close-popup @click="opencoledit(item1,index,index1)">
						            	<q-item-section class="text-center text-grey text-caption">列块设置</q-item-section>
						            </q-item>
						            <q-separator />
						            <q-item dense clickable v-close-popup @click="openrowedit(item,index)">
						            	<q-item-section class="text-center text-grey text-caption">框架设置</q-item-section>
						            </q-item>
						          </q-list>
						        </q-menu>
							</div>

							<div v-if="item1.content.length<=0" class="q-pa-lg  full-width" style="border:1px dashed #000;cursor:pointer;">
								<q-menu touch-position>
						          	<q-list  style="min-width: 100px">
						          		<q-btn label="新增组件" color="grey" flat class="full-width full-height q-pa-none">
					            			<q-popup-edit v-model="test">
													<div class="text-grey text-caption">图文</div>
													<q-separator />
													<div class="row q-gutter-sm">
													<q-btn class="" flat @click="addmod('img',index,index1)" v-close-popup>
														<div><div><q-img :ratio="16/9" contain class="ssi" src="/static/imgtext1.png"/></div>
														<div class="text-grey text-center text-caption">图文一(图片)</div></div>
													</q-btn>
													<q-btn class="" flat @click="addmod('imgtext2',index,index1)" v-close-popup>
														<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/imgtext2.png"/></div>
														<div class="text-grey text-center text-caption">图文二</div></div>
													</q-btn>
													<q-btn class="" flat @click="addmod('imgtext3',index,index1)" v-close-popup>
														<div><div><q-img :ratio="16/9" contain class="ssi" src="/static/imgtext3.png"/></div>
														<div class="text-grey text-center text-caption">图文三</div></div>
													</q-btn>
													</div>
													<div class="text-grey text-caption">文字</div>
													<q-separator />
													<q-btn class="" flat @click="addmod('textblock',index,index1)" v-close-popup>
														<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/text1.png"/></div>
														<div class="text-grey text-center text-caption">文字模块</div></div>
													</q-btn>
													<div class="text-grey text-caption">多元</div>
													<q-separator />
													<q-btn class="" flat @click="addmod('carousel',index,index1)" v-close-popup>
														<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/carousel1.png"/></div>
														<div class="text-grey text-center text-caption">幻灯片</div></div>
													</q-btn>
													<q-btn class="" flat @click="addmod('img',index,index1)" v-close-popup>
														<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/pp1.png"/></div>
														<div class="text-grey text-center text-caption">视差图</div></div>
													</q-btn>
													<q-btn class="" flat @click="addmod('img',index,index1)" v-close-popup>
														<div><div><q-img contain :ratio="16/9" class="ssi" src="/static/pm1.png"/></div>
														<div class="text-grey text-center text-caption">跑马灯</div></div>
													</q-btn>
												</q-popup-edit>
									        </q-btn>
							            <q-item dense clickable v-close-popup @click="opencoledit(item1,index,index1)">
							            	<q-item-section class="text-center text-grey text-caption">列块设置</q-item-section>
							            </q-item>
							            <q-separator />
							            <q-item dense clickable v-close-popup @click="openrowedit(item,index)">
							            	<q-item-section class="text-center text-grey text-caption">框架设置</q-item-section>
							            </q-item>
							        </q-list>
							    </q-menu>
							</div>
						</div>
					</div>

					<div id="noshow" class="q-pa-lg text-center bg-white q-my-md widthlim">
						<q-btn dense label="添加主框架" icon="add" outline color="grey-6" class="q-px-md">
							<q-popup-edit v-model="test">
								<q-card class="q-pa-md row no-shadow">
									<q-tabs v-model="diamain" class="text-teal row" style="width:900px">
										<q-tab class="col-3" name="12">
											<div class="bdr" style="margin:0 auto"></div>
											<div class="text-center text-caption text-grey">100%整框架</div>
										</q-tab>
										<q-tab class="col-3" name="6+6">
											<div class="row items-center justify-center">
												<div class="bdr"></div>
												<div class="bdr"></div>
											</div>
											<div class="text-center text-caption text-grey">1:1框架</div>
										</q-tab>
										<q-tab class="col-3" name="4+8">
											<div class="row items-center justify-center">
												<div class="bdr" style="width:50px"></div>
												<div class="bdr" style="width:100px"></div>
											</div>
											<div class="text-center text-caption text-grey">1:2框架</div>
										</q-tab>
										<q-tab class="col-3" name="8+4">
											<div class="row items-center justify-center">
												<div class="bdr" style="width:100px"></div>
												<div class="bdr" style="width:50px"></div>
											</div>
											<div class="text-center text-caption text-grey">2:1框架</div>
										</q-tab>
									</q-tabs>
								</q-card>
								<q-separator class="q-my-sm"/>
								<div class="text-right bg-white row justify-between">
									<q-input outlined color="red-10" label="自定义比例框架" v-model="diamain" dense style="width:600px"/>
									<div class="row items-end">
										<q-btn flat class="q-px-sm" label="插入全宽框架" color="grey-7" @click="addmain(1,topic.content)" v-close-popup/>
										<q-btn class="q-px-sm q-ml-md" label="插入限宽框架" color="red-10" @click="addmain(0,topic.content)" v-close-popup/>
									</div>
								</div>
							</q-popup-edit>
						</q-btn>
					</div>
				</div>
				<footer1 v-if="topic.isfooter" class="shadow-1"></footer1>
			</div>
		</div>
	</div>
	<diarow ref="diarow" @deleterow="deleterow"></diarow>
	<diacol ref="diacol"></diacol>
	<diaimg ref="diaimg" @deletecom="deletecom" @refleshcol="refleshcol"></diaimg>
	<diacarousel ref="diacarousel" @deletecom="deletecom" @refleshcol="refleshcol"></diacarousel>
	<diatextblock ref="diatextblock" @deletecom="deletecom" @refleshcol="refleshcol"></diatextblock>
	<diaimgtext2 ref="diaimgtext2" @deletecom="deletecom" @refleshcol="refleshcol"></diaimgtext2>
	<diaimgtext3 ref="diaimgtext3" @deletecom="deletecom" @refleshcol="refleshcol"></diaimgtext3>
</div></template>
<script>
import upbtn from '@/components/UploadCom'
import header4 from '@/components/web/mod/header4'
import footer1 from '@/components/web/mod/footer1'
import diarow from '@/components/dialog/diarow'
import diacol from '@/components/dialog/diacol'
import diaimg from '@/components/dialog/diaimg'
import diacarousel from '@/components/dialog/diacarousel'
import diatextblock from '@/components/dialog/diatextblock'
import diaimgtext2 from '@/components/dialog/diaimgtext2'
import diaimgtext3 from '@/components/dialog/diaimgtext3'

export default{
name:'topic',
components:{diaimgtext2,diaimgtext3,upbtn,header4,footer1,diarow,diacol,diaimg,diacarousel,diatextblock},
props:['tid'],
data:()=>({
	show:false,test:'',diamain:'12',
	storindex:{index:0,index1:0,index2:0},
	carousel:{},
	topic:{
		tid:-1,title:'',img:'',backimg:'',isheader:1,isfooter:1,backcolor:'#fff',valid:0,
		content:[]
	},
}),
mounted(){
	this.getData()
},
methods:{
	initd(){
		this.topic = Object.assign({},{},{
			tid:-1,title:'',img:'',backimg:'',isheader:1,isfooter:1,backcolor:'#fff',valid:0,content:[]
		})
		this.show = true
	},
	getData(){
		if(this.tid==-1){
			this.initd()
			return
		}
		this.$q.loading.show()
		this.axios.post('getTopic',{tid:this.tid}).then(res=>{
			this.topic = Object.assign({},{},res.topic)
			this.formatvalue()
			this.show = true
			this.$q.loading.hide()
		})
	},
	formatvalue(){
		let r = /^\+?[1-9][0-9]*$/;

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
	},
	refleshcol(obj){
		this.$set(this.topic.content[this.storindex.index].content[this.storindex.index1].content,this.storindex.index2,obj)
	},
	opencoledit(obj,index,index1){
		this.storindex.index = index
		this.storindex.index1 = index1
		this.$refs.diacol.showd(obj,index,index1)
	},
	openrowedit(obj,index,index1){
		this.storindex.index = index
		this.storindex.index1 = index1
		this.$refs.diarow.showd(obj,index)
	},
	deleterow(){
		this.topic.content.splice(this.storindex.index,1)
	},
	deletecom(){
		this.topic.content[this.storindex.index].content[this.storindex.index1].content.splice(this.storindex.index2,1)
	},
	changeimg(img,arg){
		this.topic[arg] = img
	},
	addmain(fullwidth,main){
		let dd = {fullwidth:0,backcolor:'transparent',padding:'q-pa-none',align:'items-center',justify:'justify-center',content:[]}
		dd.fullwidth = fullwidth
		let cols = this.diamain.split('+')
		for(let i in cols){
			dd.content.push({col:cols[i],backcolor:'#fff',padding:'q-pa-md',align:'self-center',content:[]})
		}
		main.push(dd)
	},
	opencomedit(obj,index,index1,index2,arg=''){
		this.storindex.index = index
		this.storindex.index1 = index1
		this.storindex.index2 = index2
		if(arg){
			this.$refs[arg].showd(obj)
		}else{
			this.$refs['dia'+obj.type].showd(obj)
		}
	},
	addmod(mode,index,index1,index2=-1){
		index2 = index2+1
		if(mode=='carousel'){
			this.carousel['c'+index+'c'+index1+'c'+index2] = 1
			this.carousel = Object.assign({},{},this.carousel)
		}
		this.topic.content[index].content[index1].content.splice(index2,0,{type:''})
		this.opencomedit(this.topic.content[index].content[index1].content[index2],index,index1,index2,'dia'+mode)
	},
	savetopic(){
		if(!this.judgedata()){
			this.AItip('专题名称不能为空')
			return
		}
		this.besmall()
		this.$q.loading.show()
		this.axios.post('saveTopic',{topic:this.topic}).then(res=>{
			this.$q.loading.hide()
			this.$router.replace('/topics')
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	besmall(){
		for(let i in this.topic){
			if(!this.topic[i]||this.topic[i]==='0'||this.topic[i]=='transparent'||this.topic[i]=='items-center'||this.topic[i]=='justify-center'){
				delete this.topic[i]
			}

			if(Array.isArray(this.topic[i])){
				for(let i1 in this.topic[i]){
					let ct = this.topic[i][i1]
					for(let i2 in ct){
						if(!ct[i2]||ct[i2]==='0'||ct[i2]==='transparent'||ct[i2]==='items-center'||ct[i2]==='justify-center'){
							delete ct[i2]
						}

						if(Array.isArray(ct[i2])){
							for(let i3 in ct[i2]){
								let ct1 = ct[i2][i3]
								for(let i4 in ct1){
									if(!ct1[i4]||ct1[i4]===0||ct1[i4]==='transparent'||ct1[i4]==='items-center'||ct1[i4]==='justify-center'){
										delete ct1[i4]
									}

									if(Array.isArray(ct1[i4])){
										for(let i5 in ct1[i4]){
											let ct2 = ct1[i4][i5]
											for(let i6 in ct2){
												if(!ct2[i6]||ct2[i6]===0||ct2[i6]==='transparent'||ct2[i6]==='items-center'||ct2[i6]==='justify-center'){
													delete ct2[i6]
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
	},
	judgedata(){
		if(!this.topic.title){
			return false
		}
		return true
	},
	addtopic(){
		if(!this.judgedata()){
			this.AItip('专题名称不能为空')
			return
		}
		this.besmall()
		this.$q.loading.show()
		this.axios.post('addTopic',{topic:this.topic}).then(res=>{
			this.$q.loading.hide()
			this.$router.replace('/topics')
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	deletetopic(){
		this.$q.loading.show()
		this.axios.post('deleteTopic',{tid:this.topic.tid}).then(res=>{
			this.$q.loading.hide()
			this.$router.replace('/topics')
		}).catch(err=>{
			this.$q.loading.hide()
		})
	}
}
}
</script>