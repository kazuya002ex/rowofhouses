import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import Still from '../components/still.vue'
import Checked from '../components/checked.vue'
import Signup from '../components/signupForm.vue'
import Login from '../components/loginForm.vue'

Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Index },
        { path: '/still', component: Still },
        { path: '/checked', component: Checked },
        { path: '/signup', component: Signup },
        { path: '/login', component: Login },
    ],
})