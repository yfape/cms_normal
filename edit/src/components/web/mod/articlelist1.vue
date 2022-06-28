<style src="../common.css" scoped></style>
<style scoped>
#main{width:100%;font-size:18px;}
.item{cursor:pointer;}
.item:hover{color:#B71C1C;}
.bolditem{font-weight:bold;font-size:22px;}
</style>
<template>
<div id="main" class="row q-gutter-md">
	<div v-for="(item,key) in data" :class="{item:true,'text-no-wrap':true,'bolditem':(key%4===0)}" @click="goArticle(item.aid)">{{item.title}}</div>
</div>
</template>
<script>
export default{
	name:'articlelist1',
	props:['data'],
	data:()=>({

	}),
	methods:{

	}
}
</script>