<template>
	<q-dialog v-model="show">
		<q-card class="q-pa-md no-shadow" style="min-width:900px">
			<q-tabs v-model="diamain" class="text-teal">
				<q-tab class="col-3" name="12">
					<div class="bdr" style="margin:0 auto"></div>
					<div class="text-center text-caption text-grey">100%整框架</div>
				</q-tab>
				<q-tab class="col-3" name="6+6">
					<div class="row items-center justify-center">
						<div class="bdr"></div>
						<div class="bdr"></div>
					</div>
					<div class="text-center text-caption text-grey">1:1框架</div>
				</q-tab>
				<q-tab class="col-3" name="4+8">
					<div class="row items-center justify-center">
						<div class="bdr" style="width:50px"></div>
						<div class="bdr" style="width:100px"></div>
					</div>
					<div class="text-center text-caption text-grey">1:2框架</div>
				</q-tab>
				<q-tab class="col-3" name="8+4">
					<div class="row items-center justify-center">
						<div class="bdr" style="width:100px"></div>
						<div class="bdr" style="width:50px"></div>
					</div>
					<div class="text-center text-caption text-grey">2:1框架</div>
				</q-tab>
			</q-tabs>			
			<q-separator class="q-my-sm"/>
			<div class="text-right bg-white row justify-between">
				<q-input outlined color="red-10" label="自定义比例框架" v-model="diamain" dense style="width:500px"/>
				<div class="row items-end">
					<q-btn flat class="q-px-sm" label="插入全宽框架" color="grey-7" @click="addRow(1)" v-close-popup/>
					<q-btn class="q-px-sm q-ml-md" label="插入限宽框架" color="red-10" @click="addRow(0)" v-close-popup/>
				</div>
			</div>
		</q-card>
	</q-dialog>
</template>
<script>
export default{
name:'insertRow',
components:{},
props:[],
data(){return {
	show:false,diamain:'12'
}},
mounted(){},
methods:{
	showPanel(){this.show = true},
	addRow(fullwidth){
		let dd = {col:[]}
		dd.fw = fullwidth
		let cols = this.diamain.split('+')
		for(let i in cols){
			dd.col.push({c:cols[i],cp:[]})
		}
		this.$emit('addRow',dd)
	},
},
watch:{},
destroy(){},
}
</script>
<style scoped>
.bdr{border:1px dashed #4E4D4D;height:80px;width:80px;}
</style>