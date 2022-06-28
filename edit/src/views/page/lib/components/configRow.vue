<template>
	<q-dialog v-model="show" position="bottom">
		<q-card class="row" style="min-width:900px">
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">布局</div>
				<q-item tag="label" dense class="q-mb-sm bg-grey-2 q-pa-sm">
			        <q-item-section class="text-left text-grey text-caption">
			          	<q-item-label>{{row.fw==1?'全宽行':'限宽行'}}</q-item-label>
			        </q-item-section>
			        <q-item-section side>
			          	<q-toggle dense color="red-10" v-model="row.fw" :true-value="1" :false-value="0" @input="reflesh"/>
			        </q-item-section>
			    </q-item>
				<margin :data.sync="row"/>
				<flex :data.sync="row"/>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">背景</div>
				<background :data.sync="row"/>
			</div>
			<div class="col q-pa-md">
				<q-separator/><div class="q-mb-sm text-caption text-grey">边框</div>
				<border :data.sync="row" @reflesh="reflesh"/>
			</div>
		</q-card>
	</q-dialog>
</template>
<script>
import margin from './temp/margin'
import background from './temp/background'
import border from './temp/border'
import flex from './temp/flex'
export default{
name:'configRow',
components:{margin,background,border,flex},
props:['row'],
data(){return {
	show:false,
}},
mounted(){},
methods:{
	showPanel(){this.show=true},
	reflesh(){this.$emit('update:row',this.row)}
},
watch:{

},
destroy(){},
}
</script>
<style scoped>

</style>