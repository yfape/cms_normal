<style src="../common.css" scoped></style>
<style scoped>
.back{background-size:100%;background-repeat:no-repeat;padding:20px 100px;}
</style>
<template><div v-if="show">
	<q-dialog v-model="show" persistent>
		<q-card style="min-width:400px">
			<q-bar>
	          	<div>顶部大专题</div>
	          	<q-space />
	          	<q-btn dense flat icon="close" v-close-popup/>
		    </q-bar>
			<q-card-section>
				<q-item dense clickable class="bg-grey-4">
					<q-item-section>{{record.valid?'启用':'禁用'}}</q-item-section>
					<q-item-section thumbnail class="text-right">
						<q-toggle v-model="record.valid" color="red-10" true-value="1" false-value="0"/>
					</q-item-section>
				</q-item>
				<div class="row q-mt-sm back" :style="'background-image:url('+record.backimg+')'">
					<img :src="record.faceimg" class="full-width"/>
				</div>
				<div class="row q-mt-sm">
					<q-input filled color="red-10" label="链接" v-model="record.url" dense :disable="!record.valid" class="full-width">
				        <template v-slot:append>
				          <q-btn dense icon="link" flat>
				            <q-popup-edit v-model="test">
				              <q-btn class="text-teal" flat label="文章" @click="$refs.selectarticle.showd()"/>
				              <q-btn class="text-teal" flat label="专题" @click="$refs.selecttopic.showd()"/>
				              <q-btn class="text-teal" flat label="杂志" @click="$refs.selectmagazine.showd()"/>
				            </q-popup-edit>
				          </q-btn>
				        </template>
				    </q-input>
				</div>
				<div class="row q-mt-sm">
					<upbtn v-if="mode" label="更换前景图" iid="fup" class="col-6 q-pr-xs" @change="changeFaceimg" :disable="!record.valid"></upbtn>
					<upbtn v-if="mode" label="更换背景图" iid="bup" class="col-6 q-pl-xs" @change="changeBackimg" :disable="!record.valid"></upbtn>
					<upbtn v-if="!mode" label="更换图片" iid="fup1" class="col-12" @change="changeFaceimg" :disable="!record.valid"></upbtn>
				</div>
				<div class="row q-mt-sm">
					<q-btn dense color="brown-5" label="保存" class="full-width" @click="$emit('changeContent',mid,record)" v-close-popup/>
				</div>

			</q-card-section>
		</q-card>
	</q-dialog>
	<selectarticle ref="selectarticle" @change="function(data){setcontent(data,'article')}"></selectarticle>
	<selecttopic ref="selecttopic" @change="function(data){setcontent(data,'topic')}"></selecttopic>
	<selectmagazine ref="selectmagazine" @change="function(data){setcontent(data,'magazine')}"></selectmagazine>
</div></template>
<script>
import upbtn from '@/components/UploadCom'
import selectarticle from '@/components/dialog/selectarticle'
import selecttopic from '@/components/dialog/selecttopic'
import selectmagazine from '@/components/dialog/selectmagazine'

export default{
name:'toptopic',
components:{upbtn,selectarticle,selecttopic,selectmagazine},
props:[],
data:()=>({
	show:false,mid:0,mode:1,test:'',
	record:{
		show:'0',valid:'0',backimg:'',faceimg:'',url:'',
	},
	old:{}
}),
mounted(){

},
methods:{
	showd(mid,data,mode=1){
		this.mid = mid
		this.mode = mode
		console.log(data)
		if(data=={}||data==[]||data.length==0){
			this.record = {show:0,valid:0,backimg:'',faceimg:'',url:'',}
		}else{
			this.record = Object.assign({},{},data)
			this.old = Object.assign({},{},data)
		}
		this.show = true
	},
	changeFaceimg(img){
		this.record.faceimg = img[0]
	},
	changeBackimg(img){
		this.record.backimg = img[0]
	},
	setcontent(data,arg='article'){
      if(arg=='article'){
        this.record.url = '/'+arg+'/'+data[0].aid
      }else if(arg=='topic'){
        this.record.url = '/'+arg+'/'+data[0].tid
      }else{
        this.record.url = '/'+arg+'/'+data[0].zid
      }
    }
}
}
</script>