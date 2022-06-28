<template>
	<q-dialog position="bottom" v-model="$store.state.tool.show">
		<q-card>
			<q-card-section>
				<q-input class="q-mb-sm" dense filled color="red-10" placeholder="搜索 ... " v-model="search">
					<template v-slot:append class="q-pa-none">
						<q-btn flat fab-mini icon="o_search" @click="gosearch"/>
					</template>
				</q-input>
				<q-separator/>
				<q-item tag="label" v-ripple class="q-mt-sm q-py-none">
			        <q-item-section>
			          	<q-item-label>夜间模式</q-item-label>
			          	<q-item-label caption>暗色调</q-item-label>
			        </q-item-section>
			        <q-item-section thumbnail>
			          	<q-toggle color="red-10" v-model="$store.state.tool.dark" @input="changeTheme"/>
			        </q-item-section>
			    </q-item>
			    <q-item tag="label" v-ripple class="q-py-none">
			        <q-item-section>
			          	<q-item-label>大字模式</q-item-label>
			          	<q-item-label caption>切换至大号字体</q-item-label>
			        </q-item-section>
			        <q-item-section thumbnail>
			          	<q-toggle color="red-10" v-model="$store.state.tool.largefont" @input="changeFont"/>
			        </q-item-section>
			    </q-item>
			    <q-separator class="q-my-sm"/>
			    <div class="row">
			    	<div class="col-6">
			    		<q-btn class="full-width" label="我的收藏" icon="o_star_border" flat/>
			    	</div>
			    	<div class="col-6">
			    		<q-btn class="full-width" label="浏览记录" icon="o_history" flat/>
			    	</div>
			    </div>
			</q-card-section>
		</q-card>
	</q-dialog>
</template>
<script>
export default{
	name:'tool',
	data:()=>({
		search:''
	}),
	mounted(){},
	methods:{
		gosearch(){

		},
		changeTheme(){
			this.$q.dark.set(this.$store.state.tool.dark)
		},
		changeFont(){
			console.log(this.$store.state.tool.largefont)
		}
	},
	watch:{
		'$q.dark.isActive'(){
			this.$store.state.tool.dark = this.$q.dark.isActive
		}
	}
}
</script>
