<style scoped>
	
</style>
<template><div>
	<input multiple type="file" :id="id" hidden @change="updateFile" :accept="type"/>
	<q-btn v-if="!icon" dense class="full-width" color="grey-6" icon="recent_actors" :label="label?label:'上传图片'" @click="openfileselect" :disable="disable"/>
	<q-btn v-if="icon" :icon="icon" :dense="dense==''" :size="size" @click="openfileselect" :disable="disable"/>
</div></template>
<script>
export default{
	name:'uploadcom',
	props:['label','icon','iid','disable','dense','size'],
	data:()=>({
		id:'file',
		type:'image/jpeg,image/png,image/x-icon,image/gif',
		limit:2
	}),
	mounted(){
		this.id = this.iid?this.iid:this.id
	},
	methods:{
		uploadbackIn(imgs){
			this.$emit('change',imgs)
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

			this.axios.post('uploadImg',param).then(response=>{
				this.uploadbackIn(response)
				this.$q.loading.hide()
			}).catch(err=>{
				this.$q.loading.hide()
			})
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
		openfileselect(){
			let file = document.getElementById(this.id);
        	file.click();
		},
	},
	destroyed(){
	}
}
</script>