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
				<div class="row" style="background:transparent;width:1100px;margin:0 auto">
					<div class="col-3 bg-grey-2" style="min-height:1080px">
						<div class="q-px-lg q-pt-md">
							<q-img class="shadow-4" :src="magazine.img"/>
						</div>
						<div class="q-py-sm q-my-sm text-h6 text-bold text-center bg-grey-4">{{magazine.title}}</div>

						<div class="text-center">
							<q-btn class="q-ml-sm" flat round color="red-10" @click="">
						        <img src="static/weixin.gif" style="width:30px;"/>
						        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
						        分享至微信
						        </q-tooltip>
						    </q-btn>
						    <q-btn class="q-ml-sm" flat round color="red-10" @click="">
						        <img src="static/weixinquan.gif" style="width:23px;"/>
						        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
						         分享至朋友圈
						        </q-tooltip>
						    </q-btn>
						    <q-btn class="q-ml-sm" flat round color="red-10" @click="">
						        <img src="static/weibo.gif" style="width:30px;"/>
						        <q-tooltip anchor="center right" self="center left" transition-show="flip-right" transition-hide="flip-left">
						         分享至新浪微博
						        </q-tooltip>
						    </q-btn>
						</div>

						<div class="q-mt-sm row justify-center">
							<div id="qrcode"></div>
						</div>
						<div class="text-center text-grey text-caption">本页二维码</div>

						<div class="q-mt-md row justify-center">
							<div id="qrcode2"></div>
						</div>
						<div class="text-center text-grey text-caption">电子版二维码</div>
						<div class="q-mt-md text-center">
							<q-btn label="本期电子版" color="red-10" class="q-px-md"/>
						</div>
					</div>
					<div class="col-9 q-px-md q-py-sm">
						<div v-for="item,index in magazine.content">
							<q-item :clickable="item.text=='0'" @click="goArticle(item.aid)">
					            <q-item-section>
					            	<q-item-label :lines="1" :class="{'text-bold':item.text=='1','text-h5':item.text=='1','text-h6':item.text=='0'}">
					            		{{item.title}}
					            	</q-item-label>
					            </q-item-section>
					        </q-item>
					        <q-separator v-if="item.text=='0'" inset/>
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
import QRCode from "qrcodejs2"

export default{
name:'magazine',
props:['zid'],
components:{header4,QRCode}, 
data:()=>({
	show:false,
	magazine:{},
}),
mounted(){
	this.getData()
},
methods:{
	getData(){
		this.axios.get('magazine/'+this.zid).then(response=>{
			if(response.code==200){
				this.magazine = Object.assign({},{},response.data)
				this.show = true
				this.$nextTick (function () {
			       	this.qrcode();
			       	this.qrcode2();
			    })
			}else{
				this.$router.replace('/error')
			}
		})
	},
	qrcode () {
        let that = this;
        let qrcode = new QRCode('qrcode', {
            width: 124,
            height: 124,        // 高度
            text: window.location.href,   // 二维码内容
            // render: 'canvas' ,   // 设置渲染方式（有两种方式 table和canvas，默认是canvas）
            // background: '#f0f',   // 背景色
            // foreground: '#ff0'    // 前景色
        })
    },
    qrcode2 () {
        let that = this;
        let qrcode = new QRCode('qrcode2', {
            width: 124,
            height: 124,        // 高度
            text: 'http://ebook.scdjw.com.cn/?id='+this.zid,   // 二维码内容
            // render: 'canvas' ,   // 设置渲染方式（有两种方式 table和canvas，默认是canvas）
            // background: '#f0f',   // 背景色
            // foreground: '#ff0'    // 前景色
        })
    },
},
watch:{

}
}
</script>