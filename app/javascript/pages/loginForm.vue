<template>
  <div>
    <h1>Login!</h1>
      <form @submit.prevent="signin">
        <li>名前</li>
        <input type="text" v-model="name">

        <li>パスワード</li>
        <input type="password" v-model="password">

        <button>ログイン</button>
      </form>
  </div>
</template>


<script>
export default {
  name: 'Signin',
  data() {
    return {
      name: '',
      password: '',
      error: '',
    }
  },
  created() {
    this.checkSignedIn()
  },
  updated() {
    this.checkSignedIn()
  },
  methods: {
    signin() {
      this.$http.plain.post('/api/signin', { name: this.name, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful(response) {
      if (!response.data.csrf) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.$store.dispatch('doFetchSignedIn')
      this.error = ''
      this.$router.replace('/')
    },
    signinFailed(error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>