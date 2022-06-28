<style>
</style>
<template>
  <q-layout view="lHh Lpr lFf" :class="{largefont:$store.state.tool.largefont}">
    <q-page-container>
      <router-view/>
    </q-page-container>
    <q-footer style="background:transparent;" v-if="$store.state.control.footer1">
      <footer1/>
    </q-footer>
    <tool/>
  </q-layout>
</template>

<script>
import footer1 from '@/components/footer/footer1'
import tool from '@/components/dialog/tool'
export default {
  name: 'Home',
  components:{footer1,tool},
  data:()=>({

  }),
  mounted(){
    this.setTheme()
  },
  methods:{
    setTheme(){
      this.$store.state.tool.dark = this.$q.dark.isActive
    }
  }
}
</script>

<style>
html,body{font-size:16px}
.largefont .cfont{font-size:18px!important;}
</style>
