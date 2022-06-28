<style scoped>
.maincn{font-size:18px;overflow:hidden;cursor:pointer;}
.maincn:hover .atitle{color:#B71C1C;font-weight:bold}
.maincn:hover .img{filter:contrast(120%);}

.hasimg{height:163.11px;}
.hasimg .img{width:100%;}



.ys{padding:15px 10px}
.hassub{box-shadow:0px -0.3px 0.3px #777777;}
.indate{font-size:14px;color:#D1D1D1;}
</style>
<template><div>
	<div v-for="item,key in data">
		<div v-if="item.faceimg" :class="{row:true,hasimg:true,maincn:true,hassub:key!==0}">
			<div class="col-4 ys">
				<q-img :ratio="16/9" class="img" :src="item.faceimg"/>
			</div>
			<div class="col-8 ys">
				<div class="column" style="height:100%;">
					<div class="col-8 atitle">{{item.title}}</div>
					<div class="col-4 row items-end">
						<div class="col-6 indate ">2020-02-28</div>
					</div>
				</div>
			</div>
		</div>

		<div v-if="!item.faceimg" :class="{maincn:true,hassub:key!==0}">
			<div class="ys atitle">{{item.title}}</div>
			<div class="ys indate">2020-02-28</div>
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