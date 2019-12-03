import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import Still from '../components/still.vue'
import Checked from '../components/checked.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/still', component: Still },
    { path: '/checked', component: Checked },
  ],
})