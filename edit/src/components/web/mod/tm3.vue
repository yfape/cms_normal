<style src="../common.css" scoped></style>
<template>
	<div style="overflow:hidden;">
	    <div style="float:left;width:2%;height:23px;border-bottom:1px dashed #B71C1C"></div>
	    <div style="float:left;width:6%;height:45px;line-height:45px;font-size:18px;font-weight:bold;text-align:center;" class="text-red-10">{{title}}</div>
	    <div style="float:left;width:92%;height:23px;border-bottom:1px dashed #B71C1C"></div>
	</div>
</template>
<script>
export default{
	name:'tm3',
	props:['title'],
	data:()=>({

	})
}
</script>