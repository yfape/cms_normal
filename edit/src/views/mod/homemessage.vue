<template>
<div class="q-pa-md">
    <div style="overflow-y:auto;" :style="{height:height+'px'}">
    	<home></home>
    </div>
</div>
</template>

<script>
import home from '@/components/web/home'
export default {
name: 'homemessage',
components:{home},
data:()=>({
	tab:0,height:0
}),
created(){
	this.setHeight()
},
mounted(){

},
methods:{
	setHeight(){
      let height = document.body.clientHeight
      this.height = height-100
    }
}
}
</script>
