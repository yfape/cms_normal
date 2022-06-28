
<template><q-layout>
	<header2 :tab="1"></header2>
	<div class="full-width text-grey text-subtitle1 text-center q-py-xl">页面错误，请重试</div>
	<footer1 id="articleend"></footer1>
</q-layout></template>
<script>
import header2 from '@/components/header/header2'
export default{
	name:'error',
	components:{header2},
	data:()=>({
		config:{show:true},
		scrolled:true
	}),
	created(){
		
	},
	mounted(){
		
	},
	methods:{
		
	},
}
</script>