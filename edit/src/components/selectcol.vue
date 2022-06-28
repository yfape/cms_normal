<style scoped>
	
</style>
<template><div>
	<q-tree
      	:nodes="nodes"
      	node-key="cid"
      	tick-strategy="strict"
      	:ticked.sync="cols"
      	color="brown-5"
		accordion
		:disabled="disabled===''"
    >
      	<template v-slot:default-header="prop">
      		<q-item dense>
      			<q-item-section>
      				{{ prop.node.col }}
      			</q-item-section>
      		</q-item>
      	</template>
    </q-tree>
</div></template>
<script>
export default{
	name:'selectcol',
	props:['disabled','data','selected'],
	data:()=>({
		cols:[],
		nodes:[],
	}),
	mounted(){
		this.nodes = this.data
		this.cols = this.selected?this.selected:[]
	},
	methods:{
		
	},
	destroyed(){
	},
	watch:{
		'cols'(){
			this.$emit('change',this.cols)
		}
	}
}
</script>