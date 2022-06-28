<template>
<div>
	<div v-for="(item,index) in content" class="overhidden" v-if="index>=(start?start:0)&&index<=(end?end:1000)">
        <div v-if="!item.children" :class="{oneline:true,'q-mb-sm':true,canclick:true}" :style="{'font-weight':item.bold==true?'bold':0,'font-size':item.size?item.size:'16px','color':item.color?item.color:'#000'}" @click="gourl(item.url)">{{item.title}}</div>
    </div>	
</div>
</template>
<script>
export default{
name:'tb1',
props:['content','start','end'],
data:()=>({

}),
mounted(){},
methods:{

},
}
</script>