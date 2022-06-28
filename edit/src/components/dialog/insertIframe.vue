<style>

</style>
<template>
<q-dialog v-model="show" @hide="initData">
	<q-card style="width:700px;max-width:1100px" class="row q-col-gutter-md">
		<div class="col-5 q-pa-md">
			<q-input label="视频代码" class="q-pb-sm" v-model="code" filled type="textarea" color="red-10"/>
			<div class="q-pa-sm">
				<q-badge color="secondary">长宽比: {{ wh }}</q-badge>
				<q-slider v-model="wh" :step="0.01" :min="0.4" :max="1.8" color="red-10"/>
			</div>
			<q-btn label="插入视频" color="teal-6" class="full-width" @click="insert"/>
		</div>
		<div class="col-7 row items-center text-center justify-center" style="overflow:hidden;">
			<div v-html="showcode" v-if="code"></div>
			<div v-if="!code">暂无视频展示</div>
		</div>
	</q-card>
</q-dialog>
</template>
<script>
export default{
name:'insertIframe',
props:[],
data:()=>({
	show:false,
	code:'',
	wh:0.56,
	mywidth:300,myheight:168,
	src:'',
	showcode:''
}),
created(){
	this.initData()
},
mounted(){

},
methods:{
	initData(){
		this.code = ''
		this.show = false
		this.wh = 0.56
		this.width = 500
		this.height = 300
		this.src = ''
		this.showcode = ''
	},
	myshow(){
		this.show = true
	},
	setCodeShow(){
		this.showcode = '<iframe style="width:'+this.mywidth+'px;height:'+this.myheight+'px" iframeborder="0" src="'+this.src+'" allowFullScreen="true"></iframe>'
	},
	makeIframe(){
		if(!this.code){
			return
		}
		let temp = this.code.match(/(http|https){1}:\/\/[^"'\s]*/);
		this.src=temp[0]
	},
	setWH(){
		if(this.wh<=1){
			this.mywidth=260
			this.myheight=this.wh*260
		}else{
			this.myheight=260
			this.mywidth=260/this.wh
		}
	},
	insert(){
		let outcode = '<p style="max-width:90%;text-align:center"><iframe style="width:400px;height:'+400*this.wh+'px;max-width:90%" iframeborder="0" src="'+this.src+'" allowFullScreen="true"></iframe></p>'
		this.$emit('inIframe',outcode)
		this.show = false
	}
},
watch:{
	"wh"(){
		this.setWH()
		this.setCodeShow()
	},
	'code'(){
		this.makeIframe()
		this.setCodeShow()
	}
},
destory(){
	
}
}
</script>