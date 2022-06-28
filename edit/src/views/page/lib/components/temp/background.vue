<template><div>
	<upload1 class="q-mt-sm" intro="背景图" :img.sync="data.bi"/>
	<q-input filled dense label="背景色" color="red-10" v-model="data.bc" class="q-mt-sm" @input="reflesh">
        <template v-slot:append>
          	<q-icon name="colorize" class="cursor-pointer">
            	<q-popup-proxy transition-show="scale" transition-hide="scale">
              		<q-color v-model="data.bc" format-model="hex" no-header/>
            	</q-popup-proxy>
          	</q-icon>
          	<q-btn flat icon="close" dense @click="data.bc='transparent'"/>
        </template>
    </q-input>
</div></template>
<script>
import upload1 from '@/components/upload1'
export default{
name:'background',
components:{upload1},
props:['data'],
data(){return {

}},
mounted(){},
methods:{
	reflesh(){this.$emit('update:data',this.data)}
},
watch:{},
destroy(){},
}
</script>
<style scoped>

</style>