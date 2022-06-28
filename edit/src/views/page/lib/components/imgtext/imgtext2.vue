<template>
	<q-dialog v-model="show" position="bottom">
		<q-card class="row" style="min-width:1200px">
			<div class="col-3 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">图片</div>
				<q-input dense filled color="red-10" label="图片地址" v-model="cp.img" @input="reflesh">
					<template v-slot:append>
						<q-btn flat dense icon="o_link" @click="">
							<q-popup-edit v-model="test">
				              <q-btn class="text-teal" flat label="文章" @click="$refs.selectarticle.showd()"/>
				              <q-btn class="text-teal" flat label="专题" @click="$refs.selecttopic.showd()"/>
				              <q-btn class="text-teal" flat label="杂志" @click="$refs.selectmagazine.showd()"/>
				            </q-popup-edit>
						</q-btn>
					</template>
				</q-input>
				<upload1 class="q-mt-sm" intro="图片" :img.sync="cp.img" @reflesh="reflesh"/>
				<!-- <margin :data.sync="row"/>
				<flex :data.sync="row"/> -->
			</div>
			<div class="col-3 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">文字</div>
				<q-input dense filled class="q-mb-sm" color="red-10" label="文字" v-model="cp.tt" @input="reflesh"/>
			    <div class="q-mb-sm bg-grey-2 row justify-between items-center">
			    	<span class="text-caption text-grey q-pl-sm">水平分布：</span>
				    <q-btn-toggle dense v-model="cp.tj" toggle-color="red-10" flat
	        		:options="$store.state.textjustify" @input="reflesh"/>
			    </div>
			    <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{cp.tb==1?'加租':'不加粗'}}</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="cp.tb" :true-value="1" :false-value="0" @input="reflesh"/>
			        </q-item-section>
			    </q-item>
			    <q-badge class="q-mt-sm" color="grey">字号：{{cp.ts}}px</q-badge>
				<q-slider dense v-model="cp.ts" :min="10" :max="48" :step="2" color="red-10" @input="reflesh"/>
    		</div>
    		<div class="col-3 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">属性</div>
				<q-input filled color="red-10" label="宽度(例 100%,300px)" v-model="cp.w" dense class="q-mb-sm" @input="reflesh"/>
				<q-input filled color="red-10" label="高度(例 200px,auto)" v-model="cp.h" dense class="q-mb-sm" @input="reflesh"/>
				
				<q-input dense filled color="red-10" label="链接地址" class="q-mb-sm" v-model="cp.u" @input="reflesh"/>
				<div class="bg-grey-2 row justify-between items-center q-mb-sm">
			    	<span class="text-caption text-grey q-pl-sm">水平分布：</span>
				    <q-btn-toggle dense v-model="cp.ta" toggle-color="red-10" flat
	        		:options="$store.state.textjustify" @input="reflesh"/>
			    </div>
			    <q-input filled dense label="背景色" color="red-10" v-model="cp.bc" class="q-mt-sm" @input="reflesh">
			        <template v-slot:append>
			          	<q-icon name="colorize" class="cursor-pointer">
			            	<q-popup-proxy transition-show="scale" transition-hide="scale">
			              		<q-color v-model="cp.bc" format-model="hex" no-header/>
			            	</q-popup-proxy>
			          	</q-icon>
			          	<q-btn flat icon="close" dense @click="cp.bc='transparent'"/>
			        </template>
			    </q-input>
    		</div>
    		<div class="col-3 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">布局</div>
				<margin :data.sync="cp" @reflesh="reflesh"/>
				<q-select v-model="cp.p" :options="$store.state.paddings" filled emit-value map-options option-value="value" option-label="text" label="内边距" dense color="red-10" class="q-mb-sm" @input="reflesh"/>
			</div>
		</q-card>
		<selectarticle ref="selectarticle" @change="function(data){setcontent(data,'article')}"></selectarticle>
		<selecttopic ref="selecttopic" @change="function(data){setcontent(data,'page')}"></selecttopic>
		<selectmagazine ref="selectmagazine" @change="function(data){setcontent(data,'magazine')}"></selectmagazine>
	</q-dialog>
</template>
<script>
import upload1 from '@/components/upload1'
import selectarticle from '@/components/dialog/selectarticle'
import selecttopic from '@/components/dialog/selecttopic'
import selectmagazine from '@/components/dialog/selectmagazine'
import margin from '../temp/margin'

export default{
name:'imgtext2',
props:[],
components:{upload1,selectarticle,selecttopic,selectmagazine,margin},
data(){return {
	show:false,cp:{},test:'',
}},
mounted(){},
methods:{
	showPanel(data){
		this.cp = data
		this.initd()
		this.show=true
	},
	initd(){
		this.cp.ct = this.cp.ct?this.cp.ct:0
		this.cp.it = this.cp.it?this.cp.it:0
		this.cp.gra = this.cp.gra?this.cp.gra:0
		this.cp.tb = this.cp.tb?this.cp.tb:0
		this.cp.w = this.cp.w?this.cp.w:'100%'
	},
	setcontent(data,arg='article'){
      	if(arg=='article'){
        	this.cp.tt = data[0].title
        	this.cp.img = this.cp.it?data[0].thumbnail:data[0].faceimg
        	this.cp.u = '/'+arg+'/'+data[0].aid
      	}else if(arg=='page'){
        	this.cp.tt = data[0].title
        	this.cp.img = data[0].img
        	this.cp.u = '/'+arg+'/'+data[0].pid
      	}else{
      		this.cp.tt = data[0].title
        	this.cp.img = data[0].img
        	this.cp.u = '/'+arg+'/'+data[0].zid
      	}
      	this.reflesh()
    },
	reflesh(){
		this.cp = Object.assign({},{},this.cp)
		this.$emit('reflesh',this.cp);
	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>