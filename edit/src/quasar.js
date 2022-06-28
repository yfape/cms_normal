import Vue from 'vue'
import langzhhans from 'quasar/lang/zh-hans'

import './styles/quasar.sass'
import '@quasar/extras/material-icons/material-icons.css'
import '@quasar/extras/material-icons-outlined/material-icons-outlined.css'
import { Quasar,Notify,Dialog,Loading,Mutation } from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: { /* not needed if importStrategy is not 'manual' */ },
  directives: { Mutation },
  plugins: {
  	Notify,Dialog,Loading
  },
  lang: langzhhans
 })