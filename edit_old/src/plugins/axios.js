import Vue from 'vue';
import axios from "axios";
import main from '../main.js';

// Full config:  https://github.com/axios/axios#request-config
axios.defaults.baseURL = 'http://api.scdjw.net';
// axios.defaults.headers.common['Authorization'] = '';
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded,multipart/form-data';


let config = {
  // baseURL: process.env.baseURL || process.env.apiUrl || ""
  // timeout: 60 * 1000, // Timeout
  // withCredentials: true, // Check cross-site Access-Control
};

const _axios = axios.create(config);

_axios.interceptors.request.use(
  function(config) {
    config.headers['Authorization'] = main.$store.state.token
    // Do something before request is sent
    return config;
  },
  function(error) {
    // Do something with request error
    return Promise.reject(error);
  }
);

// Add a response interceptor
_axios.interceptors.response.use(
  function(response) {
    var arr = [1003,1011,1012,1013,1014,1015,1016];
    let code = response.data.code;
    if(arr.indexOf(code)>-1){
      main.AItip(response.data.msg);
      main.$router.push('/login');
      return;
    }

    if(code!=200){
      main.AItip(response.data.msg);
      _axios.interceptors.response.handler.rejected()
    }else if(code==200){
      return response.data.data;
    }
  },
  function(error){
    main.AItip(error)
    return Promise.reject(error);
  }
);

Plugin.install = function(Vue, options) {
  Vue.axios = _axios;
  window.axios = _axios;
  Object.defineProperties(Vue.prototype, {
    axios: {
      get() {
        return _axios;
      },
      post(){
        return _axios;
      },
      put(){
        return _axios;
      },
      patch(){
        return _axios;
      },
      delete(){
        return _axios;
      },
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
