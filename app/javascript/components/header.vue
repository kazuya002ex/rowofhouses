<template>
  <div>
    <ul id="dropdown" class="dropdown-content">
      <li><router-link to="/" v-if="signedIn">全て</router-link></li>
      <li><router-link to="/still" v-if="signedIn">未完了</router-link></li>
      <li><router-link to="/checked" v-if="signedIn">完了</router-link></li>
      <li><router-link to="/signin" v-if="!signedIn">ログイン</router-link></li>
      <li><router-link to="/signup" v-if="!signedIn">新規登録</router-link></li>
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


<style scoped>

  div {
    padding-top: 30px;
    padding-bottom: 80px;
  }

  li {
    list-style: none;
  }

  .dropdown-content {
    float: left;
    width: 100%;
  }

  .dropdown-content li {
    float: left;
    padding: 20px;
  }
</style>