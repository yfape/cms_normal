<style>
#chart1{height:220px}
.edi{width:65px;}
.cre{width:90px}
.vie{width: 60px}
.heightlim{height:328px;overflow-y:auto;}
.textshadow{text-shadow:0.5px 0.5px 0.5px #000}
.thinborder{box-shadow:0.3px 0.3px 0.3px #B8B6B6,-0.3px -0.3px 0.3px #B8B6B6}
</style>
<template>
<div>
	<div class="row">
		<div class="col-3 q-pa-md">
			<q-item class="bg-white q-py-md q-px-lg" clickable v-ripple>
				<q-item-section avatar><q-spinner-bars color="red-6" size="36px"/></q-item-section>
				<q-item-section>
					<q-item-label caption class="text-weight-thin">本月点击量</q-item-label>
					<q-item-label class="text-h6 text-bold">{{viewnum.num.toLocaleString()}}</q-item-label>
				</q-item-section>
				<q-item-section avatar style="border-left:1px solid #F0ECEC" class="q-px-sm">
					<q-item-label :lines="1" caption class="text-weight-thin">今日新增：<span class="text-red-5">{{viewnum.today}}</span></q-item-label>
					<q-item-label :lines="1" caption class="text-weight-thin">增速：<span class="text-green-5">+{{viewnum.inc}}/h</span></q-item-label>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-3 q-pa-md">
			<q-item class="bg-white q-py-md q-px-lg" clickable v-ripple>
				<q-item-section avatar><q-spinner-cube color="red-6" size="36px"/></q-item-section>
				<q-item-section>
					<q-item-label caption class="text-weight-thin">本月文章数</q-item-label>
					<q-item-label class="text-h6 text-bold">{{article.num.toLocaleString()}}</q-item-label>
				</q-item-section>
				<q-item-section avatar style="border-left:1px solid #F0ECEC" class="q-px-sm">
					<q-item-label :lines="1" caption class="text-weight-thin">今日新增：<span class="text-red-5">{{article.create}}</span></q-item-label>
					<q-item-label :lines="1" caption class="text-weight-thin">今日审核：<span class="text-green-5">{{article.audit}}</span></q-item-label>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-3 q-pa-md">
			<q-item class="bg-white q-py-md q-px-lg" clickable v-ripple>
				<q-item-section avatar><q-spinner-comment color="red-6" size="36px"/></q-item-section>
				<q-item-section>
					<q-item-label caption class="text-weight-thin">平台累计用户量</q-item-label>
					<q-item-label class="text-h6 text-bold">{{member.num.toLocaleString()}}</q-item-label>
				</q-item-section>
				<q-item-section avatar style="border-left:1px solid #F0ECEC" class="q-px-sm">
					<q-item-label :lines="1" caption class="text-weight-thin">今日新增：<span class="text-red-5">{{member.today}}</span></q-item-label>
					<q-item-label :lines="1" caption class="text-weight-thin">增速：<span class="text-red-5" v-if="member.inc>=0">+{{member.inc}}/h</span><span class="text-green-5" v-if="member.inc<0">{{member.inc}}/h</span></q-item-label>
				</q-item-section>
			</q-item>
		</div>
		<div class="col-3 q-pa-md">
			<q-item class="bg-white q-py-md q-px-lg" clickable v-ripple style="height:74px">
				<q-item-section>
					<q-item-label caption class="text-weight-thin">系统盘</q-item-label>
					<q-linear-progress stripe style="height:20px;" :value="disk.systemra" color="green" class="q-mt-sm thinborder">
						<div class="text-center text-red-14 text-caption">{{disk.system?disk.system:'0G/0G'}}</div>
					</q-linear-progress>
				</q-item-section>
				<q-item-section>
					<q-item-label caption class="text-weight-thin">数据盘</q-item-label>
					<q-linear-progress stripe style="height:20px;" :value="disk.datara" color="green" class="q-mt-sm thinborder">
						<div class="text-center text-red-14 text-caption">{{disk.data?disk.data:'0G/0G'}}</div>
					</q-linear-progress>
				</q-item-section>
				
			</q-item>
		</div>
	</div>
	<div class="row q-pa-md">
		<div class="q-pa-md text-title1 text-weight-thin text-grey full-width bg-white">点击量曲线</div>
		<div class="full-width bg-white" style="height:300px">
			<canvas id="chart1" class="full-width"></canvas>
		</div>
	</div>
	<div class="row">
		<div class="col-4 q-pa-md">
			<div class="row q-gutter-md ">
				<q-btn label="发文章" icon="list_alt" stack color="green-8" size="16px" @click="$router.push('artedit/0')"/>
				<q-btn label="审文章" :disable="$store.state.user.identity>2" icon="image_search" stack color="red-8" size="16px" @click="$router.push('artaudit')"/>
				<q-btn label="修改个人信息" icon="face" stack color="brown-4" size="16px" @click="$router.push('userinfo')"/>
				<q-btn label="管理栏目" :disable="$store.state.user.identity>3" icon="list" stack color="teal-4" size="16px" @click="$router.push('colmessage')"/>
				<q-btn label="管理导航" :disable="$store.state.user.identity>3" icon="vertical_split" stack color="cyan-4" size="16px" @click="$router.push('navmessage')"/>
				<q-btn label="改首页" :disable="$store.state.user.identity>3" icon="home" stack color="orange-10" size="16px" @click="$router.push('homemessage')"/>
				<q-btn label="改模块" :disable="$store.state.user.identity>3" icon="view_quilt" stack color="amber-10" size="16px" @click="$router.push('modmessage')"/>
				<q-btn label="管理杂志" :disable="$store.state.user.identity>3" icon="turned_in_not" stack color="brown-4" size="16px" @click="$router.push('magazine')"/>
				<q-btn label="管理专题" :disable="$store.state.user.identity>3" icon="view_carousel" stack color="red-5" size="16px" @click="$router.push('topics')"/>
			</div>
		</div>
		<div class="col-4 q-pa-md">
			<div class="bg-white heightlim">
				<div class="q-pa-sm text-title1 text-weight-thin row">
					<div>月度点击量排行</div>
					<q-space/>
					<div>{{month}}</div>
				</div>
				<q-separator/>
				<q-item dense>
					<q-item-section class="text-weight-thin">标题</q-item-section>
					<q-item-section avatar class="edi text-weight-thin">编辑</q-item-section>
					<q-item-section avatar class="cre text-weight-thin">发布时间</q-item-section>
					<q-item-section avatar class="vie text-weight-thin">点击量</q-item-section>
				</q-item>
				<q-item dense clickable v-for="item in articleviewnum">
					<q-item-section><q-item-label :lines="1">{{item.title}}</q-item-label></q-item-section>
					<q-item-section avatar class="edi">{{item.editor}}</q-item-section>
					<q-item-section avatar class="cre">{{getLocalTime(item.createdate)}}</q-item-section>
					<q-item-section avatar class="vie">{{item.viewnum}}</q-item-section>
				</q-item>
			</div>
		</div>
		<div class="col-4 q-pa-md" style="height:328px;">
			<div class="full-height">
				<div class="q-pa-sm text-title1 text-weight-thin row bg-white">
					<div>月度编辑发稿统计</div>
					<q-space/>
					<div>{{month}}</div>
				</div>
				<q-separator/>
				<div class="full-width bg-white" style="height:290px">
					<canvas id="canvas2" class="full-width"></canvas>
				</div>
				
			</div>
		</div>
	</div>
</div>
</template>

<script>
import Schart from 'schart.js';


export default {
	name: 'datacenter',
  	components:{},
	data:()=>({
		show:false,month:'',
		viewnum:{
			num:0,today:0,inc:0,
		},
		article:{
			num:0,create:0,audit:0
		},
		member:{
			num:0,today:0,inc:0
		},
		line:{
			indate:[],data:[]
		},
		editor:{editor:[],data:[]},
		disk:{data:'',system:'',datara:0},
		articleviewnum:[]
	}),
	created(){
		this.setMonth()
	},
	mounted(){
		this.getData()
	},
	methods:{
		setchart1(){
			const options = {
			    type: 'line',
			    topPadding:20,leftPadding:70,bottomPadding:40,rightPadding:40,
			    legend:{display:false,top:0},
			    bgColor: '#fff',
			    labels: this.line.indate,
		    	datasets: [{
			        data: this.line.data,
			        fillColor:'#B71C1C'
			    }]
			};
			new Schart('chart1', options);
		},
		setchart2(){
			const options = {
			    type: 'ring',
			    showValue: true,
			    topPadding:0,leftPadding:0,bottomPadding:0,rightPadding:0,radius:100,innerRadius:70,
			    legend: {
			        position: 'bottom',
			        bottom:20
			    },
			    bgColor: '#fff',
			    labels: this.editor.editor,
			    datasets: [{
			        data: this.editor.data
			    }]
			}
			new Schart('canvas2', options);
			
		},
		getData(){
			this.$q.loading.show()
			this.axios.post('getDataCenter').then(res=>{
				this.setMember(res.member)
				this.setViewnum(res.viewnum)
				this.setArticle(res.article)
				this.setToday(res.today)
				this.setLine(res.line)
				this.setEditor(res.editor)
				this.setDisk(res.disk)
				this.setArticleVn(res.articleviewnum)
				this.$q.loading.hide()
			}).then(err=>{
	
			})
		},
		setMember(member){
			let zero = new Date(new Date().toLocaleDateString()).getTime()
			let tn = Date.parse(new Date())
			let k = (tn-zero)/1000/3600
			this.member.inc = Math.round(member.today/k)
			this.member.today = member.today
			this.member.num = member.num
		},
		setViewnum(viewnum){
			let zero = new Date(new Date().toLocaleDateString()).getTime()
			let tn = Date.parse(new Date())
			let k = (tn-zero)/1000/3600
			this.viewnum.inc = Math.round(viewnum.today/k)
			this.viewnum.num = viewnum.num
			this.viewnum.today = viewnum.today
		},
		setArticle(article){
			this.article.num = article.num
		},
		setToday(today){
			this.article.create = today.create
			this.article.audit = today.audit
		},
		setLine(line){
			this.line.indate = Object.assign([],[],line.map(x => {return x.indate}))
			this.line.data = Object.assign([],[],line.map(x => {return x.num}))
			this.line.indate =  Object.assign([],[],this.line.indate.reverse())
			this.line.data =  Object.assign([],[],this.line.data.reverse())
			this.setchart1()
		},
		setEditor(editor){
			this.editor.editor = Object.assign([],[],editor.map(x => {return x.editor}))
			this.editor.data = Object.assign([],[],editor.map(x => {return x.num}))
			this.setchart2()
		},
		setDisk(disk){
			this.disk.data = disk.data
			this.disk.datara = disk.datara
			this.disk.system = disk.system
			this.disk.systemra = disk.systemra
		},
		setArticleVn(articleviewnum){
			this.articleviewnum = Object.assign([],[],articleviewnum)
		},
		setMonth(){
			var date = new Date();
			let year = date .getFullYear();
			let month = date .getMonth()+1;
			this.month = year+'年'+month+'月'
		},
	
	}	
}
</script>
