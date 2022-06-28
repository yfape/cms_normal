<style lang="scss" :scoped="true">
.firstline{height:516px}
</style>
<template>
<div class="q-pa-md" v-if="show">

  <div class="row">

    <q-card style="width:220px;" class="firstline text-center q-py-md no-shadow">
      <div class="row items-center q-mb-sm">
        <div class="bg-red-10" style="width:5px;height:15px;margin-right:5px"></div>
        <span class="text-subtitle1">个人信息</span>
      </div>
      <q-img class="q-ma-md" :radio="1" :src="data.headimg" style="cursor:pointer;width:80px;height:80px;border-radius:100%;">
        <q-popup-edit title="请选择头像" v-model="data.headimg" auto-close anchor="center right">
          <div class="row" style="width:1000px;">
            <div v-for="item in headimgs" :class="{'q-pa-sm':true,'col-1':true,'canclick':true,'data.headimg':data.headimg===item}"><q-img :ratio="1" :src="item" @click="reviseHeadimg(item)"/></div>
          </div>
        </q-popup-edit>
      </q-img>
      <div class="q-px-lg q-pb-sm">
        <q-input class="q-mb-sm" dense v-model="data.nickname" color="red-10" label="姓名" @blur="reviseUser('nickname')" :disabled="loading" :loading="loadings.nickname"/>
        <q-input class="q-mb-sm" dense v-model="data.email" color="red-10" label="邮箱" @blur="reviseUser('email')" :disabled="loading" :loading="loadings.email"/>
        <q-input dense v-model="data.user" color="red-10" label="账号" readonly/>
      </div>
      <q-list class="text-left">
        <q-item dense tag="label" v-ripple active-class="text-white bg-grey-6" :active="data.identity==1">
          <q-item-section>
            <q-item-label>系统管理员</q-item-label>
            <q-item-label caption>所有权限</q-item-label>
          </q-item-section>
          <q-item-section avatar>
            <q-radio disable v-model="data.identity" :val="1" color="red-8" />
          </q-item-section>
        </q-item>
        <q-item dense tag="label" v-ripple active-class="text-orange-6 bg-grey-6" :active="data.identity==2">
          <q-item-section>
            <q-item-label>审核员</q-item-label>
            <q-item-label caption>无法管理用户及系统设置</q-item-label>
          </q-item-section>
          <q-item-section avatar>
            <q-radio disable v-model="data.identity" :val="2" color="orange-6" />
          </q-item-section>
        </q-item>
        <q-item dense tag="label" v-ripple active-class="text-teal-5 bg-grey-6" :active="data.identity==3">
          <q-item-section>
            <q-item-label>网站管理员</q-item-label>
            <q-item-label caption>发稿、管理页面模块专题</q-item-label>
          </q-item-section>
          <q-item-section avatar>
            <q-radio disable v-model="data.identity" :val="3" color="teal-5" />
          </q-item-section>
        </q-item>
        <q-item dense tag="label" v-ripple active-class="text-green-5 bg-grey-6" :active="data.identity==4">
          <q-item-section>
            <q-item-label>编辑</q-item-label>
            <q-item-label caption>发稿及基础功能</q-item-label>
          </q-item-section>
          <q-item-section avatar>
            <q-radio disable v-model="data.identity" :val="4" color="green-5" />
          </q-item-section>
        </q-item>
      </q-list>
    </q-card>
    <q-card style="width:400px;" class="firstline text-center q-pa-md no-shadow">
      <div class="row items-center q-mb-sm">
        <div class="bg-red-10" style="width:5px;height:15px;margin-right:5px"></div>
        <span class="text-subtitle1">栏目权限</span>
      </div>
      <selectcol style="height:448px;overflow-y:auto;" disabled :data="$store.state.system.webcols" :selected="$store.state.user.cols"></selectcol>
    </q-card>
    <q-card style="width:150px;" class="firstline q-py-md q-mx-md no-shadow">
      <div class="q-px-sm"><q-btn class="full-width" @click="$refs.Rpassdialog.showDialog()" label="修改密码" color="brown-5"/></div>
    </q-card>
  </div>
  <Rpassdialog ref="Rpassdialog"></Rpassdialog>
</div>
</template>
<script>
import Rpassdialog from '@/components/dialog/Rpassdialog.vue'
import selectcol from '@/components/selectcol.vue'
export default {
	name: 'userinfo',
	components: {Rpassdialog,selectcol},
	data:()=>({
    show:false,step:2,loading:false,
    data:{headimg:'',cols:'',user:'',email:'',identity:0},
    loadings:{nickname:false,email:false},
    headimgs:[
      'http://file.scdjw.net/headimg/defaultheadimg.gif',
      'http://file.scdjw.net/headimg/1.gif',
      'http://file.scdjw.net/headimg/2.gif',
      'http://file.scdjw.net/headimg/3.gif',
      'http://file.scdjw.net/headimg/4.gif',
      'http://file.scdjw.net/headimg/5.gif',
      'http://file.scdjw.net/headimg/6.gif',
      'http://file.scdjw.net/headimg/7.gif',
      'http://file.scdjw.net/headimg/8.gif',
      'http://file.scdjw.net/headimg/9.gif',
      'http://file.scdjw.net/headimg/10.gif',
      'http://file.scdjw.net/headimg/11.gif',
    ]
	}),
	created(){
    this.setData()
	},
  mounted(){

  },
	methods:{
    setData(){
      this.data = Object.assign({},this.$store.state.user)
      this.show = true
    },
    reviseUser(arg){
      if(this.loading||!arg||this.data[arg]==this.$store.state.user[arg]){
        return
      }
      this.loading = true
      this.loadings[arg] = true
      this.axios.post('reviseSelf', {userdata:this.data}).then(response=>{
        this.AItip('修改成功')
        this.servedata = Object.assign({},response)
        this.data = Object.assign({},response)
        this.updateStore()
        this.loading = false
        this.loadings[arg] = false
      }).catch(err=>{
        this.loading = false
        this.loadings[arg] = false
        if(arg=='headimg'){
          this.data.headimg = this.$store.state.user.headimg
        }
      })
    },
    reviseHeadimg(img){
      this.data.headimg = img
      this.reviseUser('headimg')
    },
    updateStore(){
      this.$store.state.user.headimg = this.data.headimg
      this.$store.state.user.nickname = this.data.nickname
      this.$store.state.user.email = this.data.email
    },
	},
}
</script>
