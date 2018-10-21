import Vue from 'vue'
import './cube-ui'
import App from './App.vue'
import router from './router'

import './style/normalize.css'
import 'amfe-flexible'

Vue.config.productionTip = false

import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:8080'
axios.defaults.headers.post['Content-Type'] =
  'application/x-www-form-urlencoded'
axios.defaults.headers.get['Content-Type'] = 'application/x-www-form-urlencoded'
axios.defaults.transformRequest = [
  function(data) {
    let ret = ''
    for (let it in data) {
      ret += encodeURIComponent(it) + '=' + encodeURIComponent(data[it]) + '&'
    }
    return ret
  }
]

Vue.prototype.toast = function toast(message) {
  this.$createToast({
    txt: message,
    type: 'txt'
  }).show()
}

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
