<template>
<div class="q-pa-md" v-if="show">
    <q-tree
      :nodes="content"
      node-key="text"
      accordion
    >
      	<template v-slot:default-header="prop">
      		<q-item dense class="bg-white full-width" clickable>
      			<q-item-section>
      				<q-item-label class="row">
      					<div class="q-pr-md">{{prop.node.text}}</div>
      					<div class="q-px-sm text-grey-5" v-if="prop.node.url">链接：{{prop.node.url}}</div>
      					<div class="q-px-sm text-grey-5" v-if="prop.node.cid">栏目ID：{{prop.node.cid}}</div>
      				</q-item-label>
      			</q-item-section>
      			<q-item-section side>
      				<div class="row">
      					<q-btn label="修改" dense flat @click="showAdd(prop.key,0)"/>
      					<q-btn label="删除" dense flat v-if="(!prop.node.children)||(prop.node.children.length<=0)" @click="deleteItem(prop.key)"/>
      					<q-btn flat dense label="新增子项" v-if="prop.node.children" @click="showAdd(prop.key,1)"/>
      					<q-btn flat dense icon="expand_less" @click="sortup(prop.key)"/>
			      		<q-btn flat dense icon="expand_more" @click="sortdown(prop.key)"/>
      				</div>
      			</q-item-section>
      		</q-item>
      	</template>
    </q-tree>
    <div class="text-right q-mt-sm">
    	<q-btn icon="add" color="brown-5" label="新增主项" @click="showAdd(0,1)"/>
    	<q-btn icon="cached" color="grey-6" label="重置" class="q-ml-sm" @click="resetNav"/>
    	<q-btn icon="save" color="red-10" label="保存" class="q-ml-sm" @click="saveNav"/>
    </div>
    <q-dialog v-model="dialog.show" persistent>
    	<q-card class="bg-white" style="width:350px">
    		<q-bar>
	          	<div>{{!dialog.mode?'保存':'新增'}}</div>
	          	<q-space />
	          	<q-btn dense flat icon="close" v-close-popup/>
	        </q-bar>
	        <q-card-section>
	        	<q-input dense filled v-model="dialog.data.text" label="文字" class="q-mb-md" color="brown-5"/>
	        	<q-input dense filled v-model="dialog.data.url" label="链接" class="q-mb-md" color="brown-5"/>
	        	<q-input dense filled v-model="dialog.data.cid" label="栏目ID" class="q-mb-md" color="brown-5"/>
	        	<q-btn label="保存" v-if="dialog.mode==0" class="full-width" color="brown-5" icon="save" @click="saveItem" v-close-popup/>
	        	<q-btn label="新增" v-if="dialog.mode==1" class="full-width" color="brown-5" icon="add" @click="addItem" v-close-popup/>
	        </q-card-section>
    	</q-card>
    </q-dialog>
</div>
</template>

<script>
export default {
name: 'navmessage',
components:{},
data:()=>({
	show:false,
	content:[],
	server:[],
	dialog:{show:false,mode:0,key:'',data:{text:'',url:'',cid:0}}
}),
created(){},
mounted(){
	this.getData()
},
methods:{
	getData(){
		let _this = this
		this.axios.post('nav').then(response=>{
			if(response){
				this.server = JSON.parse(JSON.stringify(response))
				this.content = JSON.parse(JSON.stringify(response))
			}
			this.show = true
		})
	},
	saveItem(){
		let text = this.dialog.key
		for(let i in this.content){
			if(this.content[i].text == text){
				this.content[i].text = this.dialog.data.text
				this.content[i].url = this.dialog.data.url
				this.content[i].cid = this.dialog.data.cid
				break;
			}else{
				if(this.content[i].children){
					let arr = this.content[i].children
					for(let j in arr){
						if(arr[j].text == text){
							this.content[i].children[j].text = this.dialog.data.text
							this.content[i].children[j].url = this.dialog.data.url
							this.content[i].children[j].cid = this.dialog.data.cid
							break
						}
					}
				}
			}
		}
	},
	addItem(){
		if(this.dialog.key){
			let text = this.dialog.key
			for(let i in this.content){
				if(this.content[i].text == text){
					this.content[i].children.push({text:this.dialog.data.text,url:this.dialog.data.url,cid:this.dialog.data.cid})
					break;
				}
			}
		}else{
			this.content.push({text:this.dialog.data.text,url:this.dialog.data.url,children:[],cid:0})
		}
	},
	resetNav(){
		// this.content = JSON.parse(JSON.stringify(this.server))
		this.$q.loading.show()
		this.axios.post('refleshNav').then(response=>{
			if(response){
				this.server = JSON.parse(JSON.stringify(response))
				this.content = JSON.parse(JSON.stringify(response))
			}
			this.$q.loading.hide()
		})
	},
	deleteItem(text){
		for(let i in this.content){
			if(this.content[i].text == text){
				this.content.splice(i,1)
				break;
			}else{
				if(this.content[i].children){
					let arr = this.content[i].children
					for(let j in arr){
						if(arr[j].text == text){
							this.content[i].children.splice(j,1)
							break
						}
					}
				}
			}
		}
	},
	saveNav(){
		this.$q.loading.show({message:'保存中'})
		this.axios.post('saveNav',{nav:this.content}).then(response=>{
			this.getData()
			this.$q.loading.hide();
		}).catch(err=>{
			this.$q.loading.hide();
		})
	},
	sortup(text){
		let index = 0;
		for(var i in this.content){
			i = parseInt(i)
			if(this.content[i].text == text&&this.content[i-1]){
				let temp = Object.assign({},{},this.content[i])
				this.content[i] = Object.assign({},{},this.content[i-1])
				this.content[i-1] = Object.assign({},{},temp)
				break;
			}else if(this.content[i].children){
				let arr = this.content[i].children
				for(let j in arr){
					j = parseInt(j)
					if(arr[j].text == text&&this.content[i].children[j-1]){	
						let t = Object.assign({},{},arr[j])
						this.content[i].children[j] = Object.assign({},{},this.content[i].children[j-1])
						this.content[i].children[j-1] = Object.assign({},{},t)
						break;
					}
				}
			}
		}
		this.content = Object.assign([],[],this.content)
	},
	sortdown(text){
		let index = 0;
		for(var i in this.content){
			i = parseInt(i)
			if(this.content[i].text == text&&this.content[i+1]){
				let temp = Object.assign({},{},this.content[i])
				this.content[i] = Object.assign({},{},this.content[i+1])
				this.content[i+1] = Object.assign({},{},temp)
				break;
			}else if(this.content[i].children){
				let arr = this.content[i].children
				for(let j in arr){
					j = parseInt(j)
					if(arr[j].text == text&&this.content[i].children[j+1]){	
						let t = Object.assign({},{},arr[j])
						this.content[i].children[j] = Object.assign({},{},this.content[i].children[j+1])
						this.content[i].children[j+1] = Object.assign({},{},t)
						break;
					}
				}
			}
		}
		this.content = Object.assign([],[],this.content)
	},
	showAdd(key,mode){
		if(key==0){
			this.dialog.key = ''
			this.dialog.data.text = ''
			this.dialog.data.url = ''
			this.dialog.data.cid = ''
		}else{
			let item = this.getItem(key)
			this.dialog.key = item.text
			this.dialog.data.text = item.text
			this.dialog.data.url = item.url
			this.dialog.data.cid = item.cid
		}

		if(mode==1){
			this.dialog.data.text = ''
			this.dialog.data.url = ''
			this.dialog.data.cid = 0
		}

		this.dialog.mode = mode
		this.dialog.show = true
	},
	getItem(text){
		for(let i in this.content){
			if(this.content[i].text == text){
				return this.content[i];
			}else{
				if(this.content[i].children){
					let arr = this.content[i].children
					for(let j in arr){
						if(arr[j].text == text){
							return arr[j];
						}
					}
				}
			}
		}
	},
}
}
</script>
