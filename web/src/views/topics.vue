<style scoped>
.imgys{transition:box-shadow 0.3s;cursor:pointer;}
.imgys:hover{box-shadow:2px 5px 10px #AFB2B2,-2px -2px 10px #AFB2B2}
</style>
<template><div v-if="show">
	<header4 style="position:fixed;z-index:10;"></header4>
	<div style="height:60px"></div>
	<q-layout>
		<q-page-container>
	        <q-page>
				<div class="row q-pa-md" style="background:transparent;width:1000px;margin:0 auto">
					<div class="col-1 q-pr-sm" style="height:100px;text-align:right;border-right:5px solid #B71C1C;font-size:20px;font-weight:bold;line-height:25px">
						专<br>题
					</div>
					<div class="col-11 row justify-center" style="position: relative;right:50px">
						<div class="q-mb-lg col-8" v-for="item in topics">
							<q-img v-if="item.img" class="full-width imgys shadow-2" :src="item.img" @click="gotopic(item.tid)">
								<div class="absolute-bottom text-subtitle2">{{item.title}}</div>
							</q-img>
							<q-card v-if="!item.img" class="bg-white text-subtitle2 shadow-2 imgys" @click="gotopic(item.tid)"><q-card-section>{{item.title}}</q-card-section></q-card>
						</div>
						<div v-if="topics.length<=0" class="col-8 text-center text-subtitle1 text-grey">暂无可见专题</div>
					</div>
				</div>

		        <q-page-scroller position="bottom-right" :scroll-offset="150" :offset="[18, 18]">
		        	<q-btn icon="keyboard_arrow_up" color="red-10"/>
		        </q-page-scroller>
	        </q-page>
	    </q-page-container>
	</q-layout>
	<footer1></footer1>
</div></template>
<script>
import header4 from '@/components/header/header4'

export default{
name:'magazines',
props:[''],
components:{header4},
data:()=>({
	show:false,
	topics:[],
}),
mounted(){
	this.getData()
},
methods:{
	getData(){
		this.axios.get('topics').then(response=>{
			if(response.code==200){
				this.topics = Object.assign([],[],response.data)
				this.show = true
			}else{
				this.$router.push('/error')
			}
		})
	},
	gotopic(zid){
		this.$router.push('/topic/'+zid)
	}
},
watch:{

}
}
</script>