<style scoped>

</style>
<template><div class="row items-center bg-white full-width" style="height:60px;overflow:hidden;box-shadow:0px 0.3px 0.5px #8E8E8E">
  <img src="/static/zzlogo.png" style="height:55px;" class="q-mx-md">
  <q-tabs class="full-height text-red-10" narrow-indicator>
        <q-route-tab v-for="item in nav" :label="item.text" :to="item.url" exact disable/>
  </q-tabs>
  <q-space/>
  <q-input color="red-10" filled v-model="text" dense square placeholder="搜索" style="width:200px" oneline class="q-mr-md" disable>
      <template v-slot:append>
        <q-btn icon="search" dense color="red-10" flat />
      </template>
  </q-input>
</div></template>
<script>
export default{
  name:'header4',
  props:['nav'],
  data:()=>({
    text:''
  }),
  mounted(){
  },
  methods:{
  }
}
</script>