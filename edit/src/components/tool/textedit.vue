<template><div>
	<q-dialog v-model="show" persistent>
		<q-card style="min-width:1000px">
			<q-bar>
	          	<div>图文模块</div>
	          	<q-space />
	          	<q-btn dense flat icon="close" v-close-popup/>
		    </q-bar>
			<q-item v-for="item,index in record" v-if="index<len">
				<div class="row full-width items-center">
					<div class="col-9 row items-center">
						<div class="col-10">
							<div>{{item.title}}</div>
							<div v-if="intro" class="text-caption text-grey-6">{{item.intro}}</div>
							<div v-if="item.url" class="text-caption text-grey-6">{{item.url}}</div>
						</div>
						<div class="col-2">
							<q-img v-if="item.img" :src="item.img" class="full-width" :ratio="16/9" contain>
								<q-btn flat icon="close" color="red-8" dense @click="item.img=''"/>
							</q-img>
						</div>
						
					</div>
					<div class="col-3 text-right row justify-end">
						<q-btn icon="code" dense size="12px" class="q-ml-sm">
							<q-popup-edit v-model="test" class="inin">
				              	<q-input v-model="item.title" class="inin" color="red-10" dense autofocus label="标题"/>
				              	<q-input v-if="intro" v-model="item.intro" class="inin" color="red-10" dense autofocus label="简介"/>
				              	<q-input v-model="item.url" class="inin" color="red-10" dense autofocus label="链接"/>
				            </q-popup-edit>
						</q-btn>
						<upbtn icon="image_search" dense size="12px" class="q-ml-sm" :iid="'t'+index" @change="function(imgs){item.img=imgs[0]}"/>
						<q-btn dense icon="link" class="q-ml-sm" size="12px">
				            <q-popup-edit v-model="test">
				              	<q-btn class="text-teal" flat label="文章" @click="openselect(index,1,'selectarticle')"/>
				              	<q-btn class="text-teal" flat label="专题" @click="openselect(index,1,'selecttopic')"/>
				              	<q-btn class="text-teal" flat label="杂志" @click="openselect(index,1,'selectmagazine')"/>
				            </q-popup-edit>
				        </q-btn>
						<q-btn icon="delete_outline" dense size="12px" class="q-ml-sm" @click="deleteItem(index)"/>
						<q-btn icon="expand_less" dense size="12px" class="q-ml-sm" @click="sortUp(index)"/>
						<q-btn icon="expand_more" dense size="12px" class="q-ml-sm" @click="sortDown(index)"/>
					</div>
				</div>
			</q-item>
			<q-separator />
			<q-card-actions align="right">
		        <q-btn class="q-px-sm q-ml-sm" flat dense icon="add" label="新增" @click="addNew" :disable="disable"/>
		        <q-btn class="q-px-sm q-ml-sm" flat dense icon="playlist_add" label="批量新增" @click="goSelect(-1,len-record.length)" :disable="disable"/>
		        <q-btn class="q-px-sm q-ml-sm" dense icon="save_alt" color="red-10" label="保存" @click="saveContent"/>
	      	</q-card-actions>
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
name:'textedit',
components:{upbtn,selectarticle,selecttopic,selectmagazine},
data(){return {
	show:false,disable:false,
	record:[],old:[],mid:0,cid:0,index:0,faceimg:0,len:0,intro:0,link:0,test:'',
}},
mounted(){},
methods:{
	showPanel(data,len=6){
		this.len = len
		this.record = Object.assign([],[],data)
		this.old = JSON.parse(JSON.stringify(data))
		this.show = true
	},
	addNew(){
		this.record.push({aid:-1,title:'请输入标题'})
	},
	deleteItem(i){
		this.record.splice(i,1)
	},
	saveContent(){
		for(let i in this.record){
			if(!this.record[i].img){
				delete this.record[i].img
			}
			if(!this.record[i].aid){
				delete this.record[i].aid
			}
			if(!this.record[i].intro){
				delete this.record[i].intro
			}
		}

		let res = this.record.slice(0,this.len)

		this.$emit('save',res)
		this.show = false
	},
	sortUp(i){
		if(i==0){return;}
		let temp = Object.assign({},{},this.record[i])
		this.record[i] = Object.assign({},{},this.record[i-1])
		this.record[i-1] = Object.assign({},{},temp)
		this.record = Object.assign([],[],this.record)
	},
	sortDown(i){
		if(i==this.record.length-1){return;}
		let temp = Object.assign({},{},this.record[i])
		this.record[i] = Object.assign({},{},this.record[i+1])
		this.record[i+1] = Object.assign({},{},temp)
		this.record = Object.assign([],[],this.record)
	},
	changeImg(imgs){
		console.log(imgs)
	},
	selectArticle(data){
		if(this.index!==-1){
			let res = {aid:data[0].aid,title:data[0].title,img:this.faceimg?data[0].faceimg:data[0].thumbnail}
			this.$set(this.record,this.index,res)
		}else{
			for(let i in data){
				let res = {aid:data[i].aid,title:data[i].title,img:this.faceimg?data[i].faceimg:data[i].thumbnail}
				this.record.push(res)
			}
		}
	},
	goSelect(index,len=1){
		this.index = index
		this.$refs.selectarticle.showd(this.cid,len)
	},
	setcontent(data,arg='article'){
      if(arg=='article'){
        this.record[this.tempindex].url = '/'+arg+'/'+data[0].aid
        this.record[this.tempindex].img = data[0]['faceimg']
      }else if(arg=='topic'){
      	this.record[this.tempindex].img = data[0]['img']
        this.record[this.tempindex].url = '/'+arg+'/'+data[0].tid
      }else{
      	this.record[this.tempindex].img = data[0]['img']
        this.record[this.tempindex].url = '/'+arg+'/'+data[0].zid
      }
      this.record[this.tempindex].title = data[0]['title']
    },
    openselect(index,len=1,arg='selectarticle'){
    	this.tempindex = index
    	this.$refs[arg].showd()
    },
},
watch:{
	'record'(){
		if(this.record.length>=this.len){
			this.disable = true
		}else{
			this.disable = false
		}
	}
},
destroy(){},
}
</script>
<style scoped>

</style>