<style src="../common.css" scoped></style>
<style scoped>
.zzinimg{height:202px;}
.zzinimg:hover{filter: drop-shadow(3px 3px 5px #A1A1A1) drop-shadow(-3px -1px 5px #A1A1A1);}
</style>
<template><div>
	<q-carousel
        v-model="slide"
        animated
        control-color="red-10"
        height="270px"
        infinite navigation
        navigation-icon="check_box_outline_blank"
        style="background:transparent;"
    >
        <q-carousel-slide :name="index" class="row q-pt-none q-px-none" v-for="item,index in content" style="overflow:hidden;">
            <div class="col-2 q-pr-lg canclick" v-for="i in item">
                <q-img class="zzinimg shadow-5" contain :src="i.img"/>
                <div class="oneline text-center">{{i.title}}</div>
            </div>
        </q-carousel-slide>
    </q-carousel>
</div></template>
<script>
export default{
name:'car2',
props:['record'],
data:()=>({
    slide:0,
    content:[],
}),
mounted(){
    this.setData()
},
methods:{
    group(array, subGroupLength) {
        let index = 0;
        let newArray = [];
        while(index < array.length) {
            newArray.push(array.slice(index, index += subGroupLength));
        }
        return newArray;
    },
    setData(){
        this.content = this.group(this.record,6)
        
    }
},
watch:{
    'record'(){
        this.setData()
    }
}
}
</script>