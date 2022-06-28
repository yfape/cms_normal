<template>
	<q-dialog v-model="show" position="bottom">
		<q-card class="row" style="min-width:900px">
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">基本属性</div>
				<q-input filled label="专题名" v-model="page.title" dense color="red-10" class="q-mt-sm" @input="syncData"/>
				<q-input filled label="链接" :value="page.pid==0?'未保存，暂无链接':($store.state.domain.web+'/page/'+page.pid)" readonly dense color="red-10" class="q-mt-sm" @input="syncData"/>
				<q-select dense filled class="q-mt-sm" color="red-10" v-model="page.header" :options="headers" label="头部导航" emit-value map-options option-value="value" option-label="text" @input="syncData"/>
				<q-select dense filled class="q-mt-sm" color="red-10" v-model="page.footer" :options="footers" label="底部导航" emit-value map-options option-value="value" option-label="text" @input="syncData"/>
				<upload1 class="q-mt-sm" :img.sync="page.img"/>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">样式</div>
				<upload1 class="q-mt-sm" intro="背景图" :img.sync="page.backimg"/>
				<q-input filled dense label="背景色" color="red-10" v-model="page.backcolor" class="q-mt-sm" @input="syncData">
			        <template v-slot:append>
			          	<q-icon name="colorize" class="cursor-pointer">
			            	<q-popup-proxy transition-show="scale" transition-hide="scale">
			              		<q-color v-model="page.backcolor" format-model="hex" no-header/>
			            	</q-popup-proxy>
			          	</q-icon>
			          	<q-btn flat icon="close" dense @click="page.backcolor='transparent'"/>
			        </template>
			    </q-input>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">操作</div>
				<q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{page.valid==1?'启用':'禁用'}}页面</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="page.valid" :true-value="1" :false-value="0" @input="syncData"/>
			        </q-item-section>
			    </q-item>
			    <q-btn icon="o_refresh" label="重置页面" class="full-width q-mb-sm" dense color="grey" @click="$emit('resetPage')"/>
			    <q-btn icon="o_power_settings_new" label="保存页面" class="full-width q-mb-sm" dense color="red-10" @click="$emit('savePage')"/>
			</div>
		</q-card>
	</q-dialog>
</template>
<script>
import upload1 from '@/components/upload1'
export default{
name:'settingsPanel',
components:{upload1},
props:['page'],
data(){return {
	show:false,
	headers:[{value:0,text:'无'},{value:1,text:'样式一'},{value:2,text:'样式二'},{value:3,text:'样式三'}],
	footers:[{value:0,text:'无'},{value:1,text:'样式一'}],
}},
mounted(){

},
methods:{
	showPanel(){this.show = true},
	syncData(){this.$emit('update:page',this.page)}
},
watch:{},
destroyed(){},
}
</script>
<style scoped>

</style>