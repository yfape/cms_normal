<style scoped>
.rightys::before{
    content:'■';color:#B71C1C;margin-right:6px;
}
</style>
<template><div class="q-px-sm" v-if="record.length>0">
    <q-img :src="record[0].img" class="canclick" :ratio="16/9" @click="goArticle(record[0].aid)">
        <div class="absolute-bottom text-body2" style="padding:5px">
            {{record[0].title}}
        </div>
    </q-img>
    <div v-for="item,index in record" v-if="index>0">
        <q-item clickable class="q-py-sm q-px-none rightys" dense @click="goArticle(item.aid)">
            <q-item-section>
                <q-item-label :lines="2" class="text-body2">{{item.title}}</q-item-label>
            </q-item-section>
        </q-item>
    </div>
</div></template>
<script>
export default{
name:'itb3',
props:['record'],
data:()=>({

}),
mounted(){

},
methods:{

}
}
</script>