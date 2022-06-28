<template>
<div class="q-pa-md">
	<q-input label="开始" v-model="start"/><br>
	<q-input label="结束" v-model="end"/><br>
	<q-btn label="begin" color="blue" @click="importarticle"/>

	<br><br><br>

	<div style="height:600px;overflow-y:auto;"><div v-for="item in res" class="bg-white q-mb-md">{{item}}</div></div>
</div>
</template>

<script>
export default {
name: 'importarticle',
components:{},
data:()=>({
	start:0,end:0,res:[],yes:false,now:0,
}),
created(){

},
mounted(){

},
methods:{
	importarticle(){
		this.$q.loading.show()
		this.axios.post('http://api.scdjw.net/importArticle',{'start': parseInt(this.start)}).then(res=>{
			if(res.code==200){
				this.res.unshift({'aid':this.start,res:res.data})
				this.autorun()
			}else{
				this.res.unshift({'aid':this.start,res:'失败'})
				this.autorun()
			}
		})
	},
	autorun(){
		this.start = parseInt(this.start)+1
		if(this.start > this.end){
			this.AItip('执行完毕')
			this.$q.loading.hide()
			return
		}else{
			this.importarticle()
		}
	}
}
}
</script>
