<style scoped>
#logo{height:50px;margin:0px 20px;}
.inrow{float:left;}
</style>
<template><div class="bg-red-10" style="height:50px;overflow:hidden;box-shadow:0px 0.3px 0.5px #8E8E8E">
  <img id="logo" class="inrow" src="/static/zzlogo.png">
  <q-tabs class="inrow full-height text-white" narrow-indicator align="left">
        <q-route-tab v-for="item in $store.state.nav" :label="item.text" :to="item.url" exact/>
  </q-tabs>
  <div style="float:right;width:300px;height:40px;padding:5px 10px;">
    <q-input color="red-10" dark standout bottom-slots v-model="text" counter clearable dense square placeholder="搜索">
        <template v-slot:append>
          <q-btn icon="search" dense color="red-10" flat @click="gosearch"/>
        </template>
    </q-input>
  </div>
</div></template>
<script>
export default{
  name:'header2',
  props:[],
  data:()=>({
    text:''
  }),
  mounted(){

  },
  methods:{
    gosearch(){
      this.$router.push('/search/'+this.text)
    }
  }
}
</script>