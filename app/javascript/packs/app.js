import Vue from 'vue/dist/vue.esm.js'
import Header from './components/header.vue'
import UserHeader from './components/userHeader.vue'
import Router from './router/router'
import VueAxios from 'vue-axios'
import { securedAxiosInstance, plainAxiosInstance } from '../backend/axios/axios.js'

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        render: h => h(Index)
    }).$mount()
    document.body.appendChild(app.$el)
})

var haeder = new Vue({
    router: Router,
    el: '#header',
    components: {
        'navbar': Header,
        'usermenu': UserHeader,
    }
})