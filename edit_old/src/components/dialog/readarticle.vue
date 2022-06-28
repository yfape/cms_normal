<style scoped>
.title{font-size:36px;margin-bottom:10px;font-weight:bold;}
#intro{height:45px;line-height:45px;margin:20px 0;box-shadow:0px 0.3px 0.3px #000,0px -0.3px 0.3px #000;}
#intro>#ys{float:left;}
#intro>#func{float:right;}
.art3{background-color:#F7F8F9;padding-bottom:10px;width:100%;margin-bottom:20px;}
</style>
<template>
  <q-dialog v-model="$store.state.readarticle.show">
    <q-card style="min-width:900px;" class="row" v-if="show">
      <div class="col-12 q-pa-md">
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
    </q-card>
  </q-dialog>
</template>

<script>
export default {
  nme:'readarticle',
  data:()=>({
    show:false,
    article:{content:''}
  }),
  created(){},
  mounted(){
    this.getArticle()
  },
  methods: {
    getArticle(){
      this.axios.post('getArticle',{aid:this.$store.state.readarticle.aid}).then(response=>{
        this.article = Object.assign({},response)
        this.show = true
      })
    },
  }
}
</script>