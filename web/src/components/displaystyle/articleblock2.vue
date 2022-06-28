<style scoped>
.maincn{font-size:14px;cursor: pointer;}
.maincn:hover{color:#B71C1C;font-weight:bold}
.maincn:hover .img{filter:contrast(120%);}
.fa{height:61px;overflow:hidden;}
.ys{padding:5px;}
.d{color:#B71C1C;}
</style>
<template><div>
<div v-for="(item,key) in data">
	<div v-if="key===0" class="row maincn fa">
		<div class="col-4 ys">
			<q-img :ratio="16/9" class="img" :src="item.faceimg" :img-style="{width:'100%'}"/>
		</div>
		<div class="col-8 ys">{{item.title}}</div>
	</div>
	<div v-if="key!==0" class="maincn">
		<div class="ys">
			<div><span class="d">●</span> {{item.title}}</div>
		</div>
	</div>
</div>
</div></template>
<script>
export default{
	name:'articleblock2',
	props:['data'],
	data:()=>({
		
	}),
	mounted(){

	},
}
</script>