import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../pages/index.vue'
import Still from '../pages/still.vue'
import Checked from '../pages/checked.vue'
import Signup from '../pages/signupForm.vue'
import Signin from '../pages/loginForm.vue'

Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Index },
        { path: '/still', component: Still },
        { path: '/checked', component: Checked },
        { path: '/signup', component: Signup },
        { path: '/signin', component: Signin },
    ],
})