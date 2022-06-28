<style src="../common.css" scoped></style>
<style scoped>
.main{overflow:hidden;height:303px;}
.head{height:45px;}
.headline{position:relative;top:1px;width:100%;height:2px;border-bottom:1px solid transparent;border-image:linear-gradient(to bottom,transparent 50%, #9E9E9E 50%) 0 0 100%/1px 0;}
.touer{font-size:18px;width:100px!important;font-weight:bold;}
.ys{font-size:14px}

.inimg{height:152px;cursor:pointer;}
.inimg2{height:88px;cursor:pointer;}
.intext{font-size:12px;line-height:16px;opacity:0;transition:opacity 0.3s;}
.inimg2:hover .intext{opacity:1}
</style>
<template><div class="main">
   <div>
        <div class="headline"></div>
        <div class="head">
            <q-tabs :breakpoint="0"
                indicator-color="red-10"
                align="left"
                switch-indicator dense
                v-model="tab"
                active-color="red-10"
            >
                <q-tab v-for="(item,index) in record.head" :class="(index===0)?'touer':'ys'" :name="item.cid" @click="setData(item.cid)">
                	<span>{{item.col}}</span>
                </q-tab>
            </q-tabs>
        </div>
	   	<div class="row" v-if="indata.mode==2">
        	<div class="col-6" style="padding-right:4px">
        		<div class="q-mb-sm">
    				<q-img class="inimg" :src="indata.content[0].img">
			          	<div class="absolute-bottom text-subtitle2 textinimg">
			            	{{indata.content[0].title}}
			          	</div>
			        </q-img>
        		</div>
			    <tb1 :content="indata.content" :start="1" :end="3"></tb1>
        	</div>
        	<div class="col-6" style="padding-left:4px">
        		<div class="q-mb-sm">
    				<q-img class="inimg" :src="indata.content[4].img" >
			          	<div class="absolute-bottom text-subtitle2 textinimg">
			            	{{indata.content[4].title}}
			          	</div>
			        </q-img>
        		</div>
			    <tb1 :content="indata.content" :start="5" :end="7"></tb1>
        	</div>
	   	</div>

   		<div class="row" v-if="indata.mode==1">
        	<div class="col-6">
        		<div class="q-mb-sm">
    				<q-img class="inimg" :src="indata.content[0].img">
			          	<div class="absolute-bottom text-subtitle2 textinimg">
			            	{{indata.content[0].title}}
			          	</div>
			        </q-img>
    			</div>
    			<div class="row">
    				<div class="col-6" style="padding-right:4px">
        				<q-img class="inimg2" :src="indata.content[1].img">
                            <div class="absolute-full flex flex-center intext">
                                {{indata.content[1].title}}
                            </div>            
                        </q-img>
        			</div>
        			<div class="col-6" style="padding-left:4px">
        				<q-img class="inimg2" :src="indata.content[2].img">
                            <div class="absolute-full flex flex-center intext">
                                {{indata.content[2].title}}
                            </div> 
                        </q-img>
        			</div>
    			</div>
        	</div>
        	<div class="col-6 q-pl-sm">
        		<tb1 :content="indata.content" :start="3" :end="10"></tb1>
        	</div>
	   	</div>
    </div>
</div></template>
<script>
import tb1 from './tb1'
export default{
	name:'itb3',
	props:['record'],
	components:{tb1},
	data:()=>({
		tab:0,show:false,
		indata:{},
	}),
	mounted(){
		this.init()
	},
	methods:{
		init(){
			this.tab = this.record.head[0].cid
			this.setData(this.tab)
		},
		setData(cid){
			this.indata = Object.assign({} ,this.record.content['c'+cid])
		},
	}
}
</script>