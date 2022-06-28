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
    main.AItip(response.data.msg)
    return response.data.data;
  },
  function(error){
    if(error.response.status === 999){
      main.AItip(error.response.data.msg)
      return Promise.reject(error);
    }else if(error.response.status === 998){
      main.AItip(error.response.data.msg)
      main.$router.push('/login');
      return Promise.reject(error);
    }else{
      main.AItip(error)
      return Promise.reject(error);
    }
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
