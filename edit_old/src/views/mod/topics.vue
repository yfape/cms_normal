<style scoped>
.ys{max-width:400px;cursor:pointer;border:1px dashed #838383;}
.unshow{filter:contrast(0.5);}
</style>
<template><div v-if="show">
	<div class="q-pa-md">
		<q-card class="no-shadow q-pa-sm q-mb-md">
			<q-btn color="grey-6" label="新增专题" @click="gotopic(-1)"/>
		</q-card>
		<div class="row q-gutter-md">
			<q-img contain :class="{ys:true,unshow:!item.valid}" v-for="item in content" :ratio="16/9" :src="item.img" @click="gotopic(item.tid)">
				<div class="absolute-bottom text-subtitle1 text-center">
            		{{item.title}}
          		</div>
			</q-img>
		</div>
	</div>
</div></template>
<script>
export default{
name:'topics',
components:{},
data:()=>({
	show:false,content:[]
}),
created(){},
mounted(){
	this.getData()
},
methods:{
	getData(){
		this.$q.loading.show()
		this.axios.post('getTopics').then(res=>{
			this.content = Object.assign([],[],res.topics)
			this.show = true
			this.$q.loading.hide()
		})
	},
	gotopic(tid){
		this.$router.push('/topic/'+tid)
	}
}
}
</script>