<style scoped>

</style>
<template><div v-if="show">
	<q-dialog v-model="show" persistent>
		<q-card style="min-width:1000px">
			<q-bar>
	          	<div>图文数据模块</div>
	          	<q-space />
	          	<q-btn dense flat icon="close" v-close-popup/>
		    </q-bar>
			<q-item v-for="item,index in record" v-if="index<len">
				<div class="row full-width items-center">
					<div class="col-9 row items-center">
						<div class="col-8">
							<div>{{item.title}}</div>
							<div v-if="intro" class="text-caption text-grey-6">{{item.intro}}</div>
						</div>
						<div class="col-2">
							<div class="text-grey text-caption">{{item.url}}</div>
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
						<upbtn icon="image_search" dense size="12px" class="q-ml-sm" :iid="'t'+index" @change="function(imgs){item.img=imgs[0];var t=item.title;item.title='';item.title=t;}"/>
						<q-btn icon="link" dense size="12px" class="q-ml-sm">
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
		        <q-btn class="q-px-sm q-ml-sm" flat dense icon="playlist_add" label="批量新增" @click="openselect(-1,len-record.length,'selectarticle')" :disable="disable"/>
	      	</q-card-actions>
		</q-card>
	</q-dialog>
	<selectarticle ref="selectarticle" @change="setarticle"></selectarticle>
	<selecttopic ref="selecttopic" @change="settopic"></selecttopic>
	<selectmagazine ref="selectmagazine" @change="setmagazine"></selectmagazine>
</div></template>
<script>
import upbtn from '@/components/UploadCom'
import selectarticle from '@/components/dialog/selectarticle'
import selecttopic from '@/components/dialog/selecttopic'
import selectmagazine from '@/components/dialog/selectmagazine'

export default{
name:'messimgtext',
components:{upbtn,selectarticle,selecttopic,selectmagazine},
props:[],
data:()=>({
	disable:false,show:false,test:'',
	mid:0,cid:0,index:0,len:5,
	record:[],
}),
mounted(){

},
methods:{
	showd(obj){
		this.record = Object.assign([],[],obj.content)
		this.len = (typeof obj.count)=='number'?obj.count:5
		this.intro = obj.intromode?obj.intromode:0
		this.isthumbnail = obj.isthumbnail?obj.isthumbnail:0
		this.show = true
	},
	addNew(){
		this.record.push({id:-1,title:'请输入标题',url:''})
	},
	deleteItem(i){
		this.record.splice(i,1)
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
	
	openselect(index,len=1,arg='selectarticle'){
		this.index = index
		this.$refs[arg].showd(this.cid,len)
	},
	setarticle(data){
		if(this.index!=-1){
			let res = {id:this.index+1,title:data[0].title,img:!this.isthumbnail?data[0].faceimg:data[0].thumbnail,url:'/article/'+data[0].aid}
			this.$set(this.record,this.index,res)
		}else{
			for(let i in data){
				let res = {id:this.record.length+1,title:data[i].title,img:!this.isthumbnail?data[i].faceimg:data[i].thumbnail,url:'/article/'+data[i].aid}
				this.record.push(res)
				this.$set(this.record,res.id-1,res)
			}
		}
	},
    settopic(data){
		let res = {id:this.index+1,title:data[0].title,img:data[0].img,url:'/topic/'+data[0].tid}
		this.$set(this.record,this.index,res)
    },
    setmagazine(data){
    	let res = {id:this.index+1,title:data[0].title,img:data[0].img,url:'/magazine/'+data[0].zid}
		this.$set(this.record,this.index,res)
    },
    reflesh(){
    	this.$emit('reflesh',this.record)
    }
},
watch:{
	'record'(){
		if(this.record.length>=this.len){
			this.disable = true
		}else{
			this.disable = false
		}
		this.reflesh()
	}
}
}
</script>