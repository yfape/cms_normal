<template><div :class="[
    'q-px-lg',[$q.dark.isActive?'bg-grey-10':'bg-white']
  ]">
	<q-tabs 
    indicator-color="transparent" 
    active-color="red-10" 
    class="text-red-3"
    align="justify"
    >
      <q-route-tab class="ys" dense icon="o_account_balance" to="/" exact/>
      <q-route-tab class="ys" dense icon="o_book" to="/magazines" exact/>
      <q-tab class="ys" dense icon="o_build" @click="openTool"/>
    </q-tabs>
</div></template>
<script>
export default{
	name:'footer1',
	data:()=>({

	}),
  methods:{
    openTool(){
      this.$store.state.tool.show = true
    }
  }
}
</script>
<style>
.ys{width:25%;}
</style>