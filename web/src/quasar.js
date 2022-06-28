import Vue from 'vue'

import './styles/quasar.sass'
import '@quasar/extras/material-icons/material-icons.css'
import { Quasar,AppFullscreen,Notify,Scroll,Loading } from 'quasar'

Vue.use(Quasar, {
  config: {Loading},
  components: { /* not needed if importStrategy is not 'manual' */ },
  directives: { Scroll },
  plugins: {
  	AppFullscreen,Notify,Loading
  }
 })