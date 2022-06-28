<style src="../common.css" scoped></style>
<style scoped>
.main{height:45px;width:100%;overflow:hidden;}
.main>#fk{float:left;height:20px;border-left:5px solid #B71C1C;width:12px;margin-top:13px}
.main>img{height:100%;}
.main>p{float:right;height:45px;;line-height:45px;padding-right:10px;font-size:12px;color:#9E9E9E;cursor:pointer;}
.main>p:hover{color:#B71C1C}
#title{float:left;height:45px;;line-height:45px;width:100px;font-weight:bold;font-size:18px;font-family:'黑体'}
</style>
<template>
	<div class="main">
	  	<div id="fk"></div>
	  	<img :src="img" v-if="!title"/>
	  	<div id="title" v-if="title">{{title}}</div>
	  	<p @click="goUrl">更多</p>
	</div>
</template>
<script>
export default{
	name:'TM2',
	props:['img','url','title'],
	data:()=>({

	}),
	methods:{
		goUrl(){
			this.$router.push(this.url)
		}
	}
}
</script>