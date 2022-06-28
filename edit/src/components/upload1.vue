<template><div>
	<q-img :ratio="16/9" :src="img">
		<div class="text-center absolute-full flex flex-center">
           	<q-btn dense :icon="img?'o_cached':'o_publish'" flat @click="openfileselect"/>
           	<q-btn dense icon="o_close" class="q-ml-sm" flat v-if="img" @click="toNull"/>
        </div>
        <div class="text-center text-caption absolute-top-left">{{intro?intro:'封面'}}</div>
	</q-img>
	<input multiple type="file" :id="id" hidden @change="updateFile" :accept="type"/>
</div></template>
<script>
export default{
name:'upload1',
components:{},
props:['intro','img'],
data(){return {
	id:'image',limit:2,
	type:'image/jpeg,image/png,image/x-icon,image/gif,application/msword,text/plain,application/pdf,aplication/zip',
}},
mounted(){
	this.id = Math.random().toString(36).slice(2);
},
methods:{
	openfileselect(){
		let file = document.getElementById(this.id);
       	file.click();
	},
	duageFileType(file){
		let res = this.type.indexOf(file.type)
		if(res>=0){
			return true
		}else{
			return false
		}
	},
	duageFileSize(file){
		if(file.size/1024/1024 >= this.limit){
			return false;
		}else{
			return true;
		}
	},
	updateFile(){
		this.$q.loading.show({
			'message':'文件上传中'
		})
		var filed = document.getElementById(this.id);
		var param = new FormData();
		for(let i=0;i<filed.files.length;i++){
			if(!this.duageFileSize(filed.files[i])){
				this.AItip('文件大于2M，请压缩后上传');return;
			}
			if(!this.duageFileType(filed.files[i])){
				this.AItip('文件格式不被允许');return;
			}
			param.append("file"+i,filed.files[i]);
		}

		this.axios.post('upload',param).then(response=>{
			this.uploadbackIn(response)
			this.$q.loading.hide()
		}).catch(err=>{
			this.$q.loading.hide()
		})
	},
	uploadbackIn(imgs){
		this.$emit('update:img',imgs[0])
		this.$emit('reflesh')
	},
	toNull(){
		this.$emit('update:img','')
		this.$emit('reflesh')
	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>