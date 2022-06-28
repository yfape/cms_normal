<style scoped>
.mt{font-size:10px;}
</style>
<template>
<div v-if="show">
    <q-dialog v-model="show" position="right" @hide="initd">
        <q-card class="full-height bg-grey-2" style="width:300px">
            <!--栏目选择-->
	        <div class="bg-grey-2 q-pa-md" style="position:fixed;width:300px;z-index:1;">
                <q-btn label="添加" color="red-10" class="full-width" @click="saveItem"/>
            </div>
            <div style="height:50px"></div>
            <div class="q-pa-md">
                <q-item clickable tag="label" v-ripple v-for="item in server.list" v-if="item.valid">
                    <q-item-section thumbnail>
                        <q-checkbox dense v-model="res" :val="item" :disable="disable&&(res.indexOf(item)==-1)" color="red-10"/>
                    </q-item-section>
                    <q-item-section>
                        <div class="text-grey-6 mt">ID.{{item.zid}}</div>
                        <q-item-label caption>
                            {{item.title}}
                        </q-item-label>
                    </q-item-section>
                </q-item>       
            </div>

            <q-inner-loading :showing="loading">
                <q-spinner-hourglass color="red-10" size="30px"/>
            </q-inner-loading>
        </q-card>
    </q-dialog>

    <q-dialog v-model="selectcolshow" @hide="">
	    <q-card class="q-px-md" style="width:250px;height:500px;overflow-y:auto">
	      	<selectcol :data="$store.state.system.webcols" :selected="dc.col" @change="setSelectCol"></selectcol>
	    </q-card>
	</q-dialog>
</div>
</template>
<script>
import selectcol from '@/components/selectcol'
export default {
name:'selecttopic',
components:{selectcol},
data:()=>({
    show:false,selectcolshow:false,loading:false,disable:false,len:0,disload:false,
    dc:{},
    initdc:{page:1,status:[10],col:[],search:'',limit:20},
    server:{
        list:[],total:0,lastpage:0
    },
    res:[]
}),
created(){
},
methods: {
    initd(){
        this.dc = Object.assign({},{},this.initdc)
        this.res = []
        this.server = {list:[],total:0,lastpage:0}
        this.disload = false
        this.disable = false
        this.loading = false
    },
 	showd(len=1){
        this.initd()
        this.len = len
 		this.setInitCols()
        this.getArticleList()
 		this.show = true
 	},
 	showSelectCol(){
        this.selectcolshow = true
    },
    setSelectCol(cids){
        this.dc.col = Object.assign([],cids)
    },
    setInitCols(){
    	let main = this.$store.state.system.webcols
    	let arr = []
    	for(let i in main){
    		arr.push(main[i].cid)
    		let child = main[i].children
    		for(let j in child){
    			arr.push(child[j].cid)
    		}
    	}
    	this.dc.col = arr
    },
    saveItem(){
        if(this.res.length>0){
            this.$emit('change',this.res)
        }
        this.show = false
    },
    getArticleList(){
        this.loading = true
        this.axios.post('getMagazines').then(response=>{
            this.server.list = Object.assign([],[],response.magazines)
            this.loading = false
        }).catch(err=>{
            this.loading = false
        })
    },
},
watch:{
    'res'(){
        this.disable = (this.res.length>=this.len)?true:false
    }
},
}
</script>