<style>
.tableimg{height:50px;}
</style>
<template>
<div class="q-pa-md" v-if="show">
  <q-card class="no-shadow row q-pa-sm q-mb-md">

    <q-btn label="新增文章" class="q-px-sm" icon="add" color="brown-5" @click="$router.push('artedit/0')" :disable="loading" dense/>

    <q-separator inset vertical class="q-mx-sm"/>

    <q-btn label="选择栏目" flat @click="showSelectCol"/>

    <q-separator inset vertical class="q-mx-sm"/>

    <q-checkbox class="q-px-sm" v-model="dc.status" :val="0" label="草稿箱" color="grey-3" :disable="loading" @input="getArticleList" dense/>
    <q-checkbox class="q-px-sm" v-model="dc.status" :val="1" label="未审核" color="grey-6" :disable="loading" @input="getArticleList" dense/>
    <q-checkbox class="q-px-sm" v-model="dc.status" :val="10" label="已审核" color="grey-8" :disable="loading" @input="getArticleList" dense/>
    
    <q-separator inset vertical class="q-mx-sm"/>

    <q-space/>
    
    <q-input dense filled placeholder="搜索" class="q-ml-md" color="brown-5" v-model="dc.search">
      <template v-slot:prepend>
        <q-toggle v-model="dc.super" icon="flash_on" dense color="red-10" :false-value="0" :true-value="1">
          <q-tooltip>
            检索文章内容（特别影响性能，谨慎勾选）
          </q-tooltip>
        </q-toggle>
      </template>
      <template v-slot:append>
        <q-btn round dense flat icon="search" color="red-10" @click="getArticleList"/>
      </template>
    </q-input>

  </q-card>

  <q-table
    class="no-shadow"
    :data="alist.data"
    :columns="alist.style"
    row-key="aid"
    :pagination.sync="alist.pagination"
    rows-per-page-label="每页文章数"
    no-data-label="没有文章数据"
    :loading="loading"
    hide-bottom
  >
    <template v-slot:body="props">
      <q-tr :props="props" :class="{'bg-white':props.row.status===0,'bg-grey-4 text-grey-6':props.row.status===1,'bg-grey-8 text-white':props.row.status===10}">
        <q-td key="aid" :props="props">{{ props.row.aid }}</q-td>
        <q-td key="title" :props="props">{{ props.row.title }}</q-td>
        <q-td key="col" :props="props">{{ $store.state.system.cols['c'+props.row.col].col }}</q-td>
        <q-td key="faceimg" :props="props">
          <q-img class="tableimg" :radio="16/9" contain :src="props.row.faceimg"/>
        </q-td>
        <q-td key="audio" :props="props">
          <q-btn v-if="props.row.audio" icon="play_circle_outline" color="brown-5" dense @click="playAudio(props.row)"/>
        </q-td>
        <q-td key="style" :props="props">{{ props.row.style }}</q-td>
        <q-td key="createdate" :props="props">{{getLocalTime(props.row.createdate)}}</q-td>
        <q-td key="status" :props="props">{{$store.state.system.astatus[props.row.status]}}</q-td>
        <q-td key="actions" :props="props">
          
          <div v-if="props.row.status===0">
            <q-btn class="q-mr-sm" icon="visibility" color="grey-6" dense @click="$store.commit('readArticle',props.row.aid)"/>
            <q-btn class="q-mr-sm" icon="edit" color="brown-5" dense @click="openEditor(props.row.aid)"/>
            <q-btn class="q-mr-sm" icon="arrow_upward" color="grey-6" dense @click="subStatus(props.row.aid,1)"/>
            <q-btn class="q-mr-sm" icon="delete_forever" color="red-8" dense @click="deleteArticle(props.row.aid)"/>
          </div>

          <div v-if="props.row.status===1">
            <q-btn class="q-mr-sm" icon="visibility" color="grey-6" dense @click="$store.commit('readArticle',props.row.aid)"/>
            <q-btn class="q-mr-sm" icon="arrow_downward" color="brown-5" dense @click="subStatus(props.row.aid,0)"/>
          </div>

          <div v-if="props.row.status===10">
            <q-btn class="q-mr-sm" icon="visibility" color="grey-6" dense @click="$store.commit('readArticle',props.row.aid)"/>
          </div>
        </q-td>
      </q-tr>
    </template>
  </q-table>
  <div class="bg-white q-px-md row justify-end">
    <div class="q-pa-sm text-subtitle2">共{{alist.pagination.total}}篇</div>
    <q-pagination
        v-model="alist.pagination.nowpage"
        :max="alist.pagination.lastpage"
        :input="true"
        color="brown-5"
    >
    </q-pagination>
  </div>

  <q-dialog v-model="selectcolshow" @hide="getArticleList">
    <q-card class="q-px-md" style="width:250px;height:500px;overflow-y:auto">
      <selectcol :data="$store.state.system.webcols" :selected="dc.cols" @change="setSelectCol"></selectcol>
    </q-card>
  </q-dialog>
</div>
</template>
<script>
import selectcol from '@/components/selectcol'
export default{
  name:'artmessage',
  components:{selectcol},
  data:()=>({
    show:false,loading:false,selectcolshow:false,
    alist:{
      pagination: {
        sortBy: 'desc',
        descending: false,
        page: 1,
        rowsPerPage: 10,
        lastpage:1,
        nowpage:1,
        total:0,
      },
      style: [
        {
          name: 'aid',
          required: true,
          label: 'ID',
          align: 'left',
          field: row => row.aid,
        },
        {
          name: 'title',
          required: true,
          label: '标题',
          align: 'left',
          field: row => row.title,
        },
        { 
          name: 'col', 
          align: 'left', 
          label: '栏目', 
          field: row => row.col
        },
        { 
          name: 'faceimg', 
          align: 'center', 
          label: '封面', 
          field: row => row.faceimg
        },
        {
          name:'audio',
          align:'center',
          label:'音频',
          field:row=>row.audio
        },
        {
          name:'style',
          align:'center',
          label:'样式',
          field:row=>row.style
        },
        { 
          name: 'createdate', 
          align: 'left', 
          label: '创建时间', 
          field: row => row.createdate
        },
        { 
          name: 'status', 
          align: 'left', 
          label: '状态', 
          field: row => row.status
        },
        {
          name:'actions',
          align:'center',
          label:'操作'
        }
      ],
      data: []
    },
    dc:{
      status:[0,1,10],
      cols:[],
      super:0,
      search:'',
    },
  }),
  created(){
    this.dc.cols = Object.assign([],this.$store.state.user.cols)
  },
  mounted(){
    this.getArticleList()
  },
  methods:{
    subStatus(aid,status){
      this.loading = true
      this.axios.post('changeStatus',{aid:aid,status:status}).then(response=>{
        this.loading = false
        this.getArticleList()
      }).catch(err=>{
        this.loading = false
      })
    },
    showSelectCol(){
      this.selectcolshow = true
    },
    setSelectCol(cols){
      this.dc.cols = Object.assign([],cols)
    },
    playAudio(data){
      this.$store.commit('playAudio',{
        audio:data.audio,img:data.faceimg,title:data.title
      })
    },
    getArticleList(){
      this.loading = true
      this.axios.post('articles',{limit:this.alist.pagination.rowsPerPage,page:this.alist.pagination.nowpage,status:this.dc.status,col:this.dc.cols,mode:'self',search:this.dc.search,super:this.dc.super}).then(response=>{
        this.alist.pagination.total =response.total
        this.alist.pagination.lastpage = response.lastpage
        this.alist.data = Object.assign([],response.list)
        this.loading = false
        this.show = true
      }).catch(err=>{
        this.loading = false
        this.show = true
      })
    },
    openEditor(aid){
      this.$router.push('artedit/'+aid)
    },
    deleteArticle(aid){
      this.axios.post('deleteArticle',{aid:aid}).then(response=>{
        this.getArticleList()
      })
    }
  },
  watch:{
    'alist.pagination.nowpage'(){
      this.getArticleList()
    }
  }
}
</script>
