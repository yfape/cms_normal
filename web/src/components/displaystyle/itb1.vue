<style scoped>
.ys{cursor:pointer;transition:filter 0.3s}
.ys:hover{background:#fff;filter: drop-shadow(3px 3px 5px #A1A1A1) drop-shadow(-3px -1px 5px #A1A1A1);}
.ysimg{width:130px;height:75px;}
</style>
<template>
	<div>
<div v-for="(item,index) in content" @click="gourl(item.url)">
	<q-separator v-if="index!=0" inset color="grey-4"/>
	<q-item class="overhidden ys">
        <q-item-section avater class="ysimg">
        	<q-img :src="item.img" class="ysimg"/>
        </q-item-section>
        <q-item-section>
        	<q-item-label lines="2">{{item.title}}</q-item-label>
        	<q-item-label caption lines="2">{{item.intro}}</q-item-label>
        </q-item-section>
    </q-item>	
</div>
</div>
</template>
<script>
export default{
name:'tb1',
props:['content'],
data:()=>({

}),
mounted(){},
methods:{

},
}
</script>