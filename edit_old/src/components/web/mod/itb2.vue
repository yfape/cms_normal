<style src="../common.css" scoped></style>
<style scoped>
.ys{width:168px;height:110px;}
.ys .intitle{font-size:16px;line-height:20px;height:45px;padding-top:5px;overflow:hidden;}
</style>
<template>
<div class="row justify-between">
    <div class="ys canclick" v-for="item in record">
        <q-img class="ys" :src="item.img"/>
        <div class="text-center intitle">{{item.title}}</div>
    </div>
</div>
</template>
<script>
export default{
name:'tb2',
props:['record'],
data:()=>({

}),
mounted(){},
methods:{

},
}
</script>