<style scoped>
.maincn{font-size:14px;height:74.69px;overflow:hidden;cursor: pointer;}
.maincn:hover{color:#B71C1C;font-weight:bold}
.maincn:hover .img{filter:contrast(120%);}
.img{width:100%;}
.ys{padding:5px;}
.hassub{box-shadow:0px -0.3px 0.3px #CDCDCD;}
</style>
<template><div>
	<div v-for="item,key in data">
		<div :class="{row:true,maincn:true,hassub:key!==0}">
			<div class="col-5 ys">
				<q-img :ratio="16/9" class="img" :src="item.faceimg"/>
			</div>
			<div class="col-7 ys">{{item.title}}</div>
		</div>
	</div>
</div></template>
<script>
export default{
	name:'articleblock1',
	props:['data'],
	data:()=>({
		
	}),
	mounted(){

	},
}
</script>