<template>
  <div>
    <ul id="dropdown" class="dropdown-content">
      <li><router-link to="/">全て</router-link></li>
      <li><router-link to="/still">未完了</router-link></li>
      <li><router-link to="/checked">完了</router-link></li>
      <li><router-link to="/signin">ログイン</router-link></li>
      <li><router-link to="/signup">新規登録</router-link></li>
      <li><a href="/" v-if="signedIn" @click="signOut">ログアウト</a></li>
    </ul>
  </div>
</template>


<script>
  import { mapState } from 'vuex'

  export default {
	name: 'Header',
	computed: mapState([
      'signedIn'
	]),
	mounted: function() {
      this.$store.dispatch('doFetchSignedIn')
	},
	methods: {
      setError(error, text) {
		this.error = (error.response && error.response.data && error.response.data.error) || text
	  },
	  signOut() {
		this.$http.secured.delete(`/api/signin`)
		  .then(response => {
			delete localStorage.csrf
			delete localStorage.signedIn
		  })
		  .catch(error => this.setError(error, 'Cannot sign out'))
	  }
	}
  }
</script>