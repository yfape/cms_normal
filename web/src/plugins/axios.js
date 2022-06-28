import Vue from 'vue';
import axios from "axios";
import main from '../main.js';

// Full config:  https://github.com/axios/axios#request-config
axios.defaults.baseURL = 'http://data.scdjw.net';
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

let config = {
  // baseURL: process.env.baseURL || process.env.apiUrl || ""
  // timeout: 60 * 1000, // Timeout
  // withCredentials: true, // Check cross-site Access-Control
};

const _axios = axios.create(config);

_axios.interceptors.request.use(
  function(config) {
    if(config.url.indexOf('list/')==-1){
      main.$q.loading.show()
    }
    // Do something before request is sent
    return config;
  },
  function(error) {
    main.$q.loading.hide()
    // Do something with request error
    return Promise.reject(error);
  }
);

// Add a response interceptor
_axios.interceptors.response.use(
  function(response) {
    main.$q.loading.hide()
    return response.data.data;
  },
  function(error){
    main.$q.loading.hide()
    main.$router.push('/error')
  }
);

Plugin.install = function(Vue, options) {
  Vue.axios = _axios;
  window.axios = _axios;
  Object.defineProperties(Vue.prototype, {
    axios: {
      get() {
        return _axios;
      }
    },
    $axios: {
      get() {
        return _axios;
      }
    },
  });
};

Vue.use(Plugin)

export default Plugin;
