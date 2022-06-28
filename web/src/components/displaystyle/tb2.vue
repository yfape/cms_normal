<style scoped>
.ys{color:#000;font-size:16px}
.tl{font-size:18px!important;font-weight:bold;}
</style>
<template>
<div>
	<div v-for="(item,index) in content" :class="{ys:true,overhidden:true,oneline:false,'q-mb-sm':true,canclick:true,tl:index==0||index==4||index==8,'q-mb-md':index==3||index==7}">
		<div @click="gourl(item.url)">{{item.title}}</div>
	</div>
</div>
</template>
<script>
export default{
name:'tb2',
props:['content'],
data:()=>({

}),
mounted(){},
methods:{

},
}
</script>