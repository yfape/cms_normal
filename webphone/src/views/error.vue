<template><div class="q-pa-lg text-center text-grey">
	<q-icon name="error_outline" size="30px"/><br><br>
	抱歉，服务器太忙了，没有回应您<br>请<span class="text-red-10" style="text-decoration:underline;" @click="$router.go(-1)">返回上一页</span>重试
</div></template>

<script>
export default{
	name:'error',
	created(){
		this.$q.loading.hide()
	}
}
</script>
