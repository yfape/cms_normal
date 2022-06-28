<style src="../common.css" scoped></style>
<style scoped>
</style>
<template>
	<q-carousel height="100%" arrows animated v-model="caro" infinite>
        <q-carousel-slide class="couldclick" v-for="item in record" :name="item.aid">
        	<q-img :src="item.img" @click="goArticle(item.aid)">
        		<div class="absolute-bottom text-subtitle1 text-center">
	            	{{item.title}}
	          	</div>
        	</q-img>
        </q-carousel-slide>
    </q-carousel>
</template>
<script>
export default{
name:'car3',
props:['record'],
data:()=>({
    caro:1,
}),
mounted(){},
methods:{

},
}
</script>