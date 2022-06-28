<template><div v-if="show" class="q-pa-lg">
	<div class="row q-mb-lg">
		<div class="col-2 q-pr-md">
			<q-item clickable class="bg-white">
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">首页</q-item-label>
					<q-item-label :lines="1" caption>/home</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_edit" color="green" @click="$router.push('/homemessage')"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-2 q-pr-md">
			<q-item clickable class="bg-white" disable>
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">栏目列表页</q-item-label>
					<q-item-label :lines="1" caption>/list/:cid</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_signal_cellular_no_sim" color="green"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-2 q-pr-md">
			<q-item clickable class="bg-white" disable>
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">杂志列表页</q-item-label>
					<q-item-label :lines="1" caption>/magazines</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_signal_cellular_no_sim" color="green"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-2 q-pr-md">
			<q-item clickable class="bg-white" disable>
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">杂志浏览页</q-item-label>
					<q-item-label :lines="1" caption>/magazine/:zid</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_signal_cellular_no_sim" color="green"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-2 q-pr-md">
			<q-item clickable class="bg-white" disable>
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">专题列表页</q-item-label>
					<q-item-label :lines="1" caption>/page/:pid</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_signal_cellular_no_sim" color="green"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-2">
			<q-item clickable class="bg-white" disable>
				<q-item-section >
					<q-item-label :lines="1" class="text-subtitle1 text-bold">文章阅览页</q-item-label>
					<q-item-label :lines="1" caption>/article/:aid</q-item-label>
				</q-item-section>
				<q-item-section></q-item-section>
				<q-item-section thumbnail>
					<div class="row justify-end q-gutter-md q-pr-sm">
						<q-btn flat round icon="o_signal_cellular_no_sim" color="green"/>
					</div>
				</q-item-section>
			</q-item>
		</div>
	</div>

	<div>
		<q-table class="no-shadow" color="red-10" :data="list.data" :columns="list.config"row-key="pid" :loading="loading">
			<template v-slot:top="props">
				<q-btn label="新增页面" icon="add" color="red-10" @click="$router.push('/topic/-1')" dense class="q-px-sm" outline/>
			</template>
		    <template v-slot:body="props">
		        <q-tr :props="props" :class="[[props.row.valid?'':'bg-grey-3']]">
		          <q-td key="pid" :props="props">{{ props.row.pid }}</q-td>
		          <q-td key="title" :props="props">{{ props.row.title }}</q-td>
		          <q-td key="img" :props="props"><q-img contain class="tableimg" :src="props.row.img"/></q-td>
		          <q-td key="createdate" :props="props">{{ timeDate(props.row.createdate) }}</q-td>
		          <q-td key="editor" :props="props">{{ props.row.editor }}</q-td>
		          <q-td key="valid" :props="props">
		            <q-toggle :disable="loading" v-model="props.row.valid" :true-value="1" :false-value="0" color="red-10" checked-icon="check" unchecked-icon="clear" @input="changeValid(props.row.pid)"/>
		            <span class="text-caption text-grey">{{ props.row.valid?'启用':'禁用' }}</span>
		          </q-td>
		          <q-td key="actions" :props="props">
		              <q-btn :disable="loading" flat dense round icon="o_edit" color="green" class="q-ml-sm" @click="$router.push('/topic/'+props.row.pid)"/>

		              <q-btn :disable="loading" flat dense round icon="o_delete_forever" color="red-10" class="q-ml-sm"/>
		          </q-td>
		        </q-tr>
		    </template>
	    </q-table>
	</div>	

</div></template>
<script>
export default{
name:'pages',
components:{},
data(){return {
	show:true,loading:false,
	list:{
    config:[
      { name: 'pid', required: true, label: '页面ID', align: 'left', field: row => row.pid, style:'width:60px'},
      { name: 'title', required: true, label: '名称', align: 'left', field: row => row.title},
      { name: 'img', required: true, label: '封面', align: 'center', field: row => row.img},
      { name: 'createdate', required: true, label: '创建日期', align: 'left', field: row => row.createdate, style:'width:60px'},
      { name: 'editor', required: true, label: '创建人', align: 'left', field: row => row.editor, style:'width:100px'},
      { name: 'valid', required: true, label: '状态', align: 'center', field: row => row.valid},
      { name: 'actions', label: '操作', align: 'right'},
    ],
    data:[
      {pid:1,title:'测试页面一',createdate:1595039046,img:'http://file.scdjw.net/upload/20200716/9c04654af97f4c414ee7d9dc937303c3.png',editor:'刘尧夫',valid:1}
    ],
    page:1
  },
}},
mounted(){
  this.getData()
},
methods:{
	getData(){
    	this.loading = true
		this.axios.post('pages',{page:this.list.page}).then(res=>{
      		this.list.data = Object.assign([],[],res.list)
			this.show = true
      		this.loading = false
		})
	},
  	changeValid(pid){
    	this.loading = true;
    	this.axios.post('pageValid',{pid:pid}).then(res=>{
      		this.loading = false
    	}).catch(err=>{
      		this.getData()
      		this.loading = false
    	})
  	}
},
watch:{},
destroy(){},
}
</script>
<style scoped>
.tableimg{height:50px;}
</style>