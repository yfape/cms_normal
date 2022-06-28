<style scoped>
.cartext{position:absolute;max-width:380px;padding:2px 20px;padding-right:5px;bottom:80px;left:0;background:rgba(0,0,0,0.5);text-align:left;border-radius:0 5px 5px 0;}
</style>
<template>
	<q-carousel height="100%" auto swipeable animated v-model="caro" thumbnails infinite padding>
        <q-carousel-slide class="couldclick" v-for="item in record" :name="item.aid" :img-src="item.img" @click="gourl(item.url)">
            <div class="text-body1 text-white cartext">
              {{item.title}}
            </div>
        </q-carousel-slide>
    </q-carousel>
</template>
<script>
export default{
name:'car1',
props:['record'],
data:()=>({
    caro:1,
}),
mounted(){this.caro = this.record[0].aid},
methods:{

},
}
</script>