<style scoped>
.title-yf2{height:45px;line-height:45px;width:100%;}
.title-yf2>div{float:left}
.title-yf2>.lines{height:20px;border-bottom:1px solid transparent;border-image:linear-gradient(to bottom,transparent 50%, #9E9E9E 50%) 0 0 100%/1px 0;}
.title-yf2>.titletext{text-align:left;font-size:18px;font-weight:bold;cursor:pointer;}
.title-yf2>.titletext:hover{color:#B71C1C;}
.title-yf2 .title1{color:#B71C1C;}
</style>
<template><div class="title-yf2">
  	<div class="titletext" :style="{width:twidth}">
  		<span class="title1">{{title1}}</span>{{title2}}
  	</div>
  	<div class="lines" :style="{width:lwidth}"></div>
  	<div style="height:0;clear:both;"></div>
</div></template>
<script>
export default{
	name:'TM1',
	props:['title1','title2','twidth','lwidth'],
	data:()=>({

	})
}
</script>