<style scoped>
.rightys::before{
	content:'■';color:#B71C1C;margin-right:6px;
}
.cc{cursor:pointer;}
.cc:hover{background-color:#fff;filter:brightness(0.3);}
</style>
<template>
<div class="q-pa-md">
    <div style="overflow-y:auto;" :style="{height:height+'px'}" v-if="show">
    	<div class="row q-gutter-md">
    		<div style="width:300px">
    			<div class="bg-white cc" @click="$refs.ite.showd(19,content.m19,0,5)">
					<tm2 title="推荐阅读"></tm2>
				    <div class="q-px-sm">
				    	<q-img :src="content.m19[0].img" :ratio="16/9">
		    				<div class="absolute-bottom text-body2" style="padding:5px">
					            {{content.m19[0].title}}
					        </div>
		        		</q-img>
		        		<div v-for="item,index in content.m19" v-if="index>0&&index<5">
		        			<q-item class="q-py-sm q-px-none rightys" dense>
		            			<q-item-section>
		            				<q-item-label :lines="2" class="text-body2">{{item.title}}</q-item-label>
		            			</q-item-section>
		            		</q-item>
		        		</div>
				    </div>
				</div>
				<div class="full-width row">
				    <q-btn class="col-4" label="重置" color="grey-6" dense @click="reset('m19')"/>
				    <q-btn class="col-8" label="保存" color="red-10" dense @click="saveMod('m19')"/>
				</div>
			</div>
			<div style="width:300px">
    			<div class="bg-white cc" @click="$refs.ite.showd(20,content.m20,0,5)">
					<tm2 title="热门文章"></tm2>
				    <div class="q-px-sm">
				    	<q-img :src="content.m20[0].img" :ratio="16/9">
		    				<div class="absolute-bottom text-body2" style="padding:5px">
					            {{content.m20[0].title}}
					        </div>
		        		</q-img>
		        		<div v-for="item,index in content.m20" v-if="index>0&&index<5">
		        			<q-item class="q-py-sm q-px-none rightys" dense>
		            			<q-item-section>
		            				<q-item-label :lines="2" class="text-body2">{{item.title}}</q-item-label>
		            			</q-item-section>
		            		</q-item>
		        		</div>
				    </div>
				</div>
				<div class="full-width row">
				    <q-btn class="col-4" label="重置" color="grey-6" dense @click="reset('m20')"/>
				    <q-btn class="col-8" label="保存" color="red-10" dense @click="saveMod('m20')"/>
				</div>
			</div>
    	</div>
    </div>
    <ite ref="ite" @changeContent="changeContent"></ite>
</div>
</template>

<script>
import tm2 from '@/components/web/mod/TM2'
import ite from '@/components/web/dialog/imgtext'

export default {
name: 'homemessage',
components:{tm2,ite},
data:()=>({
	tab:0,height:0,show:false,
	mids:[19,20],
	content:{},
	server:{}
}),
created(){
	this.setHeight()
},
mounted(){
	this.getData()
},
methods:{
	setHeight(){
      let height = document.body.clientHeight
      this.height = height-60
    },
    getData(){
    	this.$q.loading.show()
    	this.axios.post('mod',{mid:this.mids}).then(respoense=>{
    		if(respoense){
    			this.content = Object.assign({},{},respoense)
    			this.server = JSON.parse(JSON.stringify(respoense))
    		}
    		
    		this.$q.loading.hide()
    		console.log(respoense)
    		this.show = true
    	}).catch(err=>{
    		this.$q.loading.hide()
    	})
    },
    changeContent(mid,data){
        this.$set(this.content,'m'+mid,data)
    },
    reset(mid){
    	this.content[mid] = Object.assign([],[],this.server[mid])
    },
    saveMod(mid){
    	this.$q.loading.show()
    	this.axios.post('saveMod',{mid:parseInt(mid.substring(1)),data:this.content[mid]}).then(respoense=>{
    		this.AItip('保存成功')
    		this.$q.loading.hide()
    	}).catch(err=>{
    		this.$q.loading.hide()
    	})
    }
}
}
</script>
