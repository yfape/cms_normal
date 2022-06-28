<style scoped>
.imgys{transition:box-shadow 0.3s;cursor:pointer;}
.imgys:hover{box-shadow:5px 5px 10px #AFB2B2,-5px -5px 10px #AFB2B2}
</style>
<template><div v-if="show">
	<header4 style="position:fixed;z-index:10;"></header4>
	<div style="height:60px"></div>
	<q-layout class="">
		<q-page-container>
	        <q-page>
				<div class="row q-pa-md" style="background:transparent;width:1100px;margin:0 auto">
					<div class="col-1 q-pr-sm" style="height:100px;text-align:right;border-right:5px solid #B71C1C;font-size:20px;font-weight:bold;line-height:25px">
						杂<br>志
					</div>
					<div class="col-11 q-px-xl row">
						<div class="col-3 q-pr-xl q-mb-lg" v-for="item in magazines">
							<q-img class="full-width imgys shadow-2" :ratio="7/9" :src="item.img" @click="gomaga(item.zid)"/>
							<div class="text-center">{{item.title}}</div>
						</div>
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
	magazines:[],
}),
mounted(){
	this.getData()
},
methods:{
	getData(){
		this.axios.get('magazines').then(response=>{
			if(response.code==200){
				this.magazines = Object.assign([],[],response.data)
				this.show = true
			}else{
				this.$router.push('/error')
			}
		})
	},
	gomaga(zid){
		this.$router.push('/magazine/'+zid)
	}
},
watch:{

}
}
</script>