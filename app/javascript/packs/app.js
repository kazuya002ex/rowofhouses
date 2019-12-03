import Vue from 'vue/dist/vue.esm.js'
import Header from './components/header.vue'
import Router from './router/router'

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
  }
})