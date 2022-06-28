<style scoped>
.main{font-size:16px}
.head{height:45px;}
.head>.title{width:20%;font-size:18px;height:43px;line-height:43px;font-weight:bold;color:#B71C1C;border-top:2px solid #B71C1C;text-align:center;}
.head>.line{width:78%;height:43px;border-top:2px solid #DADADA;margin-left:2%;}
.topimg{width:150px;}
.point{font-size:18px;color:red;}
.title:hover{color:#B71C1C}
.ys:before{
    content:'◼';color:#CDCDCD;font-size:12px;margin-right:5px
}
</style>
<template><div class="main">
    <div class="head row">
        <div class="title">{{head}}</div>
        <div class="line"></div>
    </div>
    <div>
        <q-item clickable class="q-pa-none" @click="gourl(record[0].url)">
            <q-item-section avatar>
                <q-img class="topimg" :src="record[0].img" :ratio="8/5"/>
            </q-item-section>
            <q-item-section class="title">
                <q-item-label :lines="4">{{record[0].title}}</q-item-label>
            </q-item-section>
        </q-item>
        <q-item clickable v-for="(item,index) in record" v-if="index<limit&&index>0" class="q-pa-none" dense @click="gourl(item.url)">
            <q-item-section class="title">
                <q-item-label :lines="1" class="ys">{{item.title}}</q-item-label>
            </q-item-section>
        </q-item>
    </div>
</div></template>
<script>
import tb1 from './tb1'
export default{
name:'itb3',
props:['record','head','limit'],
components:{tb1},
data:()=>({

}),
mounted(){

},
methods:{

}
}
</script>