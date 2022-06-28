<template>
  <div>
    <div class="q-py-sm">
      <div class="text-grey-8">内容风险评估</div>
      <q-separator/>
      <div v-if="textcensor=='1'">
        <q-item clickable v-ripple dense>
          <q-item-section>
            <div class="full-width">文本色情</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
          </q-item-section>
        </q-item>
        <q-item clickable v-ripple dense>
          <q-item-section>
            <div class="full-width">暴恐违禁</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
          </q-item-section>
        </q-item>
        <q-item clickable v-ripple dense>
          <q-item-section>
            <div class="full-width">政治敏感</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
          </q-item-section>
        </q-item>
        <q-item clickable v-ripple dense>
          <q-item-section>
            <div class="full-width">官方违禁词库</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
          </q-item-section>
        </q-item>
        <q-item clickable v-ripple dense>
          <q-item-section>
            <div class="full-width">自定义违禁词库</div>
          </q-item-section>
          <q-item-section slide>
            <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
          </q-item-section>
        </q-item>
      </div>
      <q-item clickable v-ripple v-for="item in textcensor" v-if="textcensor!='1'">
        <q-item-section>
          <q-item-label class="text-center" caption>{{item.msg}}</q-item-label>
          <q-item-label class="text-center text-body2">
            <span class="q-px-sm" v-for="i in item.words">{{i}}</span>
          </q-item-label>
        </q-item-section>
      </q-item>
    </div>
    <div class="q-py-sm">
      <div class="text-grey-8">文字纠错检查-(测试)</div>
      <q-separator/>
      <q-item clickable v-ripple dense v-if="ecnet=='1'">
        <q-item-section>
          <div class="full-width">未发现错误</div>
        </q-item-section>
        <q-item-section slide>
          <div class="text-right"><q-icon color="green-5" name="verified_user"/></div>
        </q-item-section>
      </q-item>
      <q-item clickable v-ripple dense v-for="item in ecnet" v-if="ecnet!='1'">
        <q-item-section>
          {{item.error_text}}
        </q-item-section>
        <q-item-section class="text-center">
          <div><q-icon size="22px" name="trending_flat"/></div>
        </q-item-section>
        <q-item-section class="text-right">
          {{item.correct_text}}
        </q-item-section>
      </q-item>
    </div>
  </div>
</template>
<script>
export default{
  name:'checkinfo',
  props:['textcensor','ecnet'],
}
</script>