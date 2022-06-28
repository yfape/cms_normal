<style scoped>
#login_main{width:100%;height:100%;background-color:#FFCDD2;}
#panel{width:547px;height:350px;}
#panel>div{height:100%;}
#leftimg{overflow:hidden;text-align:center;float:left;width:197px;}
#rightpanel{padding:20px 50px;text-align:center;float:left;width:350px;}
#systitle{width:100%;text-align:center;font-size:20px;font-weight:bold;padding-top:10px;padding-bottom:20px;}
.jg{margin-bottom:13px;}
#loginbtn{background: linear-gradient(to right,#C80022,#FFCDD2);}
#info{position:absolute;font-size:12px;bottom:0px;right:5px;color:#fff}
</style>
<template><div id="login_main" class="row justify-center items-center bg-red-4">
	<div id="panel" class="bg-white shadow-5">
		<div id="leftimg">
			<q-carousel animated v-model="slide" infinite :autoplay="2000" style="height:100%;width:197px;">
				<q-carousel-slide v-for="item in leftimg" :name="item.id" :img-src="item.img"/>
			</q-carousel>
		</div>
		<div id="rightpanel">
			<q-img src="/static/sys/logo1.png" style="height:60px;width:140px;" class="jg"/>
			<q-input class="jg" autofocus dense filled v-model="logindata.user" label="用户名" color="red-10"/>
			<q-input class="jg" dense filled v-model="logindata.pass" label="密码" color="red-10" type="password" autocomplete="new-password"/>
			<q-input class="jg" dense filled v-model="logindata.vercode" label="登陆码" color="red-10">
				<template v-slot:append>
					<q-btn flat :disable="logincode.disable" :label="logincode.disable?logincode.time+'秒':'获取'" @click="getLoginCode"/>
				</template>
			</q-input>
			<q-btn :loading="btn.loading1" label="登录" id="loginbtn" class="full-width" unelevated color="logocolor" @click="login"/>
			<div class="full-width text-right"><q-btn label="忘记密码" flat dense unelevated color="grey-5" style="font-size:12px;"/></div>
		</div>
	</div>
	<div id="info">&copy;{{config.copy}}</div>
	<embed id="ViKeyInterface"  type="application/npViKeyInterface-plugin" style="height: 0;width: 0; "> </embed>
</div></template>
<script>
export default{
	name:'login',
	data:()=>({
		btn:{
			loading1:false,
		},
		logincode:{disable:false,time:60,timer:''},
		config:{
			copy:'中国共产党四川省委员会《四川党的建设》杂志社'
		},
		slide:1,
		leftimg:[
			{id:1,img:'/static/loginimg/left1.png'},
			{id:2,img:'/static/loginimg/left2.png'},
		],
		logindata:{
			user:'',pass:'',vercode:'',mode:0,
		}
	}),
	created(){},
	mounted(){},
	methods:{
		login(){
			this.btn.loading1 = true
			if(!this.checkPostNull()){
				this.AItip('输入框不能为空')
				this.btn.loading1 = false
				return
			}
			this.axios.post('login',this.logindata).then(response=>{console.log(response)
				if(this.lStorage('token',response.token)){
					this.$store.state.token = response.token
					this.$router.replace('/')
				}else{
					this.AItip('<div>抱歉，您的浏览器未启用storage存储权限，请联系技术人员</div>');
				}
				this.btn.loading1 = false
			}).catch(err=>{
				this.btn.loading1 = false
			})
		},
		checkPostNull(){
			if(this.logindata.user&&this.logindata.pass&&this.logindata.vercode){
				return true
			}else{
				return false
			}
		},
		getLoginCode(){
			if(this.logincode.disable){
				return
			}
			let _this = this
			this.logincode.timer = setInterval(function(){
				if(_this.logincode.time>0){
					_this.logincode.time-=1
				}else{
					_this.logincode.disable = false
					_this.logincode.time = 60
					clearInterval(_this.logincode.timer);
				}
			},1000)
			this.logincode.disable = true
			this.axios.post('vercode',{user:this.logindata.user})
		},
	}
}
</script>