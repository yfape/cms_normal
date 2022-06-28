<style lang="scss" :scoped="true">
.topjg{margin-right:10px;}
.usercard{transition:'box-shadow' 0.5s;width:200px}
.usercard:hover{box-shadow:2px 0px 2px #DEDEDE,-2px 0px 2px #DEDEDE,0px 3px 3px #DEDEDE,0px -1px 1px #DEDEDE;}
</style>
<template>
<div class="q-pa-md">
  <div class="row q-pa-sm bg-white no-wrap justify-between" style="margin-bottom:18px;">
    <div class="col">
      <q-btn class="full-height" icon="add" label="新增成员" color="brown-5" @click="showAddUserDialog"/>
    </div>
    <div class="col-2">
      <q-input filled dense placeholder="搜索" color="brown-10">
        <template v-slot:prepend>
            <q-icon name="search"/>
        </template>
      </q-input>
    </div>
  </div>
  <div class="row q-gutter-md">
    <q-item clickable v-ripple :class="{usercard:true,'bg-white':true,'bg-grey-4':!parseInt(item.valid)}" v-for="item in alluser" @click="showUserDialog(item.uid)">
      <q-item-section side>
        <q-avatar rounded size="48px">
          <img :src="item.headimg" />
        </q-avatar>
      </q-item-section>
      <q-item-section>
        <q-item-label>{{item.nickname}}</q-item-label>
        <q-item-label caption>{{$store.state.system.identitys[item.identity]}}</q-item-label>
      </q-item-section>
    </q-item>
  </div>
  <userdialog ref="userdialog" @getAllUser="getAllUser"></userdialog>
</div>
</template>

<script>
import userdialog from '@/components/dialog/userdialog'
export default {
	name: 'usermanage',
  components:{userdialog},
	data:()=>({
    alluser:[],
    userdialog:{show:false,data:{uid:0,headimg:''}},
	}),
	created(){
    this.getAllUser()
	},
	mounted(){

	},
	methods:{
		getAllUser(){
      this.axios.post('getUsers').then(response=>{
        this.alluser = Object.assign([],response)
      })
    },
    showUserDialog(uid){
      var selectuser = {}
      for(let i in this.alluser){
        if(this.alluser[i].uid===uid){
          selectuser = Object.assign({},this.alluser[i]);break;
        }
      }
      this.$refs.userdialog.showUserDialog(selectuser)
    },
    showAddUserDialog(){
      let base = {
        uid:0,user:'',headimg:'http://file.scdjw.net/headimg/defaultheadimg.gif',identity:4,valid:0,cols:[]
      }
      this.$refs.userdialog.showUserDialog(base)
    }
	}
}
</script>
