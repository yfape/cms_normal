<template>
  <div id="app" v-if="show">
    <router-view/>
  </div>
</template>
<script>
export default{
  name:'app',
  data:()=>({
    show:true
  }),
  created(){
    
  },
  mounted(){
    
  },
  methods:{
    
  }
}
</script>
