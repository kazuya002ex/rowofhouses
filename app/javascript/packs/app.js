import Vue from 'vue/dist/vue.esm.js'
import Header from '../components/header.vue'
import UserHeader from '../components/userHeader.vue'
import Router from '../router/router'
import VueAxios from 'vue-axios'
import Store from '../store/store.js'
import { securedAxiosInstance, plainAxiosInstance } from '../backend/axios/axios.js'

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(Index)
    }).$mount()
    document.body.appendChild(app.$el)
})

Vue.config.productionTip = false
Vue.use(VueAxios, {
    secured: securedAxiosInstance,
    plain: plainAxiosInstance
})

var haeder = new Vue({
    router: Router,
    store: Store,
    securedAxiosInstance,
    plainAxiosInstance,
    el: '#header',
    components: {
        'navbar': Header,
        'usermenu': UserHeader,
    }
})