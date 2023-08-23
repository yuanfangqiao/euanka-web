import Vue from 'vue'
import App from './App.vue'


const {promiseBaseUrl}=document.querySelector('html').dataset
if(promiseBaseUrl){
  Vue.prototype.$baseUrl=`${promiseBaseUrl}`
}else{
  Vue.prototype.$baseUrl=process.env.VUE_APP_API_BASE_URL
}

Vue.config.productionTip = false
new Vue({
  render: h => h(App),
}).$mount('#app')



