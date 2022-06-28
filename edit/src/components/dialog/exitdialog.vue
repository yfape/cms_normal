<template>
  <q-dialog v-model="show">
    <q-item clickable v-ripple class="bg-white">
      <q-item-section side>
        <q-avatar rounded size="48px">
          <img :src="$store.state.user.headimg" />
        </q-avatar>
      </q-item-section>
      <q-item-section>
        <q-item-label>{{$store.state.user.nickname}}</q-item-label>
        <q-item-label caption>秘钥有效期:18小时</q-item-label>
      </q-item-section>
      <q-item-section side class="text-caption">
        <q-btn color="red-10" class="full-height" icon="power_settings_new" flat @click="exitSys"/> 
      </q-item-section>
    </q-item>
    
  </q-dialog>
</template>

<script>
export default {
  nme:'exitdialog',
  data:()=>({
    show:false,
  }),
  created(){},
  methods: {
    showD(){
      this.show = true
    },
    exitSys(){
      localStorage.setItem('token','')
      this.$store.state.user = {}
      this.$router.replace('/login')
    }
  }
}
</script>