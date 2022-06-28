<style scoped>
.ys{height:140px}
</style>
<template><div v-if="show" class="bg-grey-2">
	<header4 style="position:fixed;z-index:10;"></header4>
	<div style="height:60px" class="bg-grey-2"></div>
	<div class="q-pa-md bg-grey-2" style="min-height:980px;width:900px;margin:0 auto">
		
		<q-input style="width:600px;margin:0 auto" color="red-10" label="搜索" placeholder="请输入搜索内容" filled v-model="search">
			<template v-slot:append>
				<q-btn dense icon="search" flat color="red-10" @click="getsearch"/>
			</template>
		</q-input>
		<q-item clickable v-for="item in content" class="q-mt-md q-pa-md shadow-2 bg-white ys" @click="goArticle(item.aid)">
			<q-item-section thumbnail v-if="item.img" class="q-pl-md" style="width:200px">
				<q-img class="full-height full-width" :src="item.img"/>
			</q-item-section>
			<q-item-section class="column full-height">
				<div class="text-h6 col-8">{{item.title}}</div>
				<div class="col-4 row justify-between items-end">
					<div><q-chip :label="item.col"></q-chip></div>
					<div class="text-grey">{{df(item.createdate)}}</div>
				</div>
			</q-item-section>
		</q-item>
	</div>
	<footer1></footer1>
</div></template>
<script>
import header4 from '@/components/header/header4'
export default{
	name:'search',
	components:{header4},
	props:['text'],
	data:()=>({
		show:false,
		search:'',
		content:[],
	}),
	mounted(){
		this.search = this.text
		this.getsearch()
	},
	methods:{
		getsearch(){
			this.axios.get('search/'+this.search).then(response=>{
				if(response.code==200){
					this.content = Object.assign([],[],response.data)
					this.show = true
				}else{
					this.$router.replace('/error')
				}
			})
		}
	},
	watch:{
		'search'(){
			this.$router.replace('/search/'+this.search)
		}
	}
}
</script>