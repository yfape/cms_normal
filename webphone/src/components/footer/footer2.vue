<template><div>
	<div style="height:50px"></div>
	<div style="position:fixed;bottom:0;height:48px" :class="['full-width q-px-md row items-center justify-between',[$q.dark.isActive?'bg-grey-10':'bg-white']]">
		<div><q-btn icon="o_keyboard_arrow_left" flat fab-mini @click="$router.go(-1)"/></div>
		<div>
			<q-btn class="q-mr-sm" icon="o_favorite_border" flat fab-mini color="red-10"/>
			<q-btn class="q-mr-sm" icon="o_headset" flat fab-mini @click="$emit('showAudio')" v-if="audio"/>
			<q-btn class="q-mr-sm" :icon="$q.dark.isActive?'o_brightness_medium':'o_brightness_low'" flat fab-mini @click="$q.dark.toggle()"/>
			<q-btn icon="o_share" flat fab-mini/>
		</div>
	</div>
</div></template>
<script>
export default{
	name:'footer2',
	props:['aid','audio'],
}
</script>