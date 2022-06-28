<template>
<q-dialog v-model="show">
  <q-card class="q-pa-md">
    <q-input class="q-mb-md" dense v-model="oldpass" filled :type="isPwd ? 'password' : 'text'" label="旧密码" color="grey-6">
      <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <q-input class="q-mb-md" dense v-model="newpass" filled :type="isPwd ? 'password' : 'text'" label="新密码" color="grey-6">
      <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <q-input class="q-mb-md" dense v-model="compass" filled :type="isPwd ? 'password' : 'text'" label="确认密码" color="grey-6">
      <template v-slot:append>
        <q-icon
          :name="isPwd ? 'visibility_off' : 'visibility'"
          class="cursor-pointer"
          @click="isPwd = !isPwd"
        />
      </template>
    </q-input>
    <q-btn :loading="loading" color="brown-5" class="full-width" label="确认修改" @click="revisePass"/>
  </q-card>
</q-dialog>
</template>

<script>
export default {
  nme:'Rpassdialog',
  data:()=>({
    show:false,isPwd:true,loading:false,oldpass:'',newpass:'',compass:'',
  }),
  created(){

  },
  methods: {
    showDialog(){
      this.oldpass = ''
      this.newpass = ''
      this.compass = ''
      this.show = true
    },
    revisePass(){
      if(!(this.oldpass&&this.newpass&&this.compass)){
        this.AItip('输入框不能为空');return;
      }
      if(this.newpass!==this.compass){
        this.AItip('新密码输入不一致');return;
      }

      this.loading = true
      this.axios.post('revisePass',{oldpass:this.oldpass,newpass:this.newpass}).then(response=>{
        this.AItip('修改成功')
        this.show = false
        this.loading = false
      }).catch(err=>{
        this.loading = false
      })
    }
  }
}
</script>