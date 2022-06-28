<template><div style="background-color:#fff;">
	
	<div id="page" :style="{
		'background':'url('+page.backimg+') no-repeat scroll 0 0/100%',
		'background-color':page.backcolor,
	}">
		<header1 v-if="page.header==1" :nav="nav"/>
		<header2 v-if="page.header==2" :nav="nav"/>
		<header4 v-if="page.header==3" :nav="nav"/>
		<div v-for="item,index in page.content" 
		:class="['row',
			[item.fw?'full-width':'widthlim'],
			[item.j?item.j:'justify-center'],
			[item.a?item.a:'items-center'],
			[item.m?item.m:''],
		]"
		:style="[
			{'margin-top':item.m_t+'px!important',
			'margin-bottom':item.m_b+'px!important',
			'background':'url('+item.bi+') no-repeat scroll 0 0/100%',
			'background-color':item.bc},
			item.bd
		]"
		>
			<div v-for="item1,index1 in item.col"
			:class="['drop-target',
				[item1.cp.length?'':'nullcol'],
				['col-'+item1.c,'row'],
				[item1.s?item1.s:''],
				[item.a?item.a:'content-center'],
				[item1.p?item1.p:'q-pa-md']
			]"
			:style="[{
				'padding-top':item1.p_t+'px!important',
				'padding-left':item1.p_l+'px!important',
				'padding-right':item1.p_r+'px!important',
				'padding-bottom':item1.p_b+'px!important',
				'background':'url('+item1.bi+') no-repeat scroll 0 0/100%',
				'background-color':item1.bc,
				'overflow':'hidden'
			},item1.bd
			]"
			>
				<div v-if="item1.cp.length==0" style="height:100%;width:100%"
					@dragenter="onDragEnter"
			        @dragleave="onDragLeave"
			        @dragover="onDragOver"
			      	@drop="function(e){onDrop(e,index,index1)}"
				></div>
				<div v-for="item2,index2 in item1.cp" :draggable="true" @dragstart="function(e){onDragStart(e,item2,index,index1,index2)}"
				:class="[
					'col-12',[item2.ta?item2.ta:'text-center'],
				]"
				>
					<div style="height:1px;width:100%"
						@dragenter="onDragEnter"
				        @dragleave="onDragLeave"
				        @dragover="onDragOver"
				      	@drop="function(e){onDrop(e,index,index1)}"
					></div>


<!-------------------------             组件             -------------------------->
					<!-- 图文一 -->
					<q-img v-if="item2.t=='imgtext1'" 
					:contain="item2.ct==1"
					:style="[{
						'width':item2.w,
						'height':item2.h,
					}]" :ratio="1.8" :src="item2.img"
					>
						<div v-if="item2.tt"
						:style="{
							'padding':'5px 10px',
							'background': item2.gra?'transparent':'',
							'background-image': item2.gra?'linear-gradient(transparent,#2D2C2C)':''
						}"
						:class="['absolute-bottom text-subtitle1',[item2.tj]]">{{item2.tt}}</div>
					</q-img>

					<!-- 图文二 -->
					<q-item v-if="item2.t=='imgtext2'" clickable v-ripple
					:class="['row items-center',
						[item2.p?item2.p:'q-pa-md'],
						[item2.m?item2.m:''],
					]" 
					:style="{
						'background-color':item2.bc,
						'margin-top':item2.m_t+'px',
						'margin-bottom':item2.m_b+'px',
						'width':item2.w,
						'height':item2.h,
					}">
						<q-item-section class="col-4">
							<img class="full-width" :src="item2.img"/>
						</q-item-section>
						<q-item-section class="col-8">
							<q-item-label :line="2" :class="[[item2.tb?'text-bold':''],item2.tj]" :style="{'font-size':item2.ts+'px'}">{{item2.tt}}</q-item-label>
							<q-item-label :line="2" caption>{{item2.intro}}</q-item-label>
						</q-item-section>
					</q-item>
<!-------------------------------------------------------------------------------->
					<div style="height:1px;width:100%"
						@dragenter="onDragEnter"
				        @dragleave="onDragLeave"
				        @dragover="onDragOver"
				      	@drop="function(e){onDrop(e,index,index1)}"
					></div>
			        <q-menu touch-position context-menu transition-show="jump-down" transition-hide="jump-up">
			          	<q-list style="min-width: 100px">
			          		<q-item dense class="q-pa-none">
			              		<q-btn v-close-popup dense class="full-width q-px-md q-py-xs" label="组件配置" color="red-10" @click="openCP(index,index1,index2)"/>
			              		<q-btn v-close-popup v-close-popup flat dense icon="o_delete" @click="deleteCP(index,index1,index2)"/>
			            	</q-item>
			            	<q-item dense class="q-pa-none">
			              		<q-btn v-close-popup dense class="full-width q-px-md" label="列配置" flat @click="openCol(index,index1)"/>
			              		<q-btn flat dense icon=""/>
			            	</q-item>
			            	<q-item dense class="q-pa-none">
			            		<q-btn v-close-popup dense class="full-width q-px-md" label="框架配置" flat @click="openRow(index)"/>
			             	 	<q-btn v-close-popup flat dense icon="o_delete" @click="deleteRow(index)"/>
			            	</q-item>
			          	</q-list>
			        </q-menu>
				</div>
			    <q-menu v-if="item1.cp.length==0" touch-position context-menu transition-show="jump-down" transition-hide="jump-up">
		          	<q-list style="min-width: 100px">
		            	<q-item dense class="q-pa-none">
		              		<q-btn v-close-popup dense class="full-width q-px-md" label="列配置" flat @click="openCol(index,index1)"/>
		            	</q-item>
		            	<q-item dense class="q-pa-none">
		            		<q-btn v-close-popup dense class="full-width q-px-md" label="框架配置" flat @click="openRow(index)"/>
		             	 	<q-btn v-close-popup flat dense icon="o_delete" @click="deleteRow(index)"/>
		            	</q-item>
		          	</q-list>
		        </q-menu>
			</div>
		</div>
		<div class="row items-center justify-center q-py-md">
			<q-btn dense color="red-10" icon="o_add" class="q-px-sm" label="添加主框架" @click="$refs.insertRow.showPanel()"/>
		</div>

		<footer1 v-if="page.footer==1"/>
	</div>

	<bottommenu @showSettings="$refs.settingsPanel.showPanel()" @showAdd="$refs.addPanel.showPanel()"></bottommenu>
	<!-- 面板 -->
	<settingsPanel ref="settingsPanel" :page.sync="page" @savePage="savePage" @resetPage="resetPage"/>
	<addPanel ref="addPanel"/>
	<!-- 插入主面板 -->
	<insertRow ref="insertRow" @addRow="addRow"/>
	<!-- 行配置 -->
	<configRow ref="configRow" v-if="page.content.length>0" :row.sync="action.row"/>
	<!-- 列配置 -->
	<configCol ref="configCol" v-if="page.content.length>0" :col.sync="action.col" @reflesh="reflesh"/>

	<!-- imgtext1 -->
	<imgtext1 ref="imgtext1" @reflesh="refleshCP"/>
	<imgtext2 ref="imgtext2" @reflesh="refleshCP"/>
</div></template>
<script>
import './css/common.css'
import bottommenu from './tool/bottommenu'
import settingsPanel from './panel/settingsPanel'
import addPanel from './panel/addPanel'

import header1 from './components/header/header1'
import header2 from './components/header/header2'
import header4 from './components/header/header4'

import footer1 from './components/footer/footer1'

import insertRow from './components/insertRow'
import configRow from './components/configRow'
import configCol from './components/configCol'

import imgtext1 from './components/imgtext/imgtext1'
import imgtext2 from './components/imgtext/imgtext2'
export default{
name:'page',
components:{bottommenu,settingsPanel,insertRow,header1,header2,header4,footer1,configRow,configCol,addPanel,imgtext1,imgtext2},
props:['pid'],
data(){return {
	nav:[],
	page:{pid:0,title:'',createdate:0,content:[],img:'',backimg:'',header:0,footer:0,valid:0},
	serverpage:{pid:0,title:'',createdate:0,content:[],img:'',backimg:'',header:0,footer:0,valid:0},
	action:{index:0,index1:0,index2:0,row:'',col:'',cp:''},
}},
mounted(){
	this.$store.state.config.header = false
	this.getNav()
	this.getPage()
},
methods:{
	getNav(){
        this.axios.post('nav').then(response=>{
            this.nav = Object.assign([],[],response)
        })
    }, 
    getPage(){
    	if(this.pid == 0){
    		return 
    	}
    	this.$q.loading.show({message:'请稍等，正在加载页面信息'})
    	this.axios.post('page',{pid:this.pid}).then(res=>{
    		this.page = Object.assign({},{},res)
    		this.serverpage = JSON.parse(JSON.stringify(res))
    		this.$q.loading.hide()
    	})
    },
    savePage(){
    	if(!this.page.title){
    		this.AItip('标题不能为空');return;
    	}
    	this.axios.post(this.page?'savePage':'addPage',this.page).then(res=>{
    		this.$router.push('/pages')
    	})
    },
    resetPage(){
    	this.page = Object.assign({},{},this.serverpage)
    },
	addRow(row){
		this.page.content.push(row)
	},
	openRow(index){
		this.action.row = this.page.content[index]
		this.$refs.configRow.showPanel()
	},
	deleteRow(index){
		this.page.content.splice(index,1)
	},
	openCol(index,index1){
		this.action.col = this.page.content[index].col[index1]
		this.$refs.configCol.showPanel()
	},
	deleteCP(index,index1,index2){
		this.page.content[index].col[index1].cp.splice(index2,1)
	},
	openCP(index,index1,index2){
		this.action.index = index
		this.action.index1 = index1
		this.action.index2 = index2
		let cp = JSON.parse(JSON.stringify(this.page.content[index].col[index1].cp[index2]))
		console.log(cp.t)
		this.$refs[cp.t].showPanel(cp)
	},
	reflesh(){
		this.page = Object.assign({},{},this.page)
	},
	refleshCP(cp){
		this.$set(this.page.content[this.action.index].col[this.action.index1].cp,this.action.index2,cp)
	},
	onDragStart(e,item,i,i1,i2){
		e.dataTransfer.setData('cp',JSON.stringify(item))
		e.dataTransfer.setData('i',i)
		e.dataTransfer.setData('i1',i1)
		e.dataTransfer.setData('i2',i2)
		e.dataTransfer.setData('mode','relocal')
		e.dataTransfer.dropEffect = 'move'
		e.target.classList.add('mm')
	},
	onDragEnter(e){
		if (e.target.draggable !== true) {
			e.target.classList.add('adding')
		}
	},
	onDragLeave(e){
		e.target.classList.remove('adding')
	},
	onDragOver(e) {
      e.preventDefault()
    },
	onDrop(e,index,index1,index2=false){
		e.target.classList.remove('adding')
		let com = JSON.parse(e.dataTransfer.getData('cp'))

		if(e.dataTransfer.getData('mode') == 'relocal'){
			let i = e.dataTransfer.getData('i')
			let i1 = e.dataTransfer.getData('i1')
			let i2 = e.dataTransfer.getData('i2')
			this.page.content[i].col[i1].cp.splice(i2,1)
		}
		if(!index2){
			this.page.content[index].col[index1].cp.push(com)
		}
	},

},
watch:{},
destroyed(){
	this.$store.state.config.header = true
},
}
</script>
<style scoped>
#page{width:100%;min-height:960px;}
.nullcol{border:1px dashed #000;height:80px;}
.adding{border:3px solid #000!important;height:46px!important;}
</style>