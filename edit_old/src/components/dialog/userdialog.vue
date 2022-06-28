<style lang="scss">
$red-10:#B71C1C;
.activeidentity{color:$red-10;}
.rightcols{height:288px;overflow-y:auto;}
.rightcols::-webkit-scrollbar{width: 3px;height: 1px;}
.rightcols::-webkit-scrollbar-thumb {border-radius: 10px;-webkit-box-shadow: inset 0 0 5px rgba(0,0,0,0.2);background:$red-10;}
.rightcols::-webkit-scrollbar-track {}
</style>
<template>
  <q-dialog v-model="show" @hide="hideUserDialog">
    <q-card class="bg-white q-pa-sm" style="width:560px;">
      <div class="row">
        <div class="col q-pa-sm">
          <div class="row q-col-gutter-sm">
            <div class="col-4"><q-img id="headimg" :src="data.headimg"/></div>
            <div class="col-8">
              <q-input color="grey-6" dense label="姓名" v-model="data.nickname"/>
              <q-input color="grey-6" dense label="用户名" v-model="data.user"/>
            </div>
            <q-input class="full-width" standout="bg-grey-6 text-white" color="grey-6" dense label="邮箱" v-model="data.email"/>
          </div>
          <q-list class="q-my-sm">
            <q-item dense tag="label" v-ripple active-class="text-red-8 bg-grey-2" :active="data.identity==1">
              <q-item-section>
                <q-item-label>系统管理员</q-item-label>
                <q-item-label caption>所有权限</q-item-label>
              </q-item-section>
              <q-item-section avatar>
                <q-radio v-model="data.identity" :val="1" color="red-8" />
              </q-item-section>
            </q-item>
            <q-item dense tag="label" v-ripple active-class="text-orange-6 bg-grey-2" :active="data.identity==2">
              <q-item-section>
                <q-item-label>审核员</q-item-label>
                <q-item-label caption>无法管理用户及系统设置</q-item-label>
              </q-item-section>
              <q-item-section avatar>
                <q-radio v-model="data.identity" :val="2" color="orange-6" />
              </q-item-section>
            </q-item>
            <q-item dense tag="label" v-ripple active-class="text-teal-5 bg-grey-2" :active="data.identity==3">
              <q-item-section>
                <q-item-label>网站管理员</q-item-label>
                <q-item-label caption>发稿、管理页面模块专题</q-item-label>
              </q-item-section>
              <q-item-section avatar>
                <q-radio v-model="data.identity" :val="3" color="teal-5" />
              </q-item-section>
            </q-item>
            <q-item dense tag="label" v-ripple active-class="text-green-5 bg-grey-2" :active="data.identity==4">
              <q-item-section>
                <q-item-label>编辑</q-item-label>
                <q-item-label caption>发稿及基础功能</q-item-label>
              </q-item-section>
              <q-item-section avatar>
                <q-radio v-model="data.identity" :val="4" color="green-5" />
              </q-item-section>
            </q-item>
          </q-list>
        </div>
        <div class="col q-pa-sm rightcols">
          <selectcol :data="$store.state.system.webcols" :selected="data.cols" @change="getSelectCols"></selectcol>
        </div>
      </div>

      <div class="q-mx-sm q-gutter-sm" style="border-top:1px dotted #838383">
        <q-btn :loading="loading.save" unelevated size="sm" color="brown-5" label="保存" icon="done" @click="saveUserInfo" v-if="data.uid!==0"/>
        <q-btn :loading="loading.save" unelevated size="sm" color="brown-5" label="新增" icon="add" @click="addUser" v-if="data.uid===0"/>
        <q-btn :loading="loading.reset" unelevated size="sm" color="grey-6" label="重置密码" icon="cached" @click="resetPass"/>
        <q-btn :loading="loading.delete" unelevated size="sm" color="red-4" label="删除成员" icon="delete"">
          <q-popup-edit v-model="show" content-class="bg-brown-9 text-white">
            <div>真的要删除吗?</div>
            <q-btn :loading="loading.delete" unelevated size="sm" color="red-8" label="确定" icon="delete" @click="deleteUser"/>
          </q-popup-edit>
        </q-btn>
        
        <q-toggle v-model="data.valid" :false-value="0" :true-value="1" :label="data.valid?'已启用':'已禁用'" color="grey-6"/>
      </div>
    </q-card>

  </q-dialog>
</template>

<script>
import selectcol from '@/components/selectcol.vue'
export default {
  name:'userdialog',
  components:{selectcol},
  data:()=>({label:false,
    show:false,
    loading:{save:false,reset:false,delete:false},
    initdata:{uid:0,user:'',headimg:'',identity:'',valid:0,cols:[]},
    data:{uid:0,user:'',headimg:'',identity:'',valid:0,cols:[]}
  }),
  created(){
    
  },
  mounted(){

  },
  methods: {
    showUserDialog(data){
      this.data = Object.assign({},data)
      this.show = true
    },
    hideUserDialog(){
      this.data = Object.assign({},this.initdata)
      this.show = false
    },
    checkPostNull(){
      if(this.data.user&&this.logindata.pass&&this.logindata.logincode){
        return true
      }else{
        return false
      }
    },
    saveUserInfo(){
      if(!this.clickCommit()){
        this.AItip('姓名用户名不能为空');return;
      }

      this.loading.save = true
      this.axios.post('reviseUser',{userdata:this.data}).then(response=>{
          this.AItip('修改成功')
          this.$emit('getAllUser')
          this.hideUserDialog()
        this.loading.save = false
      }).catch(err=>{
        this.loading.save = false
      })
    },
    addUser(){
     if(!this.clickCommit()){
        this.AItip('姓名用户名不能为空');return;
      }

      this.loading.save = true
      this.axios.post('addUser', {userdata:this.data}).then(response=>{
        this.AItip('新增用户成功')
        this.$emit('getAllUser')
        this.hideUserDialog()
        this.loading.save = false
      }).catch(err=>{
        this.loading.save = false
      })
    },
    deleteUser(){
      this.loading.delete = true
      this.axios.post('deleteUser',{uid:this.data.uid}).then(response=>{
        this.AItip('删除成功')
        this.$emit('getAllUser')
        this.hideUserDialog()
        this.loading.delete = false
      }).catch(err=>{
         this.loading.delete = true
      })
    },
    resetPass(){
      this.loading.reset = true
      this.axios.post('resetPass',{uid:this.data.uid}).then(response=>{
        this.AItip('重置密码成功')
        this.loading.reset = false
      }).catch(err=>{
        this.loading.reset = false
      })
    },
    clickCommit(){
      if(this.data.user&&this.data.nickname){
        return true
      }else{
        return false
      }
    },
    getSelectCols(cols){
      this.data.cols = Object.assign([],cols)
    }
  }
}
</script>