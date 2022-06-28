<template><div>
	<q-infinite-scroll @load="onLoad" :offset="10" :disable="scrolldisable">
		<div v-for="item,index in content">
			<q-item clickable v-ripple @click="goArticle(item.aid)" :class="[
				'q-mb-sm q-py-sm',[$q.dark.isActive?'bg-grey-10':'bg-white']
				]">
				<q-item-section>
					<q-item-label :lines="2" class="cfont text-subtitle1">{{item.title}}</q-item-label>
					<q-item-label :lines="1" caption class="row q-pt-sm items-center">
						<q-chip square dense size="10px" :color="$q.dark.isActive?'grey-8':'grey-3'" :text-color="$q.dark.isActive?'grey-4':'grey-7'">{{item.col}}</q-chip> / {{timefor(item.createdate,now)}}
						<q-space /> {{item.source}}
					</q-item-label>
				</q-item-section>
				<q-item-section thumbnail v-if="item.img">
					<img :src="item.img" class="full-height"/>
				</q-item-section>
			</q-item>
		</div>
		<template v-slot:loading>
        	<div class="row justify-center q-my-lg">
          		<q-spinner-dots color="red-10" size="30px" />
        	</div>
      	</template>
	</q-infinite-scroll>
	<q-page-scroller position="bottom-right" :scroll-offset="150" :offset="[18, 18]">
    	<q-btn dense icon="keyboard_arrow_up" color="red-10"/>
    </q-page-scroller>
</div></template>
<script>
export default{
	name:'list',
	props:['cid'],
	data:()=>({
		content:[],show:false,scrolldisable:false,page:0,now:0,
	}),
	mounted(){
		window.scrollTo(0, 0)
		this.setNow()
		this.setTitle()
	},
	methods:{
		setNow(){
			this.now = Date.parse(new Date())/1000;
		},
		setTitle(){
		    var nav = this.$store.state.nav
		    for(let i in nav){
		      if(nav[i].url == '/list/'+this.cid){
		        document.title = '四川党建网 - '+nav[i].text
		      }
		    }
		},
		getData(){
			this.page = 1
			this.axios.get('list/'+this.cid+'/'+this.page,{params:{mode:1}}).then(response=>{
    			this.content = Object.assign([],[],response)
				window.scrollTo(0, 0)
				this.show = true
			})
		},
		onLoad (index, done) {
	    	this.page = this.page+1
	    	this.axios.get('list/'+this.cid+'/'+this.page,{params:{mode:1}}).then(response=>{
    			if(response.length<=0){
	    			this.scrolldisable = true
	    		}else{
	    			this.content.push(...response)
	    		}
	    		this.tabdisable = false
	    		this.show = true
				done()
			})
	    }
	},
	watch:{
		'$route.path'(){
			this.setNow()
			this.setTitle()
			this.getData()
		}
	}
}
</script>