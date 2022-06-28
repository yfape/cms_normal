<style scoped>
.content{max-height:100px;padding:7.5px 3%;overflow:hidden;width:90%;margin:0 auto;border-radius:5px;clear:both;}
.content:hover{background:#fff}
.content:hover .intro{color:#000}
.content:hover .title{font-weight:bold}
.faceimg{height:100%;width:35%;float:left;}
.faceimg img{height:100%;width:100%;}
.texts{height:100%;margin-left:5%;width:60%;float:left;}
.title{max-height:45px;font-size:16px;margin-bottom:5px;overflow:hidden;}
.smarts{max-height:85px;line-height:16px;}
.intro{min-height:40px;font-size:12px;color:#9E9E9E;}
.intro>.xx{color:#B71C1C;}

.books{transition:box-shadow 0.3s;cursor:pointer;}
.books:hover{box-shadow:5px 5px 10px #AFB2B2,-5px -5px 10px #AFB2B2}
.jgx{width:84%;margin:0 auto}
.twos{width:84%;margin:0 auto}
</style>
<template><div>
<div v-for="(item,index) in content" @click="goUrl(item.id)">
	<div class="content books yf-title" v-if="item.faceimg">
	    <div>
			<div class="faceimg"><q-img :src="item.faceimg"/></div>
		    <div class="texts">
		      	<div :class="{title:true,smarts:!(intro==='')}" :style="{'font-size':titlesize}">{{item.title}}</div>
		      	<div class="intro" v-if="intro===''">{{item.intro}} <span class="xx">『详细』</span></div>
		    </div>
	    </div>
	</div>
	<div v-if="!item.faceimg" class="content books yf-title">
		<div class="title" :style="{'font-size':titlesize}">{{item.title}}</div>
		<div class="intro" v-if="intro===''">{{item.intro}} <span class="xx">『详细』</span></div>
	</div>
	<q-separator v-if="index!==(content.length-1)" class="jgx"/>
</div>
</div></template>
<script>
export default{
	name:'ContentList2',
	props:['content','intro','titlesize'],
	data:()=>({
		
	}),
	mounted(){

	},
	methods:{
		goUrl(aid){
			this.$router.push('/article/'+aid)
		}
	}
}
</script>