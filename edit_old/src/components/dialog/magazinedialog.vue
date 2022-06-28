<style scoped>

</style>
<template>
<q-dialog v-model="show" persistent>
	<q-card style="min-width:1000px;" v-if="show">
    	<q-bar>
      	<div>杂志模块：{{content.zid}}</div>
      	<q-space />
        <q-toggle class="q-px-sm" color="red-10" :label="content.valid?'启用':'禁用'" dense v-model="content.valid" :true-value="1" :false-value="0" @input="changvalid"/>
        <q-btn dense v-if="content.zid==-1" flat icon="add" label="新增" class="q-px-sm" @click="addmagazine"/>
        <q-btn dense v-if="content.zid!=-1" flat icon="save" label="保存" class="q-px-sm" @click="savemagazine"/>
        <q-btn v-if="content.zid!=-1" dense flat icon="delete" label="删除" class="q-px-sm" @click="deletemagazine"/>
        <q-btn v-if="content.zid!=-1" dense flat icon="settings_backup_restore" label="重置" class="q-px-sm" @click="reset"/>
      	<q-btn dense flat icon="close" label="关闭" v-close-popup/>
	    </q-bar>
	    <div class="row full-width">
	    	<div class="col-3 q-pa-sm">
          <q-input label="标题" dense filled color="red-10" v-model="content.title"/>
	    		<q-img :src="content.img" :ratio="7/9"/>
          <upbtn label="更换图片" class="full-width" @change="function(imgs){content.img=imgs[0]}"/>
	    	</div>
        <div class="col-9 q-pa-sm">
          <q-item clickable dense v-for="item,index in content.content" class="q-pa-none">
            <q-item-section :class="{'text-bold':item.text=='1','text-h6':item.text=='1','text-subtitle1':item.text=='0'}">
              {{item.title}}
              <q-popup-edit v-model="test">
                <div class="row">
                  <div class="col-1">
                    <q-input v-if="item.text=='0'" label="文章ID" color="red-10" dense v-model="item.aid"/>
                  </div>
                  <div class="col-11">
                    <q-input label="文章标题" color="red-10" v-model="item.title" dense autofocus>
                      <template v-slot:append>
                        <q-toggle color="red-10" dense true-value="1" false-value="0" v-model="item.text"><div class="text-caption">非链接</div></q-toggle>
                        <q-btn v-if="item.text=='0'" round dense flat icon="search" color="red-10" @click="sart(index)"/>
                        <q-btn round dense flat icon="keyboard_arrow_down" color="red-10" @click="sortDown(index)" v-close-popup/>
                        <q-btn round dense flat icon="close" color="red-10" @click="deleteart(index)" v-close-popup/>
                      </template>
                    </q-input>
                  </div>
                </div>
              </q-popup-edit>
            </q-item-section>
          </q-item>
          <q-btn icon="add" dense class="text-black" @click="addnew"/>
        </div>
	    </div>
    </q-card>
    <selectarticle ref="selectarticle" @change="selectarticle"></selectarticle>
</q-dialog>
</template>

<script>
import upbtn from '@/components/UploadCom'
import selectarticle from '@/components/dialog/selectarticle'

export default {
name:'magazinedialog',
components:{upbtn,selectarticle},
data:()=>({
  show:false,test:'',index:0,
  content:{zid:-1,title:'',img:'',content:[],text:"1",valid:0},
  server:{},
}),
created(){},
mounted(){

},
methods: {
  	showd(zid=-1){
      if(zid==-1){
        this.initd()
      }else{
        this.getmagazine(zid)
      }
  	},
    initd(){
      this.content = Object.assign({},{},{zid:-1,title:'',img:'',createdate:'',content:[],valid:0})
      this.show = true
    },
  	getmagazine(zid){console.log(zid)
      this.$q.loading.show()
  		this.axios.post('getMagazine',{zid:zid}).then(response=>{
        this.content = Object.assign({},{},response.magazine)
        this.content.content = this.content.content?this.content.content:[]
        this.server = JSON.parse(JSON.stringify(response.magazine))
        this.$q.loading.hide()
        this.show = true
  		}).catch(err=>{
        this.$q.loading.hide()
  		})
  	},
    selectarticle(data){
      if(data.length<=0){
        return
      }
      this.$set(this.content.content,this.index,{aid:data[0].aid,title:data[0].title,text:'0',valid:0})
    },
    sart(index){
      this.index = index
      this.$refs.selectarticle.showd(45,1)
    },
    addnew(){
      this.content.content.push({aid:0,title:'请添加文字',text:'0'})
    },
    deleteart(index){
      this.content.content.splice(index,1)
    },
    reset(){
      this.content = Object.assign({},{},this.server)
      this.content.content = this.content.content?this.content.content:[]
    },
    sortDown(i){
      if(i==this.content.content.length-1){return;}
      let temp = Object.assign({},{},this.content.content[i])
      this.content.content[i] = Object.assign({},{},this.content.content[i+1])
      this.content.content[i+1] = Object.assign({},{},temp)
      this.content.content = Object.assign([],[],this.content.content)
    },
    savemagazine(){
      this.$q.loading.show()
      this.axios.post('saveMagazine',{magazine:this.content}).then(response=>{
        this.$emit('change')
        this.show = false
        this.$q.loading.hide()
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    addmagazine(){
      this.$q.loading.show()
      this.axios.post('addMagazine',{magazine:this.content}).then(response=>{
        this.$emit('change')
        this.show = false
        this.$q.loading.hide()
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    deletemagazine(){
      this.$q.loading.show()
      this.axios.post('deleteMagazine',{zid:this.content.zid}).then(response=>{
        this.$emit('change')
        this.show = false
        this.$q.loading.hide()
      }).catch(err=>{
        this.$q.loading.hide()
      })
    },
    changvalid(){
      if(this.content.zid<=0){
        return
      }
      this.$q.loading.show()
      this.axios.post('changeMagazineValid',{zid:this.content.zid,valid:this.content.valid}).then(res=>{
        this.$emit('change')
        this.$q.loading.hide()
      })
    }
}
}
</script>