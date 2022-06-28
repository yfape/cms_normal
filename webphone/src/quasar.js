import Vue from 'vue'
import langzhhans from 'quasar/lang/zh-hans'

import 'quasar/dist/quasar.css'
import '@quasar/extras/material-icons-round/material-icons-round.css'
import '@quasar/extras/material-icons-outlined/material-icons-outlined.css'
import '@quasar/extras/material-icons/material-icons.css'

import { Quasar,Loading } from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: { /* not needed if importStrategy is not 'manual' */ },
  directives: { /* not needed if importStrategy is not 'manual' */ },
  plugins: { Loading
  },
  lang: langzhhans
 })