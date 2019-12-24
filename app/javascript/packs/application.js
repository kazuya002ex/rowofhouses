import Vue from 'vue'
import App from './App.vue'
import Router from '../router/router'
import Store from '../store/store.js'
import VueAxios from 'vue-axios'
import Vuetify from 'vuetify'
import moment from 'moment'
import { securedAxiosInstance, plainAxiosInstance } from '../backend/axios/axios.js'

Vue.use(Vuetify)
Vue.use(moment)

Vue.config.productionTip = false
Vue.use(VueAxios, {
    secured: securedAxiosInstance,
    plain: plainAxiosInstance
})

const app = new Vue({
    el: '#app',
    router: Router,
    store: Store,
    securedAxiosInstance,
    plainAxiosInstance,
    render: h => h(App)
})