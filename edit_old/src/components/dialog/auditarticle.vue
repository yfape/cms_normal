<style scoped>
.title{font-size:36px;margin-bottom:10px;font-weight:bold;}
#intro{height:45px;line-height:45px;margin:20px 0;box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000;}
#intro>#ys{float:left;}
#intro>#func{float:right;}
.art3{background-color:#F7F8F9;padding-bottom:10px;width:100%;margin-bottom:20px;}
</style>
<template>
  <q-dialog v-model="$store.state.auditarticle.show">
    <q-card style="min-width:1200px;" class="row" v-if="show">
      <div class="col-9 q-pa-md">
        <div class="title">{{article.title}}</div>
        <div id="intro" class="text-grey-14">
          <div id="ys">{{getLocalTime(article.createdate)}} {{article.source}}</div>
          <div id="func">
            <q-btn v-if="article.audio" flat round color="red-10" icon="headset" @click="$store.commit('playAudio',{audio:article.audio,img:article.faceimg,title:article.title})">
                <q-tooltip>
                听文章
                </q-tooltip>
            </q-btn>
          </div>
        </div>
        <div class="full-width" v-html="article.content"></div>
      </div>
      <div class="col-3 q-pa-md">
        <div style="position:fixed;">
          <q-btn color="brown-5" label="退回文章" icon="close" class="q-mr-md" @click="subStatus(article.aid,0)" :loading="loading"/>
          <q-btn color="grey-6" label="审核通过" icon="check" @click="subStatus(article.aid,10)" :loading="loading"/>
        </div>
        <checkinfo :textcensor="article.check.textcensor" :ecnet="article.check.ecnet" class="q-mt-xl"></checkinfo>
      </div>
    </q-card>
  </q-dialog>
</template>

<script>
import checkinfo from '@/components/checkinfo'
export default {
  nme:'auditarticle',
  components:{checkinfo},
  data:()=>({
    loading:false,show:false,
    article:{content:'',check:{textcensor:[],ecnet:[]}}
  }),
  created(){},
  mounted(){
    this.getArticle()
  },
  methods: {
    getArticle(){
      this.axios.post('getArticle',{aid:this.$store.state.auditarticle.aid}).then(response=>{
        this.article = Object.assign({},response)
        this.show = true
      })
    },
    subStatus(aid,status){
      this.loading = true
      this.axios.post('changeStatus',{aid:aid,status:status}).then(response=>{
        this.loading = false
        this.$store.state.auditarticle.show = false
      }).catch(err=>{
        this.loading = false
      })
    },
  }
}
</script>