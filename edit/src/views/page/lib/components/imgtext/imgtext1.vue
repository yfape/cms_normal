<template>
	<q-dialog v-model="show" position="bottom">
		<q-card class="row" style="min-width:900px">
			<div class="col-4 q-pa-md">
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
			    <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{cp.it==1?'缩略图':'原图'}}</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="cp.it" :true-value="1" :false-value="0" @input="reflesh"/>
			        </q-item-section>
			    </q-item>
				<!-- <margin :data.sync="row"/>
				<flex :data.sync="row"/> -->
			</div>
			<div class="col-4 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">文字</div>
				<q-input dense filled class="q-mb-sm" color="red-10" label="文字" v-model="cp.tt" @input="reflesh"/>
				<q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{cp.gra==1?'渐变':'半透明'}}</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="cp.gra" :true-value="1" :false-value="0" @input="reflesh"/>
			        </q-item-section>
			    </q-item>
			    <div class="bg-grey-2 row justify-between items-center">
			    	<span class="text-caption text-grey q-pl-sm">水平分布：</span>
				    <q-btn-toggle dense v-model="cp.tj" toggle-color="red-10" flat
	        		:options="[
			          	{icon: 'o_format_align_left', value: 'text-left'},
			          	{icon: 'o_format_align_center', value: 'text-center'},
			          	{icon: 'o_format_align_right', value: 'text-right'}
			        ]" @input="reflesh"/>
			    </div>
    		</div>
    		<div class="col-4 q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">属性</div>
				<q-input filled color="red-10" label="宽度(例 100%,300px)" v-model="cp.w" dense class="q-mb-sm" @input="reflesh"/>
				<q-input filled color="red-10" label="高度(例 200px,auto)" v-model="cp.h" dense class="q-mb-sm" @input="reflesh"/>
				<q-input dense filled color="red-10" label="链接地址" class="q-mb-sm" v-model="cp.u" @input="reflesh"/>
				<div class="bg-grey-2 row justify-between items-center q-mb-sm">
			    	<span class="text-caption text-grey q-pl-sm">水平分布：</span>
				    <q-btn-toggle dense v-model="cp.ta" toggle-color="red-10" flat
	        		:options="[
			          	{icon: 'o_format_align_left', value: 'text-left'},
			          	{icon: 'o_format_align_center', value: 'text-center'},
			          	{icon: 'o_format_align_right', value: 'text-right'}
			        ]" @input="reflesh"/>
			    </div>
			    <q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{cp.ct==1?'包含模式':'伸展模式'}}</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="cp.ct" :true-value="1" :false-value="0" @input="reflesh"/>
			        </q-item-section>
			    </q-item>
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

export default{
name:'imgtext1',
props:[],
components:{upload1,selectarticle,selecttopic,selectmagazine},
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